rm(list = ls())
graphics.off()

library(knitr)
library(readxl)

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

wd = get_directory()
setwd(wd)

# Read summary data
data_sum = as.data.frame(read_excel(path = list.files(pattern = "071519_sample_summary")))

# Read CSV data
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
  Rr_angle = get_angle(tt$directionX[3], tt$directionX[7], 
                       tt$directionY[3], tt$directionY[7],
                       tt$directionZ[3], tt$directionZ[7])
  
  RCr_angle = get_angle(tt$directionX[3], tt$directionX[6], 
                       tt$directionY[3], tt$directionY[6],
                       tt$directionZ[3], tt$directionZ[6])
  
  Crr_angle = get_angle(tt$directionX[6], tt$directionX[7], 
                       tt$directionY[6], tt$directionY[7],
                       tt$directionZ[6], tt$directionZ[7])
  
  Rr_radius_diff = tt$radius[3] - tt$radius[7]
  RCr_radius_diff = tt$radius[3] - tt$radius[6]
  Crr_radius_diff = tt$radius[6] - tt$radius[7]
  
  mm = append(mm, list(Rr_angle = Rr_angle, RCr_angle = RCr_angle, Crr_angle = Crr_angle,
                       Rr_radius_diff = Rr_radius_diff, RCr_radius_diff = RCr_radius_diff,
                       Crr_radius_diff = Crr_radius_diff))
  assign(m, mm)
}

rm(RCr_angle, RCr_radius_diff, m, Rr_angle, Rr_radius_diff, Crr_angle, Crr_radius_diff, mm, tt)

#Create a ordered list
ordered_list = paste0("m", seq(1:length(m_list)), "_data")

Rr_angle_list = vector()
Rr_radius_diff_list = vector()
RCr_angle_list = vector()
RCr_radius_diff_list = vector()
Crr_angle_list = vector()
Crr_radius_diff_list = vector()


for(o in ordered_list){
  
  mm = get(o)
  Rr_angle_list = c(Rr_angle_list, as.vector(mm$Rr_angle))
  Rr_radius_diff_list = c(Rr_radius_diff_list, as.vector(mm$Rr_radius_diff))
  Crr_angle_list = c(Crr_angle_list, as.vector(mm$Crr_angle))
  Crr_radius_diff_list = c(Crr_radius_diff_list, as.vector(mm$Crr_radius_diff))
  RCr_angle_list = c(RCr_angle_list, as.vector(mm$RCr_angle))
  RCr_radius_diff_list = c(RCr_radius_diff_list, as.vector(mm$RCr_radius_diff))
  
}

angle_radius_mat = data.frame(Rr_angle_list = Rr_angle_list, Rr_radius_diff_list = Rr_radius_diff_list,
                              Crr_angle_list = Crr_angle_list, Crr_radius_diff_list = Crr_radius_diff_list,
                              RCr_angle_list = RCr_angle_list, RCr_radius_diff_list = RCr_radius_diff_list)

angle_radius_mat = round(angle_radius_mat, 4)
kable(angle_radius_mat)