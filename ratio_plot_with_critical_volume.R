rm(list = ls())
graphics.off()

library(ggplot2)
library(Hmisc)

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

compare_ratio = function(file_list){
  for(filename in file_list){
    filename = unlist(strsplit(filename, "[.]"))[1]
    
    data = read.csv(paste0(filename, ".csv"))
    
    data_length = dim(data)[1]
    critical_volume = 1/data_length
    
    total_volume = sum(data$volume)
    particle_count = data$volume * data$mean
    total_particle_count = sum(particle_count)
    particle_total_volume_ratio = particle_count/total_particle_count
    volume_total_volume_ratio = data$volume/total_volume
    
    #Do a linear regression and return the coef
    l = lm(particle_total_volume_ratio ~ volume_total_volume_ratio)$coefficients
    print(filename)
    print(l)
    
    # if(window_graphic){
    #   windows(width = 1920, height = 1080)
    # }
    
    #Convert to data frame
    ratio_data_frame = data.frame(particle_total_volume_ratio,
                                  volume_total_volume_ratio)
    
    #Plot using ggplot
    
    
    ggplot(data = ratio_data_frame, aes(y = ratio_data_frame$particle_total_volume_ratio,
                                        x = volume_total_volume_ratio)) +
      xlab("particle total volume ratio") + 
      ylab("volume total volume ratio") + 
      
      ggtitle(filename, subtitle = "Blue: Linear Regression Line;  Black: Line Y = X") +
      geom_point() + 
      stat_summary(fun.data=mean_cl_normal) + 
      geom_smooth(method='lm',formula= y~x ) + 
      geom_abline(intercept = 0, slope = 1, color="black", 
                  linetype="dashed", size = 1) + 
      # Draw a vertical line indicating the critical volume
      geom_vline(xintercept = critical_volume, color = "green", linetype = "dashed") + 
      theme_minimal()
    
    ggsave(filename = paste0(filename, ".png"), device = "png")
    Sys.sleep(1)
    
  }
}



wd = get_directory()
setwd(wd)



#Create a new folder to save graphics
if(!dir.exists("new_graphics")){
  dir.create("new_graphics")
}

graphics_wd = paste0(wd, "/new_graphics")
wd = paste0(wd, "/CSV_Data")
setwd(wd)

dir_list = list.files(pattern = "m")

graphics.off()

for(d in dir_list){
  getinto(d)
  
  file_list = list.files(pattern = "Deposition")
  file_list = file_list[!grepl("Airway", file_list)]
  #Compare the scatterness of the ratio
  compare_ratio(file_list = file_list)
  
  setwd(wd)
}

#Scrub out PNG files from the folder and take them to new_graphics
for(d in dir_list){
  getinto(d)
  
  file.copy(from = list.files(pattern = "png"),
            to = graphics_wd)
  file.remove(list.files(pattern = "png"))
  
  setwd(wd)
}