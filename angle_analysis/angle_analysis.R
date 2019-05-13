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

get_angle = function(a1,a2,b1,b2,c1,c2){return(
  acos(abs( (a1*a2 + b1*b2 + c1*c2)/sqrt(a1^2 + b1^2 + c1^2)*sqrt(a2^2 + b2^2 + c2^2)))
  )
}

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

TL_Angle_list = vector()
TR_Angle_list = vector()
LR_Angle_list = vector()

for(f in filelist){
  
  data = read.csv(f[1])
  
  trachea_x = data$directionX[1]
  trachea_y = data$directionY[1]
  trachea_z = data$directionZ[1]
  
  LMB_x = data$directionX[2]
  LMB_y = data$directionY[2]
  LMB_z = data$directionZ[2]
  
  RMB_x = data$directionX[3]
  RMB_y = data$directionY[3]
  RMB_z = data$directionZ[3]
  
  TL_Angle = get_angle(trachea_x, LMB_x, trachea_y, LMB_y, trachea_z, LMB_z)
  TR_Angle = get_angle(trachea_x, RMB_x, trachea_y, RMB_y, trachea_z, RMB_z)
  LR_Angle = get_angle(RMB_x, LMB_x, RMB_y, LMB_y, RMB_z, LMB_z)
  
  TL_Angle_list = c(TL_Angle_list, TL_Angle)
  TR_Angle_list = c(TR_Angle_list, TR_Angle)
  LR_Angle_list = c(LR_Angle_list, LR_Angle)
  
}

Angles = data.frame(sample = 1:18, 
                    TL_Angle = TL_Angle_list, 
                    TR_Angle = TR_Angle_list, 
                    LR_Angle = LR_Angle_list)

kable(Angles)

windows(1200, 480)

tl = ggplot(data = Angles, aes(x = Angles$sample, y = Angles$TL_Angle)) +
  geom_bar(stat="identity", width=0.5) + 
  ggtitle("Trachea Left-Main-Bronchus Angle") + 
  labs(x = "Sample Number", y = "Angle in Rad")

tr = ggplot(data = Angles, aes(x = Angles$sample, y = Angles$TR_Angle)) +
  geom_bar(stat="identity", width=0.5) + 
  ggtitle("Trachea Right-Main-Bronchus Angle") + 
  labs(x = "Sample Number", y = "Angle in Rad")

lr = ggplot(data = Angles, aes(x = Angles$sample, y = Angles$LR_Angle)) +
  geom_bar(stat="identity", width=0.5) + 
  ggtitle("Right-Main-Bronchus Left-Main-Bronchus Angle") + 
  labs(x = "Sample Number", y = "Angle in Rad")

grid.arrange(tl, tr, lr, nrow = 1)