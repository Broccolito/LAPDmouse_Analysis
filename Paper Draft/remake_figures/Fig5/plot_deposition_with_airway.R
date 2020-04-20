gc()
rm(list = ls())

library(rgl)

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

setwd(get_directory())

# Close all devices
tryCatch({
  while(T){rgl.close()}
}, error = function(e){
  cat("All devices closed...\n")
})

plot_depo = function(airway_data, acini_depo, filename = "m08", plotting = TRUE){
  
  depo_median = median(acini_depo$mean)
  
  # hotspots = acini_depo[acini_depo$mean >= depo_median*2,]
  
  depo_sd = sd(acini_depo$mean)
  hotspots = acini_depo[acini_depo$mean >= depo_median + qnorm(0.99)*depo_sd,]
  
  if(plotting){
    open3d()
    bg3d("white")
    for(i in 1:dim(airway_data)[1]){
      
      data = airway_data[i,]
      airway = cylinder3d(
        center = cbind(c(data$centroidX + 0.5 * data$length * data$directionX,
                         data$centroidX - 0.5 * data$length * data$directionX),
                       c(data$centroidY + 0.5 * data$length * data$directionY,
                         data$centroidY - 0.5 * data$length * data$directionY),
                       c(data$centroidZ + 0.5 * data$length * data$directionZ,
                         data$centroidZ - 0.5 * data$length * data$directionZ)),
        # radius = data$radius
        radius = 0.05
      )
      shade3d(addNormals(subdivision3d(airway, depth = 0)), col = "gray")
    }
    
    for(j in 1:dim(hotspots)[1]){
      data = hotspots[j,]
      x = data$centroidX
      y = data$centroidY
      z = data$centroidZ
      xscale = abs(data$bboxXStart - data$bboxXEnd)/10
      yscale = abs(data$bboxYStart - data$bboxYEnd)/10
      zscale = abs(data$bboxZStart - data$bboxZEnd)/10
      shade3d(translate3d(scale3d(cube3d(col = "black"),
                                  xscale,yscale,xscale),
                          x,y,z), lit = F)
    }
  }

  cat(paste0(dim(hotspots)[1], " hotspots plotted in ", filename, "...\n"))
  writeSTL(paste0(filename, ".stl"))
}

#Read the data
airway_data_m08 = read.csv(file = "m08/m08_AirwayTreeTable.csv")
acini_depo_m08 = read.csv("m08/m08_NearAciniDeposition.csv")

airway_data_m27 = read.csv(file = "m27/m27_AirwayTreeTable.csv")
acini_depo_m27 = read.csv("m27/m27_NearAciniDeposition.csv")

airway_data_m34 = read.csv(file = "m34/m34_AirwayTreeTable.csv")
acini_depo_m34 = read.csv("m34/m34_NearAciniDeposition.csv")

plot_depo(airway_data_m08, acini_depo_m08, "m08", T) # 1 micron
plot_depo(airway_data_m27, acini_depo_m27, "m27", T) # 2 micron
plot_depo(airway_data_m34, acini_depo_m34, "m34", T) # 0.5 micron
