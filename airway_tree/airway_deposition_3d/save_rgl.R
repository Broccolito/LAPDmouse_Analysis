library(rgl)

file_pat = c("m01", "m02", "m03", "m04", "m05", "m06", "m07", "m08", "m09",
             "m10", "m11", "m12", "m13", "m14", "m15", "m16", "m17", "m18")

plot_inclusive_depo = function(airway_file,
                               lobe_file,
                               sublob_file,
                               acini_file){
  
  #Read the data
  airway_data = read.csv(file = airway_file)
  lobe_depo = read.csv(lobe_file)
  sublobe_depo = read.csv(sublob_file)
  acini_depo = read.csv(acini_file)
  
  data_dimension = dim(airway_data)[1]
  
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
    shade3d(addNormals(subdivision3d(airway, depth = 0)), col = "yellow")
  }
  
  ############### Deposition 
  
  for(j in 1:dim(lobe_depo)[1]){
    
    data = acini_depo[j,]
    rgl.spheres(x = data$centroidX,
                y = data$centroidY,
                z = data$centroidZ,
                r = data$volume * data$mean / 2000,
                color = "green")
    
  }
  
  for(j in 1:dim(sublobe_depo)[1]){
    
    data = acini_depo[j,]
    rgl.spheres(x = data$centroidX,
                y = data$centroidY,
                z = data$centroidZ,
                r = data$volume * data$mean / 2000,
                color = "blue")
    
  }
  
  for(j in 1:dim(acini_depo)[1]){
    
    data = acini_depo[j,]
    rgl.spheres(x = data$centroidX,
                y = data$centroidY,
                z = data$centroidZ,
                r = data$volume * data$mean / 2000,
                color = "grey")
    
  }
  
  
}

for(fp in file_pat){
  fl = list.files(pattern = fp)
  plot_inclusive_depo(airway_file = fl[1], lobe_file = fl[2], sublob_file = fl[4], acini_file = fl[3])
  
  # This writes a copy into temporary directory 'webGL', and then displays it
  filename <- writeWebGL(dir = file.path(tempdir(), paste0(fp, "_plot")), 
                         width = 1000, reuse = TRUE)
  # Display the "reuse" attribute
  attr(filename, "reuse")
  
  # Display the scene in a browser
  if (interactive()){
    browseURL(paste0("file://", filename))
  }
  try({
    rgl.close()
  }, silent = TRUE)
}

