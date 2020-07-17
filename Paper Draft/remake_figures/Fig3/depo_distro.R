rm(list = ls())
graphics.off()

library(ggplot2)
library(knitr)
library(readxl)
library(listviewer)
library(ggpubr)

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
  # TreeTable = as.data.frame(read.csv(list.files(pattern = "TreeTable")))
  # LobeDep = as.data.frame(read.csv(list.files(pattern = "LobesDeposition")))
  # SublobDep = as.data.frame(read.csv(list.files(pattern = "SublobesDeposition")))
  AciniDep = as.data.frame(read.csv(list.files(pattern = "NearAciniDeposition")))
  assign(paste0(folder, "_data"), list(
    # # TreeTable = TreeTable,
    # LobeDep = LobeDep,
    # SublobDep = SublobDep,
    AciniDep = AciniDep
  ))
  setwd(wd)
  getinto("CSV_Data")
  
}

setwd(wd)
rm(AciniDep)

fs = 23

vlist = c("m10_data", "m27_data", "m34_data")

v = vlist[1]
d = get(v)
d$AciniDep[d$AciniDep$mean > 4,] = 4
p1 = ggplot(d$AciniDep, aes(x = mean)) + 
  geom_histogram(aes(y = ..density..), binwidth = 0.08, colour="#999999", fill="grey") +
  xlim(0,4) +
  ylim(0,1.6) + 
  ylab("") +
  xlab("Mean Aerosol Deposition (a.u.)") +
  geom_density(alpha=.2, fill="gray45") + 
  ggtitle(label = NULL, subtitle = NULL) + 
  theme_bw(base_size = fs)

# ggsave(filename = paste0(unlist(strsplit(v, "_"))[1], " Near Acini Aerosol Distro 1 micron.png"), 
#        device = "png", width = 10, height = 10)

v = vlist[2]
d = get(v)
d$AciniDep[d$AciniDep$mean > 4,] = 4
p2 = ggplot(d$AciniDep, aes(x = mean)) + 
  geom_histogram(aes(y = ..density..), binwidth = 0.08, colour="#999999", fill="grey") +
  xlim(0,4) +
  ylim(0,1.6) + 
  ylab("") +
  xlab("") +
  geom_density(alpha=.2, fill="gray45") + 
  ggtitle(label = NULL, subtitle = NULL) + 
  theme_bw(base_size = fs)

# ggsave(filename = paste0(unlist(strsplit(v, "_"))[1], " Near Acini Aerosol Distro 2 micron.png"), 
#        device = "png", width = 10, height = 10)

v = vlist[3]
d = get(v)
d$AciniDep[d$AciniDep$mean > 4,] = 4
p0.5 = ggplot(d$AciniDep, aes(x = mean)) + 
  geom_histogram(aes(y = ..density..), binwidth = 0.08, colour="#999999", fill="grey") +
  xlim(0,4) +
  ylim(0,1.6) + 
  ylab("Frequency") +
  xlab("") +
  geom_density(alpha=.2, fill="gray45") + 
  ggtitle(label = NULL, subtitle = NULL) +  
  theme_bw(base_size = fs)

# ggsave(filename = paste0(unlist(strsplit(v, "_"))[1], " Near Acini Aerosol Distro 0.5 micron.png"), 
#        device = "png", width = 10, height = 10)

p4 = ggarrange(p0.5, p1, p2, nrow = 1)

ggsave(filename = "Figure 3.png", plot = p4,
       device = "png", width = 16, height = 6, dpi = 1200)
