# This algorithm labels the belonging lobe of each airway

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
  airway_tree_table = d$TreeTable
  for(i in 1:dim(airway_tree_table)[1]){
    if(airway_tree_table$name[i] == ""){
      airway_tree_table$name[i] = airway_tree_table$name[airway_tree_table$parent[i]]
    }
  }
  d$TreeTable = airway_tree_table
  assign(v, d)
}
rm(airway_tree_table, d, i, v)

filename = paste0("Airway_with_Generation/m", seq(1,34), "_with_generations.csv")

for(i in 1:length(filename)){
  f = filename[i]
  fn = filename[i]
  d = read.csv(f)
  # d = d[,-1]
  # d = na.omit(d)
  d$name = get(vlist[i])$TreeTable$name
  # g_LMB = get_generation(d, 2)
  # g_RMB = get_generation(d, 3)
  # g_CrRMB = get_generation(d, 6)
  # g_MiRMB = get_generation(d, 15)
  # g_AcRMB = get_generation(d, 33)
  # g_CaRMB = get_generation(d, 34)
  write.table(d, file = fn, quote = FALSE, sep = ",", row.names = FALSE)
}

