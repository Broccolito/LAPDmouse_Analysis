rm(list = ls())
graphics.off()

library(ggplot2)
library(knitr)
library(readxl)
library(listviewer)
library(e1071)

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
rm(SublobDep)
rm(TreeTable)
rm(AciniDep)
rm(LobeDep)

vlist = ls(pattern = "_data")

moment_list = vector()
sd_list = vector()
mean_list = vector()
median_list = vector()

for(v in vlist){
  d = get(v)
  d$AciniDep[d$AciniDep$mean > 4,] = 4
  moment_list = c(moment_list, moment(d$AciniDep$mean , order=3, center=TRUE))
  sd_list = c(sd_list, sd(d$AciniDep$mean))
  mean_list = c(mean_list, mean(d$AciniDep$mean))
  median_list = c(median_list, median(d$AciniDep$mean))
}

near_acini_stat = data.frame(skewness = moment_list, sd = sd_list,
                             mean = mean_list, median = median_list)

try({
  write.csv(near_acini_stat, file = "near_acini_stat.csv", 
            quote = FALSE, row.names = FALSE)
})

sample_data = as.data.frame(read_excel("080419_sample_summary.xlsx"))

reg_data = data.frame(
  name = as.factor(sample_data$Name),
  strain = as.factor(sample_data$Strain),
  q = as.factor(sample_data$Q),
  wt = as.numeric(sample_data$Wt.),
  ps = as.numeric(sample_data$PS),
  psf = as.factor(sample_data$PS),
  sex = as.factor(sample_data$Sex),
  lv = as.numeric(sample_data$LV),
  strain = as.factor(sample_data$Strain),
  mean = mean_list,
  std = sd_list,
  skewness = moment_list)

reg_data_1 = subset(reg_data, ps == 1)
reg_data_2 = subset(reg_data, ps == 2)
reg_data_0.5 = subset(reg_data, ps == 0.5)

ggplot(data = reg_data_1, aes(x = strain, y = skewness)) + 
  geom_boxplot() + 
  ggtitle("Skewness Vs. Strain for ps = 1")
ggsave(filename = "overall/skewness Vs. Strain for ps = 1.png", device = "png")

ggplot(data = reg_data_2, aes(x = strain, y = skewness)) + 
  geom_boxplot() + 
  ggtitle("Skewness Vs. Strain for ps = 2")
ggsave(filename = "overall/skewness Vs. Strain for ps = 2.png", device = "png")

ggplot(data = reg_data_1, aes(x = strain, y = std)) + 
  geom_boxplot() + 
  ggtitle("Std Vs. Strain for ps = 1")
ggsave(filename = "overall/std Vs. Strain for ps = 1.png", device = "png")

ggplot(data = reg_data_2, aes(x = strain, y = std)) + 
  geom_boxplot() + 
  ggtitle("Std Vs. Strain for ps = 2")
ggsave(filename = "overall/std Vs. Strain for ps = 2.png", device = "png")

# l = lm(data = reg_data, moment_list ~ ps)
# sl = summary(l)
# print(sl$coefficients)
# 
# l = lm(data = reg_data,moment_list ~ lv)
# sl = summary(l)
# print(sl$coefficients)
# 
# l = lm(data = reg_data,moment_list ~ wt)
# sl = summary(l)
# print(sl$coefficients)

# Skewness
ggplot(data = reg_data, aes(x = strain, y = moment_list)) + 
  geom_boxplot() + 
  ggtitle("Skewness Vs. Strain")
ggsave(filename = "overall/skewness Vs. Strain.png", device = "png")

ggplot(data = reg_data, aes(x = sex, y = moment_list)) + 
  geom_boxplot() + 
  ggtitle("Skewness Vs. Sex")
ggsave(filename = "overall/skewness Vs. Sex.png", device = "png")

ggplot(data = reg_data, aes(x = ps, y = moment_list)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  ggtitle("Skewness Vs. Particle Size")
ggsave(filename = "overall/skewness Vs. Particle Size Regression.png", device = "png")

###############
ggplot(data = reg_data, aes(x = psf, y = moment_list)) +
  geom_boxplot() + geom_point(col = "black", size = 2, position = "dodge") +
  xlab("Particle Size") + 
  ylab("Skewness") +
  ggtitle("Skewness Vs. Particle Size") + 
  theme_bw()
ggsave(filename = "overall/skewness Vs. Particle Size.png", device = "png", dpi = 1200, width = 7, height = 7)

# Standard Deviation
ggplot(data = reg_data, aes(x = strain, y = sd_list)) + 
  geom_boxplot() + 
  ggtitle("std Vs. Strain")
ggsave(filename = "overall/std Vs. Strain.png", device = "png")

ggplot(data = reg_data, aes(x = sex, y = sd_list)) + 
  geom_boxplot() + 
  ggtitle("std Vs. Sex")
ggsave(filename = "overall/std Vs. Sex.png", device = "png")

ggplot(data = reg_data, aes(x = ps, y = sd_list)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  ggtitle("Standard Deviation Vs. Particle Size")
ggsave(filename = "overall/std Vs. Particle Size Regression.png", device = "png")

ggplot(data = reg_data, aes(x = psf, y = sd_list)) +
  geom_boxplot() + geom_point(col = "black", position = "dodge") +
  xlab("Particle Size") + 
  ylab("Standard Deviation") + 
  theme_bw() +
  ggtitle("Standard Deviation Vs. Particle Size")
ggsave(filename = "overall/std Vs. Particle Size.png", device = "png")

# Average 
ggplot(data = reg_data, aes(x = strain, y = mean_list)) + 
  geom_boxplot() + 
  ggtitle("mean Vs. Strain")
ggsave(filename = "overall/mean Vs. Strain.png", device = "png")

ggplot(data = reg_data, aes(x = sex, y = mean_list)) + 
  geom_boxplot() + 
  ggtitle("mean Vs. Sex")
ggsave(filename = "overall/mean Vs. Sex.png", device = "png")

ggplot(data = reg_data, aes(x = ps, y = mean_list)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  ggtitle("mean Vs. Particle Size")
ggsave(filename = "overall/mean Vs. Particle Size Regression.png", device = "png")

ggplot(data = reg_data, aes(x = psf, y = mean_list)) +
  geom_boxplot() + geom_point(col = "slateblue3") + 
  ggtitle("mean Vs. Particle Size")
ggsave(filename = "overall/mean Vs. Particle Size.png", device = "png")

{
l = lm(data = reg_data, moment_list ~ ps)
sl = summary(l)
print(sl$call)
print(kable(sl$coefficients))
cat("\n\n ---------------------- \n\n")

l = lm(data = reg_data,sd_list ~ ps)
sl = summary(l)
print(sl$call)
print(kable(sl$coefficients))
cat("\n\n ---------------------- \n\n")

l = lm(data = reg_data,mean_list ~ ps)
sl = summary(l)
print(sl$call)
print(kable(sl$coefficients))
cat("\n\n ---------------------- \n\n")

}
