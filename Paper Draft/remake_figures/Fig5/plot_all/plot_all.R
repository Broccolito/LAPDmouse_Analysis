gc()
rm(list = ls())

library(rgl)
library(rmarkdown)

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

plot_depo = function(airway_data, acini_depo, filename = "m08", plotting = TRUE){
  tryCatch({
    while(T){rgl.close()}
  }, error = function(e){
    cat("All devices closed...\n")
  })
  depo_median = median(acini_depo$mean)
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
  fn = writeWebGL(dir = file.path(paste0(wd,"/web_plots"), filename), 
                         width = 500, reuse = TRUE)
}

plot_sample = function(sample_id = "m01"){
  sample_airway_data = read.csv(file = paste0("CSV_Data/",sample_id,
                                              "/",sample_id,"_AirwayTreeTable.csv"))
  sample_acini_depo = read.csv(file = paste0("CSV_Data/",sample_id,"/",
                                             sample_id,"_NearAciniDeposition.csv"))
  plot_depo(sample_airway_data, sample_acini_depo, sample_id, T) 
}

sample_list = c(paste0("m0",seq(1,9)),paste0("m",seq(10,34)))
sapply(sample_list, plot_sample)
