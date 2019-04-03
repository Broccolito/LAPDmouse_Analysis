rm(list = ls())
graphics.off()

library(readxl)

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

wd = get_directory()
wd = paste0(wd, "/CSV_Data")
setwd(wd)

dir_list = list.files(pattern = "m")

dimen_mat = vector()
for(d in dir_list){
  
  getinto(d)
  file_list = list.files(pattern = "Deposition")
  file_list = file_list[!grepl("Airway", file_list)]
  
  dimen_vec = vector()
  for(f in file_list){
    data = read.csv(f)
    dimen = dim(data)[1]
    dimen_vec = c(dimen_vec, dimen)
  }
  names(dimen_vec) = file_list
  
  setwd(wd)
  
  dimen_mat = rbind(dimen_mat, dimen_vec)
  
}

row.names(dimen_mat) = rep(NULL, dim(dimen_mat)[1])
colnames(dimen_mat) = c("lobe", "acini", "sublobes")

#save(dimen_mat, file = "dimen_mat.rds")

#dimen_mat





