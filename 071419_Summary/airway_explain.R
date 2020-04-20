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
airway_data = read.csv(file = "CSV_Data/m1/m01_AirwayTreeTable.csv")

data_dimension = dim(airway_data)[1]
# data_dimension = 31

no_color = function(n){
  if(n == 31){
    return("red")
  }else if(n == 14){
    return("blue")
  }else if(n == 6){
    return("green")
  }else{
    return("grey")
  }
}

try({
  rgl.close()
}, silent = TRUE)

open3d()
for(i in 1:data_dimension){
  
  data = airway_data[i,]
  airway = cylinder3d(
    center = cbind(c(data$centroidX + 0.5 * data$length * data$directionX,
                     data$centroidX - 0.5 * data$length * data$directionX),
                   c(data$centroidY + 0.5 * data$length * data$directionY,
                     data$centroidY - 0.5 * data$length * data$directionY),
                   c(data$centroidZ + 0.5 * data$length * data$directionZ,
                     data$centroidZ - 0.5 * data$length * data$directionZ)),
    # radius = data$radius
    radius = 0.1
    
  )
  shade3d(addNormals(subdivision3d(airway, depth = 0)), col = no_color(i))
  
}
