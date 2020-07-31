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

find_projection = function (p, l1 = NULL, l2 = NULL){
  if(is.list(l1)){
    if("l1" %in% names(l1)){
      l2 = l1$l2
      l1 = l1$l1
    }
    if("m" %in% names(l1)){
      l2 = c(1, l1$m + l1$b)
      l1 = c(0, l1$b)
    }
    if("a" %in% names(l1)){
      l2 = c(1, -(l1$a + l1$c)/l1$b)
      l1 = c(0, -l1$c/l1$b)
    }
  }
  if(is.vector(p)){
    p = matrix(p, nrow = 1, ncol = length(p))
    return_vector = TRUE
  }
  else {
    return_vector = FALSE
  }
  return_2d = FALSE
  if(ncol(p) == 2){
    p = cbind(p, rep(0, nrow(p)))
    l1 = c(l1, 0)
    l2 = c(l2, 0)
    return_2d = TRUE
  }
  r = matrix(NA, nrow = nrow(p), ncol = ncol(p))
  for (i in 1:nrow(p)){
    if(is.null(l2))
      l2 = 2 * l1
    if(sum((l2 - l1)^2)== 0)
      return(NA)
    u = sum((p[i, ] - l1)* (l2 - l1))/sum((l2 - l1)^2)
    r[i, ] = l1 + u * (l2 - l1)
  }
  if(return_vector && return_2d)
    return(as.vector(r)[1:2])
  if(return_vector && !return_2d)
    return(as.vector(r))
  if(!return_vector && return_2d)
    return(r[, 1:2])
}

get_depo_dist = function(sample_id){
  aw_wd = "CSV_Data/mxx/mxx_AirwayTreeTable.csv"
  dp_wd = "CSV_Data/mxx/mxx_NearAciniDeposition.csv"
  aw_wd = gsub("mxx",sample_id,aw_wd)
  dp_wd = gsub("mxx",sample_id,dp_wd)
  aw = read.csv(aw_wd)
  dp = read.csv(dp_wd)
  
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
  
  dis = vector()
  for(i in 1:dim(dp)[1]){
    depo = dp[i,]
    projection = find_projection(p = c(depo$centroidX,depo$centroidY,depo$centroidZ),
                                 l1=list(l1=c(itx,ity,itz),l2=c(x1,y1,z1)))
    dis = c(dis,((projection[1]-itx)^2+(projection[2]-ity)^2+(projection[3]-itz)^2)^0.5)
  }
  
  depo_distro = select(dp, mean,centroidX,centroidY,centroidZ) %>%
    mutate(distance = dis) %>%
    mutate(id = sample_id) %>%
    mutate(depo = mean) %>%
    select(id,depo,distance,centroidX,centroidY,centroidZ)
  
  # min_dist = depo_distro[which.min(depo_distro$distance),]
  # min_projection = find_projection(p = c(min_dist$centroidX,min_dist$centroidY,min_dist$centroidZ),
  #                                  l1=list(l1=c(itx,ity,itz),l2=c(x1,y1,z1)))
  # min_distance = ((min_projection[1]-itx)^2+(min_projection[2]-ity)^2+(min_projection[3]-itz)^2)^0.5
  # min_projection_point_dist = vector()
  # project_origin_dist = vector()
  # for(i in 1:dim(depo_distro)[1]){
  #   depo = depo_distro[i,]
  #   projection = find_projection(p = c(depo_distro$centroidX,
  #                                      depo_distro$centroidY,
  #                                      depo_distro$centroidZ),
  #                                l1=list(l1=c(itx,ity,itz),l2=c(x1,y1,z1)))
  #   min_projection_point_dist = c(min_projection_point_dist,
  #                                 ((projection[1]-min_projection[1])^2+
  #                                    (projection[2]-min_projection[1])^2+
  #                                    (projection[3]-min_projection[1])^2)^0.5)
  #   project_origin_dist = c(project_origin_dist,
  #                           ((projection[1]-itx)^2 +
  #                             (projection[2]-ity)^2 +
  #                             (projection[3]-itz)^2)^0.5)
  # }
  # for(i in 1:length(project_origin_dist)){
  #   if(project_origin_dist[i]<min_projection_point_dist[i]){
  #     depo_distro$distance[i] = depo_distro$distance[i] * (-1)
  #   }
  # }
  # dis = ifelse(project_origin_dist>min_projection_point_dist,dis,dis*(-1))
  # depo_distro = mutate(depo_distro,distance=dis)
  
  return(depo_distro)
}

wd = get_directory()
setwd(wd)

samples = c(paste0("m0",seq(1,9)),paste0("m",seq(10,34)))

depo_distro_overall = vector()
for(s in samples){
  depo_distro_overall = rbind.data.frame(depo_distro_overall, get_depo_dist(s))
  cat(paste0("Sample ", s, " Processed ..\n"))
}

write.csv(depo_distro_overall,"depo_distro_overall.csv",quote = FALSE,row.names = FALSE)
