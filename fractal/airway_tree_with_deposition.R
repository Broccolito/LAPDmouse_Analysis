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

rgl_close_all = function(){
  tryCatch({
    repeat{
      rgl.close()
    }
  }, error = function(x){
    cat("All rgl devices are closed")
  })
}

wd = get_directory()
setwd(wd)

#Read the data
acini_depo = read.csv("m01_NearAciniDeposition.csv")
airway_data = read.csv(file = "m01_AirwayTreeTable.csv")

rgl_close_all()

open3d()

color_gradient = heat.colors(ceiling(max(acini_depo$volume * acini_depo$mean)))
for(j in 1:dim(acini_depo)[1]){
  
  data = acini_depo[j,]
  rgl.spheres(x = data$centroidX,
              y = data$centroidY,
              z = data$centroidZ,
              r = 0.15,
              color = color_gradient[round(acini_depo$volume[j] * acini_depo$mean[j])])
}

for(i in 1:dim(airway_data)[1]){
  
  data = airway_data[i,]
  airway = cylinder3d(
    center = cbind(c(data$centroidX + 0.5 * data$length * data$directionX,
                     data$centroidX - 0.5 * data$length * data$directionX),
                   c(data$centroidY + 0.5 * data$length * data$directionY,
                     data$centroidY - 0.5 * data$length * data$directionY),
                   c(data$centroidZ + 0.5 * data$length * data$directionZ,
                     data$centroidZ - 0.5 * data$length * data$directionZ)),
    radius = 0.05
  )
  shade3d(addNormals(subdivision3d(airway, depth = 0)), col = "gray")
}

