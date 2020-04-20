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

vlist = paste0(folder_list, "_data")
  
min_max = vector()
for(v in vlist){
  d = get(v)
  min_max = rbind(min_max,
  c(min(d$AciniDep$mean),
  max(d$AciniDep$mean)))
}
min_max
min(min_max[,1])
max(min_max[,2])

mean_hist = vector()
for(v in vlist){
  d = get(v)
  mean_hist = c(mean_hist, d$AciniDep$mean)
}
1-length(mean_hist[mean_hist>4])/length(mean_hist)