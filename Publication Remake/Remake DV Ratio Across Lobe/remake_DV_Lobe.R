graphics.off()
rm(list = ls())

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

data = as.data.frame(read_excel("080419_sample_summary.xlsx"))

data_half = data[data$PS == 0.5,]
data_one = data[data$PS == 1,]
data_two = data[data$PS == 2,]

strain_to_col = function(strain_vec){
  col_vec = vector()
  for(i in strain_vec){
    if(i == "B6C3F1"){
      col_vec = c(col_vec, "steelblue3")
    }else if(i == "BALB/c"){
      col_vec = c(col_vec, "orange3")
    }else if(i == "CD-1"){
      col_vec = c(col_vec, "darkorchid4")
    }else if(i == "C57BL/6"){
      col_vec = c(col_vec, "olivedrab4")
    }else{
      col_vec = c(col_vec, "grey")
    }
  }
  return(col_vec)
}

png(filename = "DV Ratio Across Lobe.png", width = 12, height = 4, units = 'in', res = 600)
par(mfrow = c(1,3))
plot(c(data_half$pvleft[1], data_half$pvcranial[1], data_half$pvmiddle[1], data_half$pvcaudal[1], data_half$pvaccessory[1]),
     col = strain_to_col(data_half$Strain[1]), pch = 16, type = "b", ylim = c(0.5, 2.5),
     xaxt='n', ylab = "DV Ratio", xlab = "", main = "Particle Size = 0.5")
for(i in 2:dim(data_half)[1]){
  points(c(data_half$pvleft[i], data_half$pvcranial[i], data_half$pvmiddle[i], data_half$pvcaudal[i], data_half$pvaccessory[i]),
         col = strain_to_col(data_half$Strain[i]), pch = 16, type = "b", ylim = c(0.5, 2.5),
         xaxt='n', ylab = "DV Ratio", xlab = "")
}

plot(c(data_one$pvleft[1], data_one$pvcranial[1], data_one$pvmiddle[1], data_one$pvcaudal[1], data_one$pvaccessory[1]),
     col = strain_to_col(data_one$Strain[1]), pch = 16, type = "b", ylim = c(0.5, 2.5),
     xaxt='n', ylab = "DV Ratio", xlab = "", main = "Particle Size = 1")
for(i in 2:dim(data_one)[1]){
  points(c(data_one$pvleft[i], data_one$pvcranial[i], data_one$pvmiddle[i], data_one$pvcaudal[i], data_one$pvaccessory[i]),
         col = strain_to_col(data_one$Strain[i]), pch = 16, type = "b", ylim = c(0.5, 2.5),
         xaxt='n', ylab = "DV Ratio", xlab = "")
}

plot(c(data_two$pvleft[1], data_two$pvcranial[1], data_two$pvmiddle[1], data_two$pvcaudal[1], data_two$pvaccessory[1]),
     col = strain_to_col(data_two$Strain[1]), pch = 16, type = "b", ylim = c(0.5, 2.5),
     xaxt='n', ylab = "DV Ratio", xlab = "", main = "Particle Size = 2")
for(i in 2:dim(data_two)[1]){
  points(c(data_two$pvleft[i], data_two$pvcranial[i], data_two$pvmiddle[i], data_two$pvcaudal[i], data_two$pvaccessory[i]),
       col = strain_to_col(data_two$Strain[i]), pch = 16, type = "b", ylim = c(0.5, 2.5),
       xaxt='n', ylab = "DV Ratio", xlab = "")
}
dev.off()

# Forming legend
plot(rep(1,4), col = strain_to_col(unique(data$Strain)), pch = 15, cex = 3)
