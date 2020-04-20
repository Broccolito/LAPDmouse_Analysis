rm(list = ls())
graphics.off()

library(ggplot2)
library(knitr)
library(readxl)
library(listviewer)

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

getinto = function(filename){
  if(!dir.exists(filename)){
    print("The file is not found...")
    stop("Wrong directory...")
  }else{
    setwd(paste(getwd(),"/",filename,sep = ""))
  }
}

# Read in data
wd = get_directory()
setwd(wd)

getinto("CSV_Data")

folder_list = list.files(pattern = "m")
for(folder in folder_list){
  
  getinto(folder)
  TreeTable = as.data.frame(read.csv(list.files(pattern = "TreeTable")))
  LobeDep = as.data.frame(read.csv(list.files(pattern = "LobesDeposition")))
  SublobDep = as.data.frame(read.csv(list.files(pattern = "SublobesDeposition")))
  AciniDep = as.data.frame(read.csv(list.files(pattern = "NearAciniDeposition")))
  assign(paste0(folder, "_data"), list(
    TreeTable = TreeTable,
    LobeDep = LobeDep,
    SublobDep = SublobDep,
    AciniDep = AciniDep
  ))
  setwd(wd)
  getinto("CSV_Data")
  
}

setwd(wd)
rm(SublobDep)
rm(TreeTable)
rm(AciniDep)
rm(LobeDep)

vlist = ls(pattern = "_data")

for(v in vlist){

  d = get(v)
  d$AciniDep[d$AciniDep$mean > 4,] = 4
  ggplot(d$AciniDep, aes(x = mean)) + 
    geom_histogram(aes(y = ..density..), binwidth = 0.08, colour="#999999", fill="grey") +
    xlim(0,4) +
    ylim(0,1.6) + 
    ylab("Distribution Density") +
    xlab("Mean Aerosol Deposition") +
    geom_density(alpha=.2, fill="gray45") + 
    ggtitle(paste0(unlist(strsplit(v, "_"))[1], " Near-acini Aerosol Deposition Distribution")) + 
    theme_bw(base_size = 16)
  ggsave(filename = paste0("overall/NearAcini_Distro/", unlist(strsplit(v, "_"))[1], " Near Acini Aerosol Distro.png"), 
         device = "png", width = 10, height = 10)
  
  # d = get(v)
  # d$AciniDep[d$SublobDep$mean > 4,] = 4
  # ggplot(d$SublobDep, aes(x = mean)) + 
  #   geom_histogram(aes(y = ..density..), bins = 30, colour="#999999", fill="grey") +
  #   geom_density(alpha=.2, fill="#FF6666") + 
  #   ggtitle(paste0(unlist(strsplit(v, "_"))[1], " Sublobar Level Aerosol Distro"))
  # ggsave(filename = paste0("overall/Sublobar_Distro/", unlist(strsplit(v, "_"))[1], " Sublobar Level Aerosol Distro.png"), 
  #        device = "png", width = 10, height = 10)
  # 
  # d = get(v)
  # d$AciniDep[d$LobeDep$mean > 4,] = 4
  # ggplot(d$LobeDep, aes(x = mean)) + 
  #   geom_histogram(aes(y = ..density..), bins = 5, colour="#999999", fill="grey") +
  #   geom_density(alpha=.2, fill="#FF6666") + 
  #   ggtitle(paste0(unlist(strsplit(v, "_"))[1], " Lobar Level Aerosol Distro"))
  # ggsave(filename = paste0("overall/Lobar_Distro/", unlist(strsplit(v, "_"))[1], " Lobar Level Aerosol Distro.png"), 
  #        device = "png", width = 10, height = 10)
  
}

beep()
