rm(list = ls())
graphics.off()

library(readxl)
library(ggplot2)
library(knitr)

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

index_to_name = function(m){
  m = as.numeric(unlist(strsplit(m, "m"))[2])
  m = paste0("m", m, "_data")
  return(m)
}

plot_boxplot = function(data_list){
  r_mat = vector()
  
  for(d in data_list){
    
    data = get(d)
    
    r1 = mean(data$radius[1:32])
    r2 = mean(data$radius[32:64])
    r3 = mean(data$radius[64:128])
    r4 = mean(data$radius[128:256])
    r5 = mean(data$radius[256:512])
    r6 = mean(data$radius[512:1024])
    r7 = mean(data$radius[1024:length(data$radius)])
    
    r1_sd = sd(data$radius[1:32])
    r2_sd = sd(data$radius[32:64])
    r3_sd = sd(data$radius[64:128])
    r4_sd = sd(data$radius[128:256])
    r5_sd = sd(data$radius[256:512])
    r6_sd = sd(data$radius[512:1024])
    r7_sd = sd(data$radius[1024:length(data$radius)])
    
    r_list = c(r1,r1_sd,r2,r2_sd,r3,r3_sd,r4,r4_sd,r5,r5_sd,r6,r6_sd,r7,r7_sd)
    r_mat = rbind(r_mat, r_list)
    
  }
  
  rm(r1,r1_sd,r2,r2_sd,r3,r3_sd,r4,r4_sd,r5,r5_sd,r6,r6_sd,r7,r7_sd,d,data_list,r_list)
  
  colnames(r_mat) = c("r1","r1_sd","r2","r2_sd","r3","r3_sd","r4","r4_sd","r5","r5_sd","r6","r6_sd","r7","r7_sd")
  rownames(r_mat) = NULL
  
  boxplot(r_mat[,1], r_mat[,3], r_mat[,5], r_mat[,7], r_mat[,9], r_mat[,11], r_mat[,13],
          main = "Airway Radii with recpect to generations",
          xlab = "Generation",
          ylab = "Radius",
          ylim = c(0,0.55))
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
  assign(paste0(folder, "_data"), TreeTable)
  setwd(csv_wd)
  
}

setwd(wd)
rm(folder, folder_list, TreeTable)
data = as.data.frame(read_excel(list.files(pattern = "xlsx")))

#Plot the overall dataset
windows()
plot_boxplot(data_list = ls(pattern = "_data")) 

#Plot the dataset with respect to strains
windows()
par(mfrow =c(2,2))
plot_boxplot(sapply(data$Name[data$Strain == "B6C3F1"], index_to_name))
plot_boxplot(sapply(data$Name[data$Strain == "BALB/c"], index_to_name))
plot_boxplot(sapply(data$Name[data$Strain == "CD-1"], index_to_name)) 
plot_boxplot(sapply(data$Name[data$Strain == "C57BL/6"], index_to_name))



