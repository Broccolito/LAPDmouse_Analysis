graphics.off()
rm(list = ls())

if(!require("rgl")){
  install.packages("rgl")
  library("rgl")
}

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

#Read the data
B6C3F1_data = read.csv(file = "CSV_Data/m01/m01_AirwayTreeTable.csv")
CD_data = read.csv(file = "CSV_Data/m13/m13_AirwayTreeTable.csv")
BALB_data = read.csv(file = "CSV_Data/m09/m09_AirwayTreeTable.csv")
C57_data = read.csv(file = "CSV_Data/m07/m07_AirwayTreeTable.csv")

plot_airway = function(airway_data, plot_title = "airway_data"){
  data_dimension = dim(airway_data)[1]
  
  which(airway_data$name == "Trachea")[1]
  which(airway_data$name == "LMB")[1]
  which(airway_data$name == "RMB")[1]
  which(airway_data$name == "CrRMB")[1]
  which(airway_data$name == "MiRMB")[1]
  which(airway_data$name == "AcRMB")[1]
  which(airway_data$name == "CaRMB")[1]
  
  no_color = function(n){
    if(n == which(airway_data$name == "Trachea")[1]){
      print(paste0("Trachea: ", n))
      return("red")
    }else if(n == which(airway_data$name == "LMB")[1]){
      print(paste0("LMB: ", n))
      return("orange")
    }else if(n == which(airway_data$name == "RMB")[1]){
      print(paste0("RMB: ", n))
      return("yellow")
    }else if(n == which(airway_data$name == "CrRMB")[1]){
      print(paste0("CrRMB: ", n))
      return("green")
    }else if(n == which(airway_data$name == "MiRMB")[1]){
      print(paste0("MiRMB: ", n))
      return("blue")
    }else if(n == which(airway_data$name == "AcRMB")[1]){
      print(paste0("AcRMB: ", n))
      return("cyan")
    }else if(n == which(airway_data$name == "CaRMB")[1]){
      print(paste0("CaRMB: ", n))
      return("purple")
    }else{
      return("grey")
    }
  }
  
  try({
    rgl.close()
  }, silent = TRUE)
  
  open3d()
  for(i in 1:100){
    
    data = airway_data[i,]
    airway = cylinder3d(
      center = cbind(c(data$centroidX + 0.5 * data$length * data$directionX,
                       data$centroidX - 0.5 * data$length * data$directionX),
                     c(data$centroidY + 0.5 * data$length * data$directionY,
                       data$centroidY - 0.5 * data$length * data$directionY),
                     c(data$centroidZ + 0.5 * data$length * data$directionZ,
                       data$centroidZ - 0.5 * data$length * data$directionZ)),
      # radius = data$radius
      radius = 0.15
    )
    shade3d(addNormals(subdivision3d(airway, depth = 0)), col = no_color(i))
    
  }
  mtext3d(plot_title, "z-+", line = 2)
}

rgl.open()
plot_airway(B6C3F1_data, plot_title = "B6C3F1")
# rgl.postscript("B6C3F1.pdf","pdf")

rgl.open()
plot_airway(CD_data, plot_title = "CD-1")
# rgl.postscript("CD.pdf","pdf")

rgl.open()
plot_airway(BALB_data, plot_title = "BALB/c")
# rgl.postscript("BALB.pdf","pdf")

rgl.open()
plot_airway(C57_data, plot_title = "C57BL")
# rgl.postscript("C57.pdf","pdf")