rm(list = ls())
graphics.off()

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
setwd(wd)

fl = list.files(pattern = "rds")
fl = fl[fl != "dimen_mat.rds"]
for(i in fl){
  load(i)
  i = unlist(strsplit(i, "[.]"))[1]
  assign(i, f)
}

intercept = vector()
for(i in ls(pattern = "_mat")){
  mat = get(i)
  intercept_x = mat[,3]/(1-mat[,1])
  intercept = rbind(intercept, intercept_x)
}

intercept = as.matrix(intercept)
row.names(intercept) = rep(NULL, dim(intercept)[1])

load("dimen_mat.rds")

intercept * dimen_mat

