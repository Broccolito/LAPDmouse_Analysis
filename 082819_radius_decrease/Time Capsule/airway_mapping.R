## Generate data in "Airway_with_UpDown_Conn" folder

rm(list = ls())
graphics.off()

library(readxl)
library(ggplot2)
library(knitr)
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

getinto = function(filename){
  if(!dir.exists(filename)){
    print("The file is not found...")
    stop("Wrong directory...")
  }else{
    setwd(paste(getwd(),"/",filename,sep = ""))
  }
}

add_intersect = function(data){
  up_x = round(data$centroidX + 0.5 * data$length * data$directionX,3)
  down_x = round(data$centroidX - 0.5 * data$length * data$directionX,3)
  up_y = round(data$centroidY + 0.5 * data$length * data$directionY,3)
  down_y = round(data$centroidY - 0.5 * data$length * data$directionY,3)
  up_z = round(data$centroidZ + 0.5 * data$length * data$directionZ,3)
  down_z = round(data$centroidZ - 0.5 * data$length * data$directionZ,3)
  data = cbind.data.frame(data, up_x, up_y, up_z, down_x, down_y, down_z)
  return(data)
}

get_distance = function(x1, y1, z1, x2, y2, z2){
  return(sqrt((x1-x2)^2 + (y1-y2)^2 + (z1-z2)^2))
}

# Save all the data into .csv format
save_data = function(){
  filelist = paste0("m", seq(1,34), "_data")
  for(f in filelist){
    d = get(f)
    write.csv(x = d, file = paste0(f, ".csv"), quote = FALSE)
  }
}

save_new_data = function(){
  filelist = paste0("new_m", seq(1,34), "_data")
  for(f in filelist){
    d = get(f)
    write.csv(x = d, file = paste0(f, ".csv"), quote = FALSE)
  }
}

wd = get_directory()
setwd(wd)
setwd("..")
csv_wd = paste0(getwd(), "/CSV_Data")

setwd(csv_wd)

folder_list = list.files(pattern = "m")
for(folder in folder_list){
  getinto(folder)
  TreeTable = as.data.frame(read.csv(list.files(pattern = "TreeTable")))
  TreeTable = add_intersect(TreeTable)
  assign(paste0(folder, "_data"), TreeTable)
  setwd(csv_wd)
}

setwd(wd)
rm(folder, folder_list, TreeTable, csv_wd, wd)

save_data()

add_up_down_connection = function(airway_data){
  cat("\nCalculating airway connections... \n")
  new_data = vector()
  for(j in 1:dim(airway_data)[1]){
    d = airway_data[j,]
    distance_list = vector()
    for(i in 1:dim(airway_data)[1]){
      distance_list = c(distance_list, get_distance(x1 = d$up_x, y1 = d$up_y, z1 = d$up_z, x2 = airway_data$down_x[i], y2 = airway_data$down_y[i], z2 = airway_data$down_z[i]))
    }
    if(min(distance_list) < 0.01){
      up_intersect_index = paste(as.character(which(distance_list < 0.01)), collapse = "&")
    }else{
      up_intersect_index = "0"
    }
    
    distance_list = vector()
    for(i in 1:dim(airway_data)[1]){
      distance_list = c(distance_list, get_distance(x1 = d$down_x, y1 = d$down_y, z1 = d$down_z, x2 = airway_data$up_x[i], y2 = airway_data$up_y[i], z2 = airway_data$up_z[i]))
    }
    if(min(distance_list) < 0.01){
      down_intersect_index = paste(as.character(which(distance_list < 0.01)), collapse = "&")
    }else{
      down_intersect_index = "0"
    }
    
    d = cbind.data.frame(d, data.frame(down_conn = up_intersect_index, up_conn = down_intersect_index))
    new_data = rbind.data.frame(new_data, d)
    cat("*")
  }
  print(kable(head(new_data)[,c(1,5,18,19)]))
  return(new_data)
}

filelist = paste0("m", seq(1,34), "_data")

for(f in filelist){
  assign(paste0("new_", f), add_up_down_connection(get(f)))
  cat(paste0("\n\n--------", f, " Processed", "--------\n\n"))
}

save_new_data()
