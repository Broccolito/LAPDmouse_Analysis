rm(list = ls())
graphics.off()

library(readxl)
library(knitr)

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

wd = get_directory()
setwd(wd)

data = as.data.frame(read_excel(path = list.files(pattern = "sample_summary.xlsx")))

#Only display part of the data
# kable(head(data[,1:9]))

ps_to_pch = function(ps){
  if(ps == 1){
    return(1)
  }else if(ps == 2){
    return(16)
  }else{
    return(3)
  }
}

# Plot all the pv ratios of PS = 1
windows()
data = as.data.frame(read_excel(path = list.files(pattern = "sample_summary.xlsx")))
data = data[data$PS == "1",]
x = seq(1,5)
plot(x, c(data$pvleft[1], data$pvcranial[1], data$pvmiddle[1], data$pvcaudal[1], data$pvaccessory[1]),
     pch = ps_to_pch(data$PS[1]), ylim = c(0.5, 2.5), col = 1, type = "b", cex = 1.5,
     xlab = "[LEFT  CRANIAL  MIDDLE  CAUDAL  ACCESSORY]",
     ylab = "Particle deposition ratio",
     main = "Partical (PS = 1) deposition ratio across lobe")

for(i in 2:dim(data)[1]){
  points(x, c(data$pvleft[i], data$pvcranial[i], data$pvmiddle[i], data$pvcaudal[i], data$pvaccessory[i]),
         pch = ps_to_pch(data$PS[i]), col = i, type = "b", cex = 1.5)
}

# Plot all the pv ratios of PS = 0.5
windows()
data = as.data.frame(read_excel(path = list.files(pattern = "sample_summary.xlsx")))
data = data[data$PS == "0.5",]
x = seq(1,5)
plot(x, c(data$pvleft[1], data$pvcranial[1], data$pvmiddle[1], data$pvcaudal[1], data$pvaccessory[1]),
     pch = ps_to_pch(data$PS[1]), ylim = c(0.5, 2.5), col = 1, type = "b", cex = 1.5,
     xlab = "[LEFT  CRANIAL  MIDDLE  CAUDAL  ACCESSORY]",
     ylab = "Particle deposition ratio",
     main = "Partical (PS = 0.5) deposition ratio across lobe")

for(i in 2:dim(data)[1]){
  points(x, c(data$pvleft[i], data$pvcranial[i], data$pvmiddle[i], data$pvcaudal[i], data$pvaccessory[i]),
         pch = ps_to_pch(data$PS[i]), col = i, type = "b", cex = 1.5)
}

# Plot all the pv ratios of PS = 2
windows()
data = as.data.frame(read_excel(path = list.files(pattern = "sample_summary.xlsx")))
data = data[data$PS == "2",]
x = seq(1,5)
plot(x, c(data$pvleft[1], data$pvcranial[1], data$pvmiddle[1], data$pvcaudal[1], data$pvaccessory[1]),
     pch = ps_to_pch(data$PS[1]), ylim = c(0.5, 2.5), col = 1, type = "b", cex = 1.5,
     xlab = "[LEFT  CRANIAL  MIDDLE  CAUDAL  ACCESSORY]",
     ylab = "Particle deposition ratio",
     main = "Partical (PS = 2) deposition ratio across lobe")

for(i in 2:dim(data)[1]){
  points(x, c(data$pvleft[i], data$pvcranial[i], data$pvmiddle[i], data$pvcaudal[i], data$pvaccessory[i]),
         pch = ps_to_pch(data$PS[i]), col = i, type = "b", cex = 1.5)
}

# Plot all the pv ratios together
windows()
data = as.data.frame(read_excel(path = list.files(pattern = "sample_summary.xlsx")))
# data = data[data$PS == "2",]
x = seq(1,5)
plot(x, c(data$pvleft[1], data$pvcranial[1], data$pvmiddle[1], data$pvcaudal[1], data$pvaccessory[1]),
     pch = ps_to_pch(data$PS[1]), ylim = c(0.5, 2.5), col = 1, type = "b", cex = 1.5,
     xlab = "[LEFT  CRANIAL  MIDDLE  CAUDAL  ACCESSORY]",
     ylab = "Particle deposition ratio",
     main = "Partical deposition ratio across lobe")

for(i in 2:dim(data)[1]){
  points(x, c(data$pvleft[i], data$pvcranial[i], data$pvmiddle[i], data$pvcaudal[i], data$pvaccessory[i]),
         pch = ps_to_pch(data$PS[i]), col = i, type = "b", cex = 1.5)
}

legend(4, 2.3, c("PS = 1","PS = 2", "PS = 0.5"), pch = c(1,16, 3))
# legend(4, 0.5, as.character(seq(1,dim(data)[1])), col = seq(1,dim(data)[1]), pch = rep(16, dim(data)[1]))