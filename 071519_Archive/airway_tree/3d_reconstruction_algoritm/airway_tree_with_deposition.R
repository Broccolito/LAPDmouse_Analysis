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
airway_data = read.csv(file = "m01_AirwayTreeTable.csv")
lobe_depo = read.csv("m01_LobesDeposition.csv")
sublobe_depo = read.csv("m01_SublobesDeposition.csv")
acini_depo = read.csv("m01_NearAciniDeposition.csv")

data_dimension = dim(airway_data)[1]

try({
  rgl.close()
}, silent = TRUE)

open3d()

############### Deposition ###############

# color_gradient = heat.colors(ceiling(max(lobe_depo$volume * lobe_depo$mean))) #What it originally looks like
# for(j in 1:dim(lobe_depo)[1]){
#   
#   data = lobe_depo[j,]
#   rgl.spheres(x = data$centroidX,
#               y = data$centroidY,
#               z = data$centroidZ,
#               r = 1.5,
#               #What it originally looks like
#               color = color_gradient[round(lobe_depo$volume[j] * lobe_depo$mean[j])]) 
#   
# }

# color_gradient = heat.colors(ceiling(max(sublobe_depo$volume * sublobe_depo$mean)))
# for(j in 1:dim(sublobe_depo)[1]){
#   
#   data = sublobe_depo[j,]
#   rgl.spheres(x = data$centroidX,
#               y = data$centroidY,
#               z = data$centroidZ,
#               r = 0.5,
#               color = color_gradient[round(sublobe_depo$volume[j] * sublobe_depo$mean[j])])
#   
# }

color_gradient = heat.colors(ceiling(max(acini_depo$volume * acini_depo$mean)))
for(j in 1:dim(acini_depo)[1]){
  
  data = acini_depo[j,]
  rgl.spheres(x = data$centroidX,
              y = data$centroidY,
              z = data$centroidZ,
              r = 0.15,
              color = color_gradient[round(acini_depo$volume[j] * acini_depo$mean[j])])
  
}

for(i in 1:data_dimension){
  
  data = airway_data[i,]
  airway = cylinder3d(
    center = cbind(c(data$centroidX + 0.5 * data$length * data$directionX,
                     data$centroidX - 0.5 * data$length * data$directionX),
                   c(data$centroidY + 0.5 * data$length * data$directionY,
                     data$centroidY - 0.5 * data$length * data$directionY),
                   c(data$centroidZ + 0.5 * data$length * data$directionZ,
                     data$centroidZ - 0.5 * data$length * data$directionZ)),
    radius = data$radius
    
  )
  #shade3d(addNormals(subdivision3d(airway, depth = 0)), col = rainbow(data_dimension)[i])
  shade3d(addNormals(subdivision3d(airway, depth = 0)), col = "grey")
  
}









