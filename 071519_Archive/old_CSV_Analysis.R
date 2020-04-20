rm(list = ls())
graphics.off()

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

getinto = function(filename){
  if(!dir.exists(filename)){
    print("The file is not found...")
    stop("Wrong directory...")
  }else{
    setwd(paste(getwd(),"/",filename,sep = ""))
  }
}

compare_ratio = function(file_list, window_graphic = TRUE){
  for(filename in file_list){
    filename = unlist(strsplit(filename, "[.]"))[1]
    
    data = read.csv(paste0(filename, ".csv"))
    
    total_volume = sum(data$volume)
    particle_count = data$volume * data$mean
    total_particle_count = sum(particle_count)
    particle_total_volume_ratio = particle_count/total_particle_count
    volume_total_volume_ratio = data$volume/total_volume
    
    if(window_graphic){
      windows(width = 1920, height = 1080)
    }
    
    plot(particle_total_volume_ratio, volume_total_volume_ratio,
         pch = 1, 
         cex = 0.5,
         main = filename)
    abline(0,1)
  }
}

make_barplot = function(file_list, window_graphic = TRUE){
  
  for(filename in file_list){
    
    data = read.csv(filename)
    
    total_volume = sum(data$volume)
    particle_count = data$volume * data$mean
    total_particle_count = sum(particle_count)
    particle_total_volume_ratio = particle_count/total_particle_count
    volume_total_volume_ratio = data$volume/total_volume
    
    ratio_mat = as.matrix(cbind(particle_total_volume_ratio, volume_total_volume_ratio))
    ratio_mat = t(ratio_mat[nrow(ratio_mat):1,])
    colnames(ratio_mat)= data$label
    
    if(window_graphic){
      windows(width = 1920, height = 1080)
    }
    
    barplot(ratio_mat, beside = TRUE,
            main = filename, 
            col=colors()[c(23,89)],
            xlab = "Data_Label",
            ylab = "Ratio")
    
  }
  
}

wd = get_directory()
setwd(wd)

#Create a new folder to save graphics
if(!dir.exists("graphics")){
  dir.create("graphics")
}

graphics_wd = paste0(wd, "/graphics")
wd = paste0(wd, "/CSV_Data")
setwd(wd)

dir_list = list.files(pattern = "m")

graphics.off()

for(d in dir_list){
  getinto(d)

  file_list = list.files(pattern = "Deposition")
  file_list = file_list[!grepl("Airway", file_list)]
  #Compare the scatterness of the ratio
  compare_ratio(file_list = file_list, window_graphic = TRUE)
  
  setwd(wd)
}

#Save Graphics
n = 1
setwd(graphics_wd)
for(dev in dev.list()){
  savePlot(filename = paste0("ratio",n,".png"), type = "png", device = dev)
  n = n + 1
}
graphics.off()
setwd(wd)

for(d in dir_list){
  getinto(d)

  file_list = list.files(pattern = "Deposition")
  file_list = file_list[!grepl("Airway", file_list)]
  #Compare the scatterness of the ratio
  make_barplot(file_list = file_list, window_graphic = TRUE)

  setwd(wd)
}

#Save Graphics
n = 1
setwd(graphics_wd)
for(dev in dev.list()){
  savePlot(filename = paste0("barplot",n,".png"), type = "png", device = dev)
  n = n + 1
}
graphics.off()
setwd(wd)

for(d in dir_list){
  getinto(d)
  
  file_list = list.files(pattern = "Deposition")
  file_list = file_list[!grepl("Airway", file_list)]
  
  for(filename in file_list){
    
    data_name = filename
    data_name = unlist(strsplit(data_name, "[.]"))[1]
    assign(data_name, read.csv(filename))
    
  }
  
  setwd(wd)
}