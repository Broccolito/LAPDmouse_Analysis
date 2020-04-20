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

ps_to_pch = function(ps){
  if(ps == 1){
    return(1)
  }else if(ps == 2){
    return(16)
  }else{
    return(3)
  }
}

wd = get_directory()
setwd(wd)

d = as.data.frame(read_excel(path = list.files(pattern = "_sample_summary")))

# flatten_data_frame(d)

d_strain1 = d[d$Strain == unique(d$Strain)[1], ]
d_strain2 = d[d$Strain == unique(d$Strain)[2], ]
d_strain3 = d[d$Strain == unique(d$Strain)[3], ]
d_strain4 = d[d$Strain == unique(d$Strain)[4], ]

windows()
with(d_strain1, {
  x = seq(1,5)
  plot(x, c(pvleft[1], pvcranial[1], pvmiddle[1], pvcaudal[1], pvaccessory[1]),
       pch = ps_to_pch(PS[1]), ylim = c(0.5, 2.5), col = 1, type = "b", cex = 1.5,
       xlab = "[LEFT  CRANIAL  MIDDLE  CAUDAL  ACCESSORY]",
       ylab = "Particle deposition ratio",
       main = paste0(Strain[1], " deposition ratio across lobe"))
  for(i in 2:dim(d_strain1)[1]){
    points(x, c(pvleft[i], pvcranial[i], pvmiddle[i], pvcaudal[i], pvaccessory[i]),
           pch = ps_to_pch(PS[i]), col = i, type = "b", cex = 1.5)
  }
})

windows()
with(d_strain2, {
  x = seq(1,5)
  plot(x, c(pvleft[1], pvcranial[1], pvmiddle[1], pvcaudal[1], pvaccessory[1]),
       pch = ps_to_pch(PS[1]), ylim = c(0.5, 2.5), col = 1, type = "b", cex = 1.5,
       xlab = "[LEFT  CRANIAL  MIDDLE  CAUDAL  ACCESSORY]",
       ylab = "Particle deposition ratio",
       main = paste0(Strain[1], " deposition ratio across lobe"))
  for(i in 2:dim(d_strain2)[1]){
    points(x, c(pvleft[i], pvcranial[i], pvmiddle[i], pvcaudal[i], pvaccessory[i]),
           pch = ps_to_pch(PS[i]), col = i, type = "b", cex = 1.5)
  }
})

windows()
with(d_strain3, {
  x = seq(1,5)
  plot(x, c(pvleft[1], pvcranial[1], pvmiddle[1], pvcaudal[1], pvaccessory[1]),
       pch = ps_to_pch(PS[1]), ylim = c(0.5, 2.5), col = 1, type = "b", cex = 1.5,
       xlab = "[LEFT  CRANIAL  MIDDLE  CAUDAL  ACCESSORY]",
       ylab = "Particle deposition ratio",
       main = paste0(Strain[1], " deposition ratio across lobe"))
  for(i in 2:dim(d_strain3)[1]){
    points(x, c(pvleft[i], pvcranial[i], pvmiddle[i], pvcaudal[i], pvaccessory[i]),
           pch = ps_to_pch(PS[i]), col = i, type = "b", cex = 1.5)
  }
})

windows()
with(d_strain4,{
  x = seq(1,5)
  plot(x, c(pvleft[1], pvcranial[1], pvmiddle[1], pvcaudal[1], pvaccessory[1]),
       pch = ps_to_pch(PS[1]), ylim = c(0.5, 2.5), col = 1, type = "b", cex = 1.5,
       xlab = "[LEFT  CRANIAL  MIDDLE  CAUDAL  ACCESSORY]",
       ylab = "Particle deposition ratio",
       main = paste0(Strain[1], " deposition ratio across lobe"))
  for(i in 2:dim(d_strain4)[1]){
    points(x, c(pvleft[i], pvcranial[i], pvmiddle[i], pvcaudal[i], pvaccessory[i]),
           pch = ps_to_pch(PS[i]), col = i, type = "b", cex = 1.5)
  }
})




