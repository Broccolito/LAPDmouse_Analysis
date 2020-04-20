rm(list = ls())
graphics.off()

library(ggplot2)
library(knitr)
library(gridExtra)

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

filelist = c("CSV_Data/m1/m01_AirwayTreeTable.csv",
             "CSV_Data/m2/m02_AirwayTreeTable.csv",
             "CSV_Data/m3/m03_AirwayTreeTable.csv",
             "CSV_Data/m4/m04_AirwayTreeTable.csv",
             "CSV_Data/m5/m05_AirwayTreeTable.csv",
             "CSV_Data/m6/m06_AirwayTreeTable.csv",
             "CSV_Data/m7/m07_AirwayTreeTable.csv",
             "CSV_Data/m8/m08_AirwayTreeTable.csv",
             "CSV_Data/m9/m09_AirwayTreeTable.csv",
             "CSV_Data/m10/m10_AirwayTreeTable.csv",
             "CSV_Data/m11/m11_AirwayTreeTable.csv",
             "CSV_Data/m12/m12_AirwayTreeTable.csv",
             "CSV_Data/m13/m13_AirwayTreeTable.csv",
             "CSV_Data/m14/m14_AirwayTreeTable.csv",
             "CSV_Data/m15/m15_AirwayTreeTable.csv",
             "CSV_Data/m16/m16_AirwayTreeTable.csv",
             "CSV_Data/m17/m17_AirwayTreeTable.csv",
             "CSV_Data/m18/m18_AirwayTreeTable.csv")

TL_Radius_diff = vector()
TR_Radius_diff = vector()
LR_Radius_diff = vector()

for(f in filelist){
  
  data = read.csv(f[1])
  TL_Radius_diff = c(TL_Radius_diff, data$radius[1] - data$radius[3])
  TR_Radius_diff = c(TR_Radius_diff, data$radius[1] - data$radius[2])
  LR_Radius_diff = c(LR_Radius_diff, data$radius[3] - data$radius[2])

}

diff = data.frame(sample = 1:18, TL = TL_Radius_diff, TR = TR_Radius_diff, LR = LR_Radius_diff)
kable(diff)

windows(1200, 480)

tl = ggplot(data = diff, aes(x = diff$sample, y = diff$TL)) +
  geom_bar(stat="identity", width=0.5) + 
  ggtitle("Trachea Left-Main-Bronchus Radius Difference") + 
  labs(x = "Sample Number", y = "Radius Difference")

tr = ggplot(data = diff, aes(x = diff$sample, y = diff$TR)) +
  geom_bar(stat="identity", width=0.5) + 
  ggtitle("Trachea Right-Main-Bronchus Radius Difference") + 
  labs(x = "Sample Number", y = "Radius Difference")

lr = ggplot(data = diff, aes(x = diff$sample, y = diff$LR)) +
  geom_bar(stat="identity", width=0.5) + 
  ggtitle("Right-Main-Bronchus Left-Main-Bronchus Radius Difference") + 
  labs(x = "Sample Number", y = "Radius Difference")

grid.arrange(tl, tr, lr, nrow = 1)