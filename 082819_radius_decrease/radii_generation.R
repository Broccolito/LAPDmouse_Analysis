library(knitr)
library(dplyr)
library(readxl)
library(ggplot2)
library(plotly)

graphics.off()
rm(list = ls())

get_directory = function(){
  args <- commandArgs(trailingOnly = FALSE)
  file <- "--file="
  rstudio <- "RStudio"
  match <- grep(rstudio, args)
  if(length(match) > 0){
    return(dirname(rstudioapi::getSourceEditorContext()$path))
  }else{
    match <- grep(file, args)
    if (length(match) > 0) {
      return(dirname(normalizePath(sub(file, "", args[match]))))
    }else{
      return(dirname(normalizePath(sys.frames()[[1]]$ofile)))
    }
  }
}

wd = get_directory()
setwd(wd)

tryCatch({
  load("Radii_Generation_data.RData")
}, error = function(e){
  csv_wd = paste0(wd, "/", "Airway_with_Generation")
  
  setwd(csv_wd)
  filelist = list.files(pattern = "csv")
  
  generation_data = vector()
  for(f in filelist){
    fn = unlist(strsplit(f, "_"))[1]
    data = read.csv(f)
    data = cbind.data.frame(data, data.frame(id = rep(fn, dim(data)[1])))
    generation_data = rbind.data.frame(generation_data, data)
  }
  
  generation_data = select(generation_data, id, label:name, generations)
  
  generation_data$id = with(generation_data, sapply(as.character(id), FUN = function(x){
    as.numeric(paste(unlist(strsplit(x,""))[-1], collapse = ""))
  }))
  
  setwd(wd)
  
  sample_data = read_excel("071519_sample_summary.xlsx")
  sample_data = select(sample_data, Name:PS, Q, pvleft:pvaccessory)
  names(sample_data)[names(sample_data) == "Name"] = "id"
  sample_data$id = with(sample_data, sapply(as.character(id), FUN = function(x){
    as.numeric(paste(unlist(strsplit(x,""))[-1], collapse = ""))
  }))
  
  # rg stands for radii and generation
  rg = left_join(generation_data, sample_data, by = "id")
  rg$name[rg$name == "Trachea"] = NA
  rg$name[rg$name == "RMB"] = NA
  save(rg, file = "Radii_Generation_data.RData")
  load("Radii_Generation_data.RData")
  rg <<- rg
})

# Get airway radius
get_radii = function(d){
  get_mean_radii = function(x,d){
    subrg = subset(d, generations == x)
    return(mean(subrg$radius, na.rm = TRUE))
  }
  get_sd_radii = function(x,d){
    subrg = subset(d, generations == x)
    return(sd(subrg$radius, na.rm = TRUE))
  }
  get_n = function(x,d){
    subrg = subset(d, generations == x)
    return(dim(subrg)[1])
  }
  gen = na.omit(unique(d$generations))
  return(data.frame(generation = gen, 
                    radius = sapply(gen, get_mean_radii, d),
                    std = sapply(gen, get_sd_radii, d),
                    n = sapply(gen, get_n, d)))
}

# Get airway length
get_length = function(d){
  get_mean_length = function(x,d){
    subrg = subset(d, generations == x)
    return(mean(subrg$length, na.rm = TRUE))
  }
  get_sd_length = function(x,d){
    subrg = subset(d, generations == x)
    return(sd(subrg$length, na.rm = TRUE))
  }
  get_n = function(x,d){
    subrg = subset(d, generations == x)
    return(dim(subrg)[1])
  }
  gen = na.omit(unique(d$generations))
  return(data.frame(generation = gen, 
                    length = sapply(gen, get_mean_length, d),
                    std = sapply(gen, get_sd_length, d),
                    n = sapply(gen, get_n, d)))
}

rg = rg[rg$generations <= 25,]
# rg = rg[rg$generations >= 3,]

overall_radii = get_radii(rg)
overall_radii$strain = "overall"
B6C3F1_radii = get_radii(subset(rg, Strain == "B6C3F1"))
B6C3F1_radii$strain = "B6C3F1"
BALBc_radii = get_radii(subset(rg, Strain == "BALB/c"))
BALBc_radii$strain = "BALB/c"
CD1_radii = get_radii(subset(rg, Strain == "CD-1"))
CD1_radii$strain = "CD-1"
C57BL_radii = get_radii(subset(rg, Strain == "C57BL/6"))
C57BL_radii$strain = "C57BL/6"


B6C3F1_cranial_radii = get_radii(subset(rg, Strain == "B6C3F1" & name == "CrRMB"))
B6C3F1_cranial_radii$strain = "B6C3F1"
B6C3F1_cranial_radii$lobe = "Cranial"

B6C3F1_caudal_radii = get_radii(subset(rg, Strain == "B6C3F1" & name == "CaRMB"))
B6C3F1_caudal_radii$strain = "B6C3F1"
B6C3F1_caudal_radii$lobe = "Caudal"

B6C3F1_left_radii = get_radii(subset(rg, Strain == "B6C3F1" & name == "LMB"))
B6C3F1_left_radii$strain = "B6C3F1"
B6C3F1_left_radii$lobe = "Left"

B6C3F1_middle_radii = get_radii(subset(rg, Strain == "B6C3F1" & name == "MiRMB"))
B6C3F1_middle_radii$strain = "B6C3F1"
B6C3F1_middle_radii$lobe = "Middle"

B6C3F1_accessory_radii = get_radii(subset(rg, Strain == "B6C3F1" & name == "AcRMB"))
B6C3F1_accessory_radii$strain = "B6C3F1"
B6C3F1_accessory_radii$lobe = "Accessory"



BALBc_cranial_radii = get_radii(subset(rg, Strain == "BALB/c" & name == "CrRMB"))
BALBc_cranial_radii$strain = "BALB/c"
BALBc_cranial_radii$lobe = "Cranial"

BALBc_caudal_radii = get_radii(subset(rg, Strain == "BALB/c" & name == "CaRMB"))
BALBc_caudal_radii$strain = "BALB/c"
BALBc_caudal_radii$lobe = "Caudal"

BALBc_left_radii = get_radii(subset(rg, Strain == "BALB/c" & name == "LMB"))
BALBc_left_radii$strain = "BALB/c"
BALBc_left_radii$lobe = "Left"

BALBc_middle_radii = get_radii(subset(rg, Strain == "BALB/c" & name == "MiRMB"))
BALBc_middle_radii$strain = "BALB/c"
BALBc_middle_radii$lobe = "Middle"

BALBc_accessory_radii = get_radii(subset(rg, Strain == "BALB/c" & name == "AcRMB"))
BALBc_accessory_radii$strain = "BALB/c"
BALBc_accessory_radii$lobe = "Accessory"


CD1_cranial_radii = get_radii(subset(rg, Strain == "CD-1" & name == "CrRMB"))
CD1_cranial_radii$strain = "CD-1"
CD1_cranial_radii$lobe = "Cranial"

CD1_caudal_radii = get_radii(subset(rg, Strain == "CD-1" & name == "CaRMB"))
CD1_caudal_radii$strain = "CD-1"
CD1_caudal_radii$lobe = "Caudal"

CD1_left_radii = get_radii(subset(rg, Strain == "CD-1" & name == "LMB"))
CD1_left_radii$strain = "CD-1"
CD1_left_radii$lobe = "Left"

CD1_middle_radii = get_radii(subset(rg, Strain == "CD-1" & name == "MiRMB"))
CD1_middle_radii$strain = "CD-1"
CD1_middle_radii$lobe = "Middle"

CD1_accessory_radii = get_radii(subset(rg, Strain == "CD-1" & name == "AcRMB"))
CD1_accessory_radii$strain = "CD-1"
CD1_accessory_radii$lobe = "Accessory"


C57BL_cranial_radii = get_radii(subset(rg, Strain == "C57BL/6" & name == "CrRMB"))
C57BL_cranial_radii$strain = "C57BL/6"
C57BL_cranial_radii$lobe = "Cranial"

C57BL_caudal_radii = get_radii(subset(rg, Strain == "C57BL/6" & name == "CaRMB"))
C57BL_caudal_radii$strain = "C57BL/6"
C57BL_caudal_radii$lobe = "Caudal"

C57BL_left_radii = get_radii(subset(rg, Strain == "C57BL/6" & name == "LMB"))
C57BL_left_radii$strain = "C57BL/6"
C57BL_left_radii$lobe = "Left"

C57BL_middle_radii = get_radii(subset(rg, Strain == "C57BL/6" & name == "MiRMB"))
C57BL_middle_radii$strain = "C57BL/6"
C57BL_middle_radii$lobe = "Middle"

C57BL_accessory_radii = get_radii(subset(rg, Strain == "C57BL/6" & name == "AcRMB"))
C57BL_accessory_radii$strain = "C57BL/6"
C57BL_accessory_radii$lobe = "Accessory"

radii_lobe_df = rbind.data.frame(
  B6C3F1_cranial_radii,BALBc_cranial_radii,C57BL_cranial_radii,CD1_cranial_radii,
  B6C3F1_caudal_radii,BALBc_caudal_radii,C57BL_caudal_radii,CD1_caudal_radii,
  B6C3F1_accessory_radii,BALBc_accessory_radii,C57BL_accessory_radii,CD1_accessory_radii, 
  B6C3F1_left_radii,BALBc_left_radii,C57BL_left_radii,CD1_left_radii,
  B6C3F1_middle_radii,BALBc_middle_radii,C57BL_middle_radii,CD1_middle_radii
)
radii_lobe_df$strain = as.factor(radii_lobe_df$strain)

radii_df = rbind.data.frame(B6C3F1_radii,BALBc_radii, 
                            CD1_radii, C57BL_radii)
radii_df$strain = as.factor(radii_df$strain)

save(radii_lobe_df, file = "radii_lobe_mean.RData")
save(radii_df, overall_radii, file = "radii_mean.RData")

