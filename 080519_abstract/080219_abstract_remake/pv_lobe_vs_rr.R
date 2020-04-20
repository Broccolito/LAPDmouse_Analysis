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

wd = get_directory()
setwd(wd)

d = as.data.frame(read_excel(path = list.files(pattern = "_sample_summary")))

flatten_data_frame(d)

windows()
l = round(l, 3)
plot(RR_Avg, pvcranial, cex = PS, pch = 16, col = as.factor(Strain), main = "pvcranial Vs. RR_avg")
legend("topleft", legend = unique(Strain), col = c(1,2,3,4), pch = 16)
l = summary(lm(pvcranial ~ RR_Avg))$coefficients
l = round(l, 3)
legend("bottomleft", paste0("Y = ", l[2,1], "x + ", l[1,1], "  |||  Rsq = ", 
                            round(summary(lm(pvcranial ~ RR_Avg))$r.squared, 2)))
abline(lm(pvcranial ~ RR_Avg))

windows()
plot(RR_Avg, pvcaudal, cex = PS, pch = 16, col = as.factor(Strain), main = "pvcaudal Vs. RR_avg")
legend("topleft", legend = unique(Strain), col = c(1,2,3,4), pch = 16)
l = summary(lm(pvcaudal ~ RR_Avg))$coefficients
l = round(l, 3)
legend("bottomleft", paste0("Y = ", l[2,1], "x + ", l[1,1], "  |||  Rsq = ", 
                            round(summary(lm(pvcaudal ~ RR_Avg))$r.squared, 2)))
abline(lm(pvcaudal ~ RR_Avg))

windows()
plot(RR_Avg, pvmiddle, cex = PS, pch = 16, col = as.factor(Strain), main = "pvmiddle Vs. RR_avg")
legend("topleft", legend = unique(Strain), col = c(1,2,3,4), pch = 16)
l = summary(lm(pvmiddle ~ RR_Avg))$coefficients
l = round(l, 3)
legend("bottomleft", paste0("Y = ", l[2,1], "x + ", l[1,1], "  |||  Rsq = ", 
                            round(summary(lm(pvmiddle ~ RR_Avg))$r.squared, 2)))
abline(lm(pvmiddle ~ RR_Avg))

windows()
plot(RR_Avg, pvaccessory, cex = PS, pch = 16, col = as.factor(Strain), main = "pvaccessory Vs. RR_avg")
legend("topleft", legend = unique(Strain), col = c(1,2,3,4), pch = 16)
l = summary(lm(pvaccessory ~ RR_Avg))$coefficients
l = round(l, 3)
legend("bottomleft", paste0("Y = ", l[2,1], "x + ", l[1,1], "  |||  Rsq = ", 
                            round(summary(lm(pvaccessory ~ RR_Avg))$r.squared, 2)))
abline(lm(pvaccessory ~ RR_Avg))

windows()
plot(RR_Avg, pvleft, cex = PS, pch = 16, col = as.factor(Strain), main = "pvleft Vs. RR_avg")
legend("topleft", legend = unique(Strain), col = c(1,2,3,4), pch = 16)
l = summary(lm(pvleft ~ RR_Avg))$coefficients
l = round(l, 3)
legend("bottomleft", paste0("Y = ", l[2,1], "x + ", l[1,1], "  |||  Rsq = ", 
                            round(summary(lm(pvleft ~ RR_Avg))$r.squared, 2)))
abline(lm(pvleft ~ RR_Avg))