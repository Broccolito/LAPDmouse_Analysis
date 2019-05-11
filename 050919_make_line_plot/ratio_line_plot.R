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
  assign(paste0(data_folder_head, "_ratio"), ratio)
  
  # Legend = c(rep("Volume Ratio", length(vv_ratio)),rep("Particle Ratio", length(pp_ratio)))
  # 
  # ratio_data = data.frame(data$label,ratio, Legend)
  # 
  # ggplot(data = ratio_data, aes(x = data.label, y = ratio, fill = Legend)) + 
  #   geom_bar(stat="identity", color="black", position = "dodge") +
  #   xlab("Lobe Label") + 
  #   ylab("Relative Ratio") +
  #   ggtitle(paste0("Sample ", data_folder_head)) +
  #   theme_minimal()
  # 
  # setwd(graphics_wd)
  # ggsave(filename = paste0(data_folder_head, ".png"), device = "png")
  # 
  setwd(wd)
  # cat(paste0("Plot for ", data_folder_head, " saved..\n"))
  # 
}

#All the ratios
ratio_list = ls(pattern = "_ratio")[1:18]
ratio_mat = vector()
for(ratio in ratio_list){
  ratio_mat = rbind(ratio_mat, get(ratio))
}
ratio_mat = as.data.frame(ratio_mat)
vv_ratio_mat = ratio_mat[1:5]
pp_ratio_mat = ratio_mat[6:10]
# kable(vv_ratio_mat)
# kable(pp_ratio_mat)

ratio_names = unlist(lapply(strsplit(ratio_list, "[_]"), `[[`, 1))

rownames(vv_ratio_mat) = ratio_names
rownames(pp_ratio_mat) = ratio_names
colnames(vv_ratio_mat) = data$label
colnames(pp_ratio_mat) = data$label

kable(vv_ratio_mat)
kable(pp_ratio_mat)

graphics.off()
windows()

for(i in 1:17){
  plot(as.numeric(vv_ratio_mat[i,]),
       xlab = "",
       ylab = "",
       yaxt="n",
       xaxt = "n",
       type = "b",
       col = rainbow(18)[i])
  par(new = TRUE)
}
plot(as.numeric(vv_ratio_mat[18,]),
     main = "Volume to Volume Ratio Plot",
     xlab = "", ylab = "", type = "b", xaxt = "n",
     col = rainbow(18)[18])
axis(1, at = 1:5, labels = data$label)
par(new = FALSE)

windows()
for(i in 1:17){
  plot(as.numeric(pp_ratio_mat[i,]), 
       xlab = "", 
       ylab = "", 
       yaxt="n", 
       xaxt = "n", 
       type = "b", 
       col = rainbow(18)[i])
  par(new = TRUE)
}
plot(as.numeric(pp_ratio_mat[18,]), 
     main = "Particle to Volume Ratio Plot",
     xlab = "", ylab = "", type = "b", xaxt = "n",
     col = rainbow(18)[18])
axis(1, at = 1:5, labels = data$label)
par(new = FALSE)

windows()
plot(1:18, 1:18, main = "legend color", cex = 3, pch = 16, col = rainbow(18))
axis(1, at = 1:18, labels = seq(1,18,1))

#Using ggplot2
kable(vv_ratio_mat)
kable(pp_ratio_mat)
vv_gg_mat = t(vv_ratio_mat)
pp_gg_mat = t(pp_ratio_mat)

vv_gg_mat = cbind.data.frame(label = data$label, vv_gg_mat)
pp_gg_mat = cbind.data.frame(label = data$label, pp_gg_mat)

graphics.off()
windows()
ggplot(data = vv_gg_mat) + 
  geom_point(aes(x = label, y = m1)) + 
  geom_point(aes(x = label, y = m2)) + 
  geom_point(aes(x = label, y = m3)) + 
  geom_point(aes(x = label, y = m4)) + 
  geom_point(aes(x = label, y = m5)) + 
  geom_point(aes(x = label, y = m6)) + 
  geom_point(aes(x = label, y = m7)) + 
  geom_point(aes(x = label, y = m8)) + 
  geom_point(aes(x = label, y = m9)) + 
  geom_point(aes(x = label, y = m10)) + 
  geom_point(aes(x = label, y = m11)) + 
  geom_point(aes(x = label, y = m12)) + 
  geom_point(aes(x = label, y = m13)) + 
  geom_point(aes(x = label, y = m14)) + 
  geom_point(aes(x = label, y = m15)) + 
  geom_point(aes(x = label, y = m16)) + 
  geom_point(aes(x = label, y = m17)) + 
  geom_point(aes(x = label, y = m18)) 


