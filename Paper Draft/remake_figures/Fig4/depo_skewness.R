rm(list = ls())
graphics.off()

library(ggplot2)
library(knitr)
library(readxl)
library(listviewer)
library(e1071)
library(ggpubr)

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
  # TreeTable = as.data.frame(read.csv(list.files(pattern = "TreeTable")))
  # LobeDep = as.data.frame(read.csv(list.files(pattern = "LobesDeposition")))
  # SublobDep = as.data.frame(read.csv(list.files(pattern = "SublobesDeposition")))
  AciniDep = as.data.frame(read.csv(list.files(pattern = "NearAciniDeposition")))
  assign(paste0(folder, "_data"), list(
    # TreeTable = TreeTable,
    # LobeDep = LobeDep,
    # SublobDep = SublobDep,
    AciniDep = AciniDep
  ))
  setwd(wd)
  getinto("CSV_Data")

}

setwd(wd)
# rm(SublobDep)
# rm(TreeTable)
rm(AciniDep)
# rm(LobeDep)

vlist = ls(pattern = "_data")

moment_list = vector()
sd_list = vector()
mean_list = vector()

for(v in vlist){
  d = get(v)
  d$AciniDep[d$AciniDep$mean > 4,] = 4
  moment_list = c(moment_list, moment(d$AciniDep$mean , order=3, center=TRUE))
  sd_list = c(sd_list, sd(d$AciniDep$mean))
  mean_list = c(mean_list, mean(d$AciniDep$mean))
}

sample_data = as.data.frame(read_excel("080419_sample_summary.xlsx"))

reg_data = data.frame(
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

comparisons = list(c("1", "2"), c("0.5", "2") )

###############
p1 = ggplot(data = reg_data, aes(x = psf, y = moment_list)) +
  geom_boxplot() + geom_point(col = "black", size = 2.5, position = "dodge") +
  stat_compare_means(comparisons = comparisons, size = 5) + 
  xlab("Particle Size (??m)") + 
  ylab("Skewness") +
  theme_bw(base_size = 20) +
  ggtitle(label = NULL, subtitle = NULL) 
# ggsave(filename = "skewness Vs. Particle Size.png", device = "png", dpi = 1200, width = 6, height = 6)


p2 = ggplot(data = reg_data, aes(x = psf, y = sd_list)) +
  geom_boxplot() + geom_point(col = "black",size = 2.5, position = "dodge") +
  stat_compare_means(comparisons = comparisons, size = 5) + 
  xlab("Particle Size (??m)") + 
  ylab("Standard Deviation") + 
  theme_bw(base_size = 20) +
  ggtitle(label = NULL, subtitle = NULL)
# ggsave(filename = "std Vs. Particle Size.png", device = "png", dpi = 1200, width = 6, height = 6)

p3 = ggarrange(p2, p1, nrow = 1)

ggsave(filename = "Figure 3.png", plot = p3, 
       device = "png", width = 13, height = 6, dpi = 1200)