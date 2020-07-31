try({
  rgl.close()
}, silent = TRUE)
open3d()
for(j in 1:dim(dp)[1]){
  
  data = dp[j,]
  rgl.spheres(x = data$centroidX,
              y = data$centroidY,
              z = data$centroidZ,
              r = 0.15,
              color = "black")
  
}
for(i in 1:dim(aw)[1]){
  
  data = aw[i,]
  airway = cylinder3d(
    center = cbind(c(data$centroidX + 0.5 * data$length * data$directionX,
                     data$centroidX - 0.5 * data$length * data$directionX),
                   c(data$centroidY + 0.5 * data$length * data$directionY,
                     data$centroidY - 0.5 * data$length * data$directionY),
                   c(data$centroidZ + 0.5 * data$length * data$directionZ,
                     data$centroidZ - 0.5 * data$length * data$directionZ)),
    radius = data$radius / 5
    
  )
  #shade3d(addNormals(subdivision3d(airway, depth = 0)), col = rainbow(data_dimension)[i])
  shade3d(addNormals(subdivision3d(airway, depth = 0)), col = "grey")
  
}
plot3d(x = pn$a,y = pn$b,z=pn$c, type = "s",col = "red",size =1)
