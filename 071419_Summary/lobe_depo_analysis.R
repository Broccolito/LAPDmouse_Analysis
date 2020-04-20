rm(list = ls())

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
    SublobDep = SublobDep
  ))
  setwd(wd)
  getinto("CSV_Data")
  
}

setwd(wd)
rm(SublobDep)
rm(TreeTable)
rm(AciniDep)
rm(LobeDep)

ordered_list = paste0("m", seq(1:length(ls(pattern = "_data"))), "_data")
lobe_name_list_v = c("vleft", "vcranial", "vmiddle", "vcaudal", "vaccessory")
lobe_name_list_p = c("pleft", "pcranial", "pmiddle", "pcaudal", "paccessory")


mm_volume_mat = vector()
for(m in ordered_list){
  mm = get(m)
  mm_volume = mm$LobeDep$volume
  names(mm_volume) = lobe_name_list_v
  mm_volume_mat = rbind(mm_volume_mat, mm_volume)
  
}
rownames(mm_volume_mat) = NULL
mm_volume_mat = as.data.frame(mm_volume_mat)

pp_volume_mat = vector()
for(p in ordered_list){
  pp = get(p)
  pp_volume = pp$LobeDep$mean * pp$LobeDep$volume
  names(pp_volume) = lobe_name_list_p
  pp_volume_mat = rbind(pp_volume_mat, pp_volume)
  
}
rownames(pp_volume_mat) = NULL
pp_volume_mat = as.data.frame(pp_volume_mat)


# Translate all the absolute numbers to ratios
for(i in 1:dim(mm_volume_mat)[1]){
  total_volume = sum(mm_volume_mat[i,])
  mm_volume_mat[i,1] = mm_volume_mat[i,1] / total_volume
  mm_volume_mat[i,2] = mm_volume_mat[i,2] / total_volume
  mm_volume_mat[i,3] = mm_volume_mat[i,3] / total_volume
  mm_volume_mat[i,4] = mm_volume_mat[i,4] / total_volume
  mm_volume_mat[i,5] = mm_volume_mat[i,5] / total_volume
}

for(i in 1:dim(pp_volume_mat)[1]){
  total_volume = sum(pp_volume_mat[i,])
  pp_volume_mat[i,1] = pp_volume_mat[i,1] / total_volume
  pp_volume_mat[i,2] = pp_volume_mat[i,2] / total_volume
  pp_volume_mat[i,3] = pp_volume_mat[i,3] / total_volume
  pp_volume_mat[i,4] = pp_volume_mat[i,4] / total_volume
  pp_volume_mat[i,5] = pp_volume_mat[i,5] / total_volume
}

pv_ratio_mat = as.data.frame(round(cbind(mm_volume_mat, pp_volume_mat), 4))
kable(pv_ratio_mat)