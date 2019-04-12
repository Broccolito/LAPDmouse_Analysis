if(!require("rgl")){
  install.packages("rgl")
  library("rgl")
}

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

#Read the data
airway_data = read.csv(file = "m01_AirwayTreeTable.csv")

#Display the head of the data nicely
kable(head(airway_data,10))

#A histogram of airway radius
hist(airway_data$radius, breaks = 50,
     xlab = "radius",
     ylab = "frequency",
     main = "histogram of the airway radius")

#Plot the tree

#Initialize the plot
plot3d(x = airway_data$centroidX[1],
       y = airway_data$centroidY[1],
       z = airway_data$centroidZ[1],
       xlab = "CentroidX",
       ylab = "CentroidY",
       zlab = "CentroidZ", 
       #Choose to add points instead of spheres
       type = "s", 
       radius = airway_data$radius[1], #10 is the correction factor that will make the points visible
       add = FALSE,
       rainbow(1))

for(i in 2:length(airway_data$centroidX)){
  plot3d(x = airway_data$centroidX[i],
         y = airway_data$centroidY[i],
         z = airway_data$centroidZ[i],
         #Choose to add points instead of spheres
         type = "s", 
         radius = airway_data$radius[i],
         add = TRUE,
         col = rainbow(dim(airway_data)[1] + 1000)[i])
}







