rm(list = ls())
graphics.off()
gc()

library(ggplot2)
library(dplyr)
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

wd = get_directory()
setwd(wd)

get_normal_plain = function(aw){
  lmb = filter(aw,parent==1,name=="LMB")
  rmb = filter(aw,parent==1,name=="RMB")
  
  itxl = lmb$centroidX - 0.5*lmb$length*lmb$directionX
  ityl = lmb$centroidY - 0.5*lmb$length*lmb$directionY
  itzl = lmb$centroidZ - 0.5*lmb$length*lmb$directionZ
  itxr = rmb$centroidX - 0.5*rmb$length*rmb$directionX
  ityr = rmb$centroidY - 0.5*rmb$length*rmb$directionY
  itzr = rmb$centroidZ - 0.5*rmb$length*rmb$directionZ
  itx = mean(itxl,itxr)
  ity = mean(ityl,ityr)
  itz = mean(itzl,itzr)
  l = min(c(lmb$length,rmb$length))
  lx = itx + l*lmb$directionX
  ly = ity + l*lmb$directionY
  lz = itz + l*lmb$directionZ
  rx = itx + l*rmb$directionX 
  ry = ity + l*rmb$directionY
  rz = itz + l*rmb$directionZ
  x1 = mean(c(lx,rx))
  y1 = mean(c(ly,ry))
  z1 = mean(c(lz,rz))
  pa = x1
  pb = y1
  pc = z1
  pd = x1*itx+y1*ity+z1*itz
  return(data.frame(a=pa,b=pb,c=pc,d=pd))
}

get_distance = function(normal_plane,dx,dy,dz){
  pa = normal_plane$a
  pb = normal_plane$b
  pc = normal_plane$c
  pd = normal_plane$d
  dis = abs(pa*dx+pb*dy+pc*dz-pd)/(sqrt(pa^2+pb^2+pc^2))
  return(dis)
}

get_depo_distro = function(sample_id){
  aw_wd = "CSV_Data/mxx/mxx_AirwayTreeTable.csv"
  dp_wd = "CSV_Data/mxx/mxx_NearAciniDeposition.csv"
  aw_wd = gsub("mxx",sample_id,aw_wd)
  dp_wd = gsub("mxx",sample_id,dp_wd)
  aw = read.csv(aw_wd)
  dp = read.csv(dp_wd)
  pn = get_normal_plain(aw)
  depo_dis_mat = vector()
  for(i in 1:dim(dp)[1]){
    depo_dis_list = data.frame(
      id = sample_id,
      depo = dp[i,]$mean,
      dis = get_distance(pn,dp[i,]$centroidX,dp[i,]$centroidY,dp[i,]$centroidZ)
    )
    depo_dis_mat = rbind.data.frame(depo_dis_mat,depo_dis_list)
  }
  return(depo_dis_mat)
}

samples = c(paste0("m0",seq(1,9)),paste0("m",seq(10,34)))

depo_distro = vector()
for(s in samples){
  depo_distro = rbind.data.frame(depo_distro, get_depo_distro(s))
  cat(paste0("Sample ", s, " Processed ..\n"))
}

write.csv(depo_distro,"depo_dist.csv",quote = FALSE,row.names = FALSE)

