rm(list = ls())

library(ggplot2)
library(knitr)
library(readxl)
library(listviewer)

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

# Read in data
wd = get_directory()
setwd(wd)

getinto("CSV_Data")

folder_list = list.files(pattern = "m")
for(folder in folder_list){
  
  getinto(folder)
  TreeTable = as.data.frame(read.csv(list.files(pattern = "TreeTable")))
  LobeDep = as.data.frame(read.csv(list.files(pattern = "LobesDeposition")))
  SublobDep = as.data.frame(read.csv(list.files(pattern = "SublobesDeposition")))
  AciniDep = as.data.frame(read.csv(list.files(pattern = "NearAciniDeposition")))
  assign(paste0(folder, "_data"), list(
    TreeTable = TreeTable,
    LobeDep = LobeDep,
    SublobDep = SublobDep
  ))
  setwd(wd)
  getinto("CSV_Data")
  
}

setwd(wd)
rm(SublobDep)
rm(TreeTable)
rm(AciniDep)
rm(LobeDep)

# Define angle analysis function
get_angle = function(a1,a2,b1,b2,c1,c2){
  return(acos(abs( (a1*a2 + b1*b2 + c1*c2)/sqrt(a1^2 + b1^2 + c1^2)*sqrt(a2^2 + b2^2 + c2^2))))
}

m_list = ls(pattern = "_data")
for(m in m_list){
  mm = get(m)
  tt = mm$TreeTable
  tl_angle = get_angle(tt$directionX[1], tt$directionX[2], 
                       tt$directionY[1], tt$directionY[2],
                       tt$directionZ[1], tt$directionZ[2])
  
  tr_angle = get_angle(tt$directionX[1], tt$directionX[3], 
                       tt$directionY[1], tt$directionY[3],
                       tt$directionZ[1], tt$directionZ[3])
  
  lr_angle = get_angle(tt$directionX[2], tt$directionX[3], 
                       tt$directionY[2], tt$directionY[3],
                       tt$directionZ[2], tt$directionZ[3])
  
  tl_radius_diff = tt$radius[1] - tt$radius[2]
  tr_radius_diff = tt$radius[1] - tt$radius[3]
  lr_radius_diff = tt$radius[2] - tt$radius[3]
  
  mm = append(mm, list(tl_angle = tl_angle, tr_angle = tr_angle, lr_angle = lr_angle,
                       tl_radius_diff = tl_radius_diff, tr_radius_diff = tr_radius_diff,
                       lr_radius_diff = lr_radius_diff))
  assign(m, mm)
}

rm(lr_angle, lr_radius_diff, m, tl_angle, tl_radius_diff, tr_angle, tr_radius_diff, mm, tt)

#Create a ordered list
ordered_list = paste0("m", seq(1:length(m_list)), "_data")

tl_angle_list = vector()
tl_radius_diff_list = vector()
tr_angle_list = vector()
tr_radius_diff_list = vector()
lr_angle_list = vector()
lr_radius_diff_list = vector()


for(o in ordered_list){
  
  mm = get(o)
  tl_angle_list = c(tl_angle_list, as.vector(mm$tl_angle))
  tl_radius_diff_list = c(tl_radius_diff_list, as.vector(mm$tl_radius_diff))
  lr_angle_list = c(lr_angle_list, as.vector(mm$lr_angle))
  lr_radius_diff_list = c(lr_radius_diff_list, as.vector(mm$lr_radius_diff))
  tr_angle_list = c(tr_angle_list, as.vector(mm$tr_angle))
  tr_radius_diff_list = c(tr_radius_diff_list, as.vector(mm$tr_radius_diff))
  
}

angle_radius_mat = data.frame(tl_angle_list = tl_angle_list, tl_radius_diff_list = tl_radius_diff_list,
                              lr_angle_list = lr_angle_list, lr_radius_diff_list = lr_radius_diff_list,
                              tr_angle_list = tr_angle_list, tr_radius_diff_list = tr_radius_diff_list)

angle_radius_mat = round(angle_radius_mat, 4)
kable(angle_radius_mat)

