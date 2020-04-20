rm(list = ls())
graphics.off()

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
    SublobDep = SublobDep,
    AciniDep = AciniDep
  ))
  setwd(wd)
  getinto("CSV_Data")
  
}

setwd(wd)
rm(folder, folder_list, wd, SublobDep, TreeTable, AciniDep, LobeDep)

get_angle = function(a1,a2,b1,b2,c1,c2){
  rad = acos(abs( (a1*a2 + b1*b2 + c1*c2)/sqrt(a1^2 + b1^2 + c1^2)*sqrt(a2^2 + b2^2 + c2^2)))
  deg = rad * 180 / pi
  return(deg)
}

sample_info = as.data.frame(read_excel(path = "080419_sample_summary.xlsx"))

v_list = ls(pattern = "_data")
ang_mat = vector()
for(d in v_list){
  sample_list = get(d) # Transfer the data
  treetable = sample_list$TreeTable
  # Get all three index numbers 
  ac_entrance = treetable$label[treetable$name == "AcRMB"][1]
  parent_branch = treetable$parent[treetable$name == "AcRMB"][1]
  other_branch = treetable$label[which(treetable$parent == parent_branch)]
  other_branch = other_branch[other_branch != ac_entrance]
  #######################
  # Redefine the parent branch as the long parent branch
  parent_branch = 7
  #######################
  # Angle between parent branch and ac_entrance
  x1 = treetable[treetable$label == parent_branch, ]$directionX
  x2 = treetable[treetable$label == ac_entrance, ]$directionX
  y1 = treetable[treetable$label == parent_branch, ]$directionY
  y2 = treetable[treetable$label == ac_entrance, ]$directionY
  z1 = treetable[treetable$label == parent_branch, ]$directionZ
  z2 = treetable[treetable$label == ac_entrance, ]$directionZ
  ang1 = get_angle(x1, x2, y1, y2, z1, z2)
  # Angel between ac_entrance and the other branch
  x1 = treetable[treetable$label == ac_entrance, ]$directionX
  x2 = treetable[treetable$label == other_branch, ]$directionX
  y1 = treetable[treetable$label == ac_entrance, ]$directionY
  y2 = treetable[treetable$label == other_branch, ]$directionY
  z1 = treetable[treetable$label == ac_entrance, ]$directionZ
  z2 = treetable[treetable$label == other_branch, ]$directionZ
  ang2 = get_angle(x1, x2, y1, y2, z1, z2)
  # Angel between parent and the other branch
  x1 = treetable[treetable$label == parent_branch, ]$directionX
  x2 = treetable[treetable$label == other_branch, ]$directionX
  y1 = treetable[treetable$label == parent_branch, ]$directionY
  y2 = treetable[treetable$label == other_branch, ]$directionY
  z1 = treetable[treetable$label == parent_branch, ]$directionZ
  z2 = treetable[treetable$label == other_branch, ]$directionZ
  ang3 = get_angle(x1, x2, y1, y2, z1, z2)
  ang_list = c(ang1, ang2, ang3)
  ang_mat = rbind(ang_mat, ang_list)
}
ang_mat = as.data.frame(ang_mat)
ang_mat = cbind.data.frame(sample_info$Strain, ang_mat, sample_info$PS,
                           sample_info$pvaccessory, sample_info$Q)
colnames(ang_mat) = c("Strain", "PA", "OA", "PO", "PS", "PVAc", "Q")
rownames(ang_mat) = paste0("m", seq(1,34))
rm(x1,x2,y1,y2,z1,z2,v_list,
   parent_branch,other_branch,ang1,ang2,ang3, ac_entrance,ang_list,d,sample_list,treetable)
ang_mat = ang_mat[ang_mat$PS == 2, ]
kable(ang_mat)

B6C3F1_ang = ang_mat[ang_mat$Strain == "B6C3F1", ]
CD_ang = ang_mat[ang_mat$Strain == "CD-1", ]
C57_ang= ang_mat[ang_mat$Strain == "C57BL/6", ]
BALB_ang = ang_mat[ang_mat$Strain == "BALB/c", ]

par(mfrow = c(1,3))
boxplot(B6C3F1_ang$PA,  CD_ang$PA, C57_ang$PA, BALB_ang$PA,
        names = c("B6C3F1", "CD-1", "C57BL", "BALB/c"),
        main = "Parent/Accessory Angle")

boxplot(B6C3F1_ang$OA,  CD_ang$OA, C57_ang$OA, BALB_ang$OA,
        names = c("B6C3F1", "CD-1", "C57BL", "BALB/c"),
        main = "Accessory/Other Angle")

boxplot(B6C3F1_ang$PO,  CD_ang$PO, C57_ang$PO, BALB_ang$PO,
        names = c("B6C3F1", "CD-1", "C57BL", "BALB/c"),
        main = "Parent/Other Angle")

summary(aov(formula = PA ~ Strain, data = ang_mat))
summary(aov(formula = PO ~ Strain, data = ang_mat))
summary(aov(formula = OA ~ Strain, data = ang_mat))

summary(aov(formula = PVAc ~ Strain, data = ang_mat))