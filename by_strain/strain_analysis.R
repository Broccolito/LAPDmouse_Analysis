rm(list = ls())
graphics.off()

library(knitr)
library(readxl)
library(rgl)
library(vrmlgen)

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

data = as.data.frame(read_excel("080419_sample_summary.xlsx"))
# data = data[data$PS == 2,]

# Unique strains
# "B6C3F1"  "BALB/c"  "CD-1"    "C57BL/6"

data_B6C3F1 = data[data$Strain == "B6C3F1",] 
data_BALB = data[data$Strain == "BALB/c",]
data_CD = data[data$Strain == "CD-1",]
data_C57BL = data[data$Strain == "C57BL/6",]

{
  windows(1800,500)
  par(mfrow = c(1,5))
  boxplot(data_B6C3F1$pvaccessory, data_BALB$pvaccessory, data_C57BL$pvaccessory, data_CD$pvaccessory,
          ylim = c(0.5,2.0),
          names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVaccessory")
  boxplot(data_B6C3F1$pvcaudal, data_BALB$pvcaudal, data_C57BL$pvcaudal, data_CD$pvcaudal, 
          ylim = c(0.5,2.0),
          names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVcaudal")
  boxplot(data_B6C3F1$pvmiddle, data_BALB$pvmiddle, data_C57BL$pvmiddle, data_CD$pvmiddle,
          ylim = c(0.5,2.0),
          names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVmiddle")
  boxplot(data_B6C3F1$pvcranial, data_BALB$pvcranial, data_C57BL$pvcranial, data_CD$pvcranial,
          ylim = c(0.5,2.0),
          names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVcranial")
  boxplot(data_B6C3F1$pvleft, data_BALB$pvleft, data_C57BL$pvleft, data_CD$pvleft, 
          ylim = c(0.5,2.0),
          names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVleft")
  
  windows(1600, 600)
  par(mfrow = c(1,4))
  boxplot(data_B6C3F1$pvleft, data_B6C3F1$pvcranial, data_B6C3F1$pvcaudal,
          data_B6C3F1$pvmiddle, data_B6C3F1$pvaccessory,
          ylim = c(0.5,2.3),
          names = c("LEFT", "CRANIAL", "CAUDAL", "MIDDLE", "ACCESSORY"),
          main = "DV Ratio for B6C3F1")
  
  boxplot(data_BALB$pvleft, data_BALB$pvcranial, data_BALB$pvcaudal,
          data_BALB$pvmiddle, data_BALB$pvaccessory,
          ylim = c(0.5,2.3),
          names = c("LEFT", "CRANIAL", "CAUDAL", "MIDDLE", "ACCESSORY"),
          main = "DV Ratio for BALB/c")
  
  boxplot(data_CD$pvleft, data_CD$pvcranial, data_CD$pvcaudal,
          data_CD$pvmiddle, data_CD$pvaccessory,
          ylim = c(0.5,2.3),
          names = c("LEFT", "CRANIAL", "CAUDAL", "MIDDLE", "ACCESSORY"),
          main = "DV Ratio for CD-1")
  
  boxplot(data_C57BL$pvleft, data_C57BL$pvcranial, data_C57BL$pvcaudal,
          data_C57BL$pvmiddle, data_C57BL$pvaccessory,
          ylim = c(0.5,2.3),
          names = c("LEFT", "CRANIAL", "CAUDAL", "MIDDLE", "ACCESSORY"),
          main = "DV Ratio for C57BL/6")
}

png(filename = "DV Diff Across Lobe.png", width = 2000, height = 500)
par(mfrow = c(1,5))
boxplot(data_B6C3F1$pvaccessory, data_BALB$pvaccessory, data_C57BL$pvaccessory, data_CD$pvaccessory,
        ylim = c(0.5,2.0),
        names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVaccessory")
boxplot(data_B6C3F1$pvcaudal, data_BALB$pvcaudal, data_C57BL$pvcaudal, data_CD$pvcaudal, 
        ylim = c(0.5,2.0),
        names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVcaudal")
boxplot(data_B6C3F1$pvmiddle, data_BALB$pvmiddle, data_C57BL$pvmiddle, data_CD$pvmiddle,
        ylim = c(0.5,2.0),
        names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVmiddle")
boxplot(data_B6C3F1$pvcranial, data_BALB$pvcranial, data_C57BL$pvcranial, data_CD$pvcranial,
        ylim = c(0.5,2.0),
        names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVcranial")
boxplot(data_B6C3F1$pvleft, data_BALB$pvleft, data_C57BL$pvleft, data_CD$pvleft, 
        ylim = c(0.5,2.0),
        names = c("B6C3F1", "BALB/c", "CD-1", "C57BL/6"), main = "DVleft")
dev.off()

png(filename = "DV Diff Across strain.png", width = 1600, height = 600)
par(mfrow = c(1,4))
boxplot(data_B6C3F1$pvleft, data_B6C3F1$pvcranial, data_B6C3F1$pvcaudal,
        data_B6C3F1$pvmiddle, data_B6C3F1$pvaccessory,
        ylim = c(0.5,2.3),
        names = c("LEFT", "CRANIAL", "CAUDAL", "MIDDLE", "ACCESSORY"),
        main = "DV Ratio for B6C3F1")

boxplot(data_BALB$pvleft, data_BALB$pvcranial, data_BALB$pvcaudal,
        data_BALB$pvmiddle, data_BALB$pvaccessory,
        ylim = c(0.5,2.3),
        names = c("LEFT", "CRANIAL", "CAUDAL", "MIDDLE", "ACCESSORY"),
        main = "DV Ratio for BALB/c")

boxplot(data_CD$pvleft, data_CD$pvcranial, data_CD$pvcaudal,
        data_CD$pvmiddle, data_CD$pvaccessory,
        ylim = c(0.5,2.3),
        names = c("LEFT", "CRANIAL", "CAUDAL", "MIDDLE", "ACCESSORY"),
        main = "DV Ratio for CD-1")

boxplot(data_C57BL$pvleft, data_C57BL$pvcranial, data_C57BL$pvcaudal,
        data_C57BL$pvmiddle, data_C57BL$pvaccessory,
        ylim = c(0.5,2.3),
        names = c("LEFT", "CRANIAL", "CAUDAL", "MIDDLE", "ACCESSORY"),
        main = "DV Ratio for C57BL/6")
dev.off()

strain_mat = as.data.frame(rbind(c(mean(data_B6C3F1$pvleft), mean(data_B6C3F1$pvcranial), mean(data_B6C3F1$pvcaudal), 
                                   mean(data_B6C3F1$pvmiddle), mean(data_B6C3F1$pvaccessory)),
                                 c(mean(data_BALB$pvleft), mean(data_BALB$pvcranial), mean(data_BALB$pvcaudal), 
                                   mean(data_BALB$pvmiddle), mean(data_BALB$pvaccessory)),
                                 c(mean(data_CD$pvleft), mean(data_CD$pvcranial), mean(data_CD$pvcaudal), 
                                   mean(data_CD$pvmiddle), mean(data_CD$pvaccessory)),
                                 c(mean(data_C57BL$pvleft), mean(data_C57BL$pvcranial), mean(data_C57BL$pvcaudal), 
                                   mean(data_C57BL$pvmiddle), mean(data_C57BL$pvaccessory))))

colnames(strain_mat) = c("left", "cranial", "caudal", "middle", "accessory")
rownames(strain_mat) = c("B6C3F1", "BALB", "CD", "C57BL")

write.csv(strain_mat, file = "strain_mat.csv", quote = FALSE)
