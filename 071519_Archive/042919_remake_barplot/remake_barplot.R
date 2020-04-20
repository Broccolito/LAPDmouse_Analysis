library(ggplot2)
library(knitr)
library(dplyr)

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

#Define few places within the repo
wd = get_directory()
setwd(wd)
graphics_wd = paste0(wd, "/barplots")
data_folder_heads = c("m1","m2","m3","m4","m5","m6","m7","m8","m9","m10","m11","m12","m13","m14","m15","m16","m17","m18")

for(data_folder_head in data_folder_heads){
  
  getinto(data_folder_head)
  f = list.files(pattern = "LobesDeposition")
  
  data = read.csv(f)
  
  data$label = c("left", "cranial", "middle", "caudal", "accessory")
  data = data[,1:8]
  
  total_volume = sum(data$volume)
  vv_ratio = round(data$volume/total_volume,3)
  
  total_particle = sum(data$mean * data$volume)
  pp_ratio = round((data$mean * data$volume)/total_particle,3)
  
  ratio = c(vv_ratio, pp_ratio)
  
  #Assign the ratio values to the global env
  # assign(paste0(data_folder_head, "_ratio"), ratio)
  
  Legend = c(rep("Volume Ratio", length(vv_ratio)),rep("Particle Ratio", length(pp_ratio)))
  
  ratio_data = data.frame(data$label,ratio, Legend)
  
  ggplot(data = ratio_data, aes(x = data.label, y = ratio, fill = Legend)) + 
    geom_bar(stat="identity", color="black", position = "dodge") +
    xlab("Lobe Label") + 
    ylab("Relative Ratio") +
    ggtitle(paste0("Sample ", data_folder_head)) +
    theme_minimal()
  
  setwd(graphics_wd)
  ggsave(filename = paste0(data_folder_head, ".png"), device = "png")
  
  setwd(wd)
  cat(paste0("Plot for ", data_folder_head, " saved..\n"))
  
}
