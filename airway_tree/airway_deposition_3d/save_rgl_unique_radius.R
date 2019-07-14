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

# file_pat = c("m01")

file_pat = c("m01", "m02", "m03", "m04", "m05", "m06", "m07", "m08", "m09",
             "m10", "m11", "m12", "m13", "m14", "m15", "m16", "m17", "m18",
             "m19", "m20", "m21", "m22", "m23", "m24", "m25", "m26", "m27",
             "m28", "m29", "m30", "m31", "m32", "m33", "m34")

plot_depo = function(airway_file,
                     lobe_file,
                     sublob_file,
                     acini_file){
  
  #Read the data
  airway_data = read.csv(file = airway_file)
  lobe_depo = read.csv(lobe_file)
  sublobe_depo = read.csv(sublob_file)
  acini_depo = read.csv(acini_file)
  
  data_dimension = dim(airway_data)[1]
  
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
    #shade3d(addNormals(subdivision3d(airway, depth = 0)), col = rainbow(data_dimension)[i])
    shade3d(addNormals(subdivision3d(airway, depth = 0)), col = "grey")
    
  }
  
  # ############### Deposition ###############
  # 
  # #Initialize color gradient
  # color_gradient = heat.colors(100)
  # 
  # ## This normalization process can only be done (well, sort of) to the lober level
  # # The numbers should be normalized based on percentage
  # # Add 1 at the bottom because index number starts from 1 in R
  # lobe_depo_percentage = round((lobe_depo$volume * lobe_depo$mean) / sum(lobe_depo$volume * lobe_depo$mean) * 100, 0) + 1
  # lobe_depo_percentage[lobe_depo_percentage >= 100] = 100 #Cape the maximum to 100
  # 
  # # color_gradient = heat.colors(ceiling(max(lobe_depo$volume * lobe_depo$mean))) #What it originally looks like
  # for(j in 1:dim(lobe_depo)[1]){
  #   
  #   data = lobe_depo[j,]
  #   rgl.spheres(x = data$centroidX,
  #               y = data$centroidY,
  #               z = data$centroidZ,
  #               r = 1.5,
  #               color = color_gradient[lobe_depo_percentage[j]])
  #   # color = color_gradient[round(lobe_depo$volume[j] * lobe_depo$mean[j])]) #What it originally looks like
  #   
  # }
  # 
  # sublobe_depo_percentage = round((sublobe_depo$volume * sublobe_depo$mean) / 
  #                                   sum(sublobe_depo$volume * sublobe_depo$mean) * 100, 3)
  # 
  # #Normalize the colorscale by the compartment count
  # sublobe_depo_percentage = (dim(sublobe_depo)[1] / dim(lobe_depo)[1]) * sublobe_depo_percentage + 1
  # sublobe_depo_percentage[sublobe_depo_percentage >= 100] = 100
  # sublobe_depo_percentage = round(sublobe_depo_percentage, 0)
  # 
  # # color_gradient = heat.colors(ceiling(max(sublobe_depo$volume * sublobe_depo$mean))) #Original
  # for(j in 1:dim(sublobe_depo)[1]){
  #   
  #   data = sublobe_depo[j,]
  #   rgl.spheres(x = data$centroidX,
  #               y = data$centroidY,
  #               z = data$centroidZ,
  #               r = 0.5,
  #               color = color_gradient[sublobe_depo_percentage[j]])
  #   
  # }
  # 
  # acini_depo_percentage = round((acini_depo$volume * acini_depo$mean) / 
  #                                 sum(acini_depo$volume * acini_depo$mean) * 100, 4)
  # 
  # #Normalize the colorscale by the compartment count
  # acini_depo_percentage = (dim(acini_depo)[1] / dim(lobe_depo)[1]) * acini_depo_percentage + 1
  # acini_depo_percentage[acini_depo_percentage >= 100] = 100
  # acini_depo_percentage = round(acini_depo_percentage, 0)
  # 
  # # color_gradient = heat.colors(ceiling(max(acini_depo$volume * acini_depo$mean))) #Original
  # for(j in 1:dim(acini_depo)[1]){
  #   
  #   data = acini_depo[j,]
  #   rgl.spheres(x = data$centroidX,
  #               y = data$centroidY,
  #               z = data$centroidZ,
  #               r = 0.15,
  #               color = color_gradient[acini_depo_percentage[j]])
  #   
  # }
  
}

if(!file.exists("new_plots")){
  dir.create("new_plots")
}

for(fp in file_pat){
  
  fl = list.files(pattern = fp)
  plot_depo(airway_file = fl[1], lobe_file = fl[2], sublob_file = fl[4], acini_file = fl[3])
  
  # This writes a copy into temporary directory 'webGL', and then displays it
  filename <- writeWebGL(dir = file.path(paste0(getwd(), "/new_plots"), paste0(fp, "_plot")), 
                         width = 1000, reuse = TRUE)
  
  # Display the "reuse" attribute
  # attr(filename, "reuse")
  
  # Display the scene in a browser
  # if (interactive()){
  #   browseURL(paste0("file://", filename))
  # }
  
  try({
    rgl.close()
  }, silent = TRUE)
  
}

