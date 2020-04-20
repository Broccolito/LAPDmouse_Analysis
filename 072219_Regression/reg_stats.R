rm(list = ls())
graphics.off()

library(ggplot2)
library(knitr)
library(readxl)
library(glue)
library(plotly)

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

flatten_data_frame = function(df){
  for(i in 1:length(names(df))){
    assign(names(df)[i], df[,i], envir = .GlobalEnv)
  }
}

reg = function(fm){
  res = summary(lm(fm))$coefficients
  colnames(res) = c("Coef", "Std", "t-value", "Pr")
  cat("Formula: ")
  cat(as.character(fm)[c(2,1,3)])
  print(kable(res))
  cat("##### Rsq = ")
  cat(summary(lm(fm))$r.squared)
  cat("\n<hr>\n")
}

wd = get_directory()
setwd(wd)

d = as.data.frame(read_excel(path = list.files(pattern = "072319_sample_summary")))
d = d[which(d$RR_Pre != "NULL"), ]
d = d[which(d$Wt. != "NULL"), ]
d$RR_Pre = as.numeric(d$RR_Pre)
d$Wt. = as.numeric(d$Wt.)
flatten_data_frame(d)

reg(pvcaudal ~ Sex + Q + 
      tr_angle + tr_rad_diff + lr_angle + lr_rad_diff + Crr_angle + Crr_rad_diff + RCr_angle + RCr_rad_diff +  RR_Pre + LV + PS + Wt.)

reg(pvcranial ~ Sex + Q + 
      tr_angle + tr_rad_diff + lr_angle + lr_rad_diff + Crr_angle + Crr_rad_diff + RCr_angle + RCr_rad_diff +  RR_Pre + LV + PS + Wt.)

reg(pvaccessory ~ Sex + Q + 
      tr_angle + tr_rad_diff + lr_angle + lr_rad_diff + Crr_angle + Crr_rad_diff + RCr_angle + RCr_rad_diff +  RR_Pre + LV + PS + Wt.)

reg(pvleft ~ Sex + Q + 
      tr_angle + tr_rad_diff + lr_angle + lr_rad_diff + Crr_angle + Crr_rad_diff + RCr_angle + RCr_rad_diff +  RR_Pre + LV + PS + Wt.)

reg(pvmiddle ~ Sex + Q + 
      tr_angle + tr_rad_diff + lr_angle + lr_rad_diff + Crr_angle + Crr_rad_diff + RCr_angle + RCr_rad_diff +  RR_Pre + LV + PS + Wt.)




