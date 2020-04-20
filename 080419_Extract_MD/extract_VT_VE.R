rm(list = ls())
graphics.off()

library(knitr)
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
setwd(wd)

getinto("md_files")
for(i in list.files(pattern = "md")){
  temp = unlist(strsplit(i, "[.]"))[1]
  temp = unlist(strsplit(temp, "_"))[1]
  temp = paste0(temp, "_whole_read")
  assign(temp, readLines(i))
}

rm(temp)

whole_read_list = ls(pattern = "whole_read")

for(it in whole_read_list){
  d = get(it)
  temp = d[20:22]
  temp = as.data.frame(t(matrix(unlist(strsplit(temp, "[|]")), 6, 3)[2:6,]))
  temp_mat = matrix(nrow = 3, ncol = 5)
  for(i in 2:5){
    for(j in 1:3){
      suppressWarnings({
        temp_mat[j, i] = as.numeric(as.character(temp[j,i]))
      })
    }
  }
  temp_mat = temp_mat[, 2:5]
  temp_mat = as.data.frame(temp_mat, row.names = c("Pre Aerosol", "Post 5 Aerosol", "Post 10 Aerosol"))
  colnames(temp_mat) = c("RR", "Vt", "VE", "IoverE")
  mat_name = unlist(strsplit(it, "_"))[1]
  mat_name = paste0(mat_name, "_mat")
  assign(mat_name, temp_mat)
}

rm(list = ls(pattern = "whole_read"))
rm(temp, mat_name ,d, i, it, j, temp_mat)

get_dosing = function(mat){
  pre_vt = mat$Vt[1]
  pre_ve = mat$VE[1]
  pre_iovere = mat$IoverE[1]
  post_vt = mean(mat$Vt[2:3])
  post_ve = mean(mat$VE[2:3])
  post_iovere = mean(mat$IoverE[2:3])
  res = c(pre_vt, post_vt, pre_ve, post_ve, pre_iovere, post_iovere)
  names(res) = c("pre_vt", "post_vt", "pre_ve", "post_ve", "pre_iovere", "post_iovere")
  return(res)
}

result = vector()
for(i in ls(pattern = "_mat")){
  d = get(i)
  result = rbind(result, get_dosing(d))
}
result = as.data.frame(result)
rownames(result) = paste0("m", seq(1,34))
kable(result)






