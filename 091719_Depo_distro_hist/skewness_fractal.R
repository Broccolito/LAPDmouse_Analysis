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

# Get rid of Quality C
for(v in vlist){
  if(v != "m25_data"){
    d = get(v)
    d$AciniDep[d$AciniDep$mean > 4,] = 4
    moment_list = c(moment_list, moment(d$AciniDep$mean , order=3, center=TRUE))
    sd_list = c(sd_list, sd(d$AciniDep$mean))
    mean_list = c(mean_list, mean(d$AciniDep$mean))
  }
}

# Get rid of Quality C
sample_data = as.data.frame(read_excel("080419_sample_summary.xlsx"))[-25,]

ps1 = which(sample_data$PS == 1)
ps2 = which(sample_data$PS == 2)
sample_data2 = sample_data[ps2,]
sample_data1 = sample_data[ps1,]


sample_data1 = data.frame(name = sample_data1$Name,
                         strain = sample_data1$Strain, 
                         std = sd_list[ps1], 
                         moment = moment_list[ps1])

comparisons = list(c("B6C3F1", "BALB/c"), c("B6C3F1", "C57BL/6"), c("B6C3F1", "CD-1"),
                   c("BALB/c", "CD-1"), c("BALB/c", "C57BL/6"),
                   c("CD-1", "C57BL/6"))

ggplot(data = sample_data1, aes(x = as.factor(strain), y = moment_list[ps1])) + 
  geom_boxplot() + 
  # stat_summary(fun.y = mean, geom ="line", color="red", fill="red") +
  geom_point(size = 2) +
  stat_compare_means(comparisons = comparisons, size = 5) + 
  ggtitle("Particle Size: 1 Micron") + 
  xlab("Strain") + 
  # ylim(0,1.5) + 
  ylab("Third Moment of Near Acini Deposition") + 
  theme_classic() + 
  theme(text = element_text(size=20)) +
  ggsave(filename = "Moment Vs. Strain 1 micron.png", device = "png", dpi = 800,
         width = 8, height = 8)

ggplot(data = sample_data1, aes(x = as.factor(strain), y = sd_list[ps1])) + 
  geom_boxplot() + 
  # stat_summary(fun.y = mean, geom ="line", color="red", fill="red") +
  geom_point(size = 2) +
  stat_compare_means(comparisons = comparisons, size = 5) + 
  ggtitle("Particle Size: 1 Micron") + 
  xlab("Strain") + 
  ylab("Standard Deviation of Near Acini Deposition") + 
  theme_classic() + 
  theme(text = element_text(size=20)) +
  ggsave(filename = "Moment Vs. std 1 micron.png", device = "png", dpi = 800,
         width = 8, height = 8)




#############

sample_data2 = data.frame(name = sample_data2$Name,
                          strain = sample_data2$Strain, 
                          std = sd_list[ps2], 
                          moment = moment_list[ps2])

comparisons = list(c("B6C3F1", "BALB/c"), c("B6C3F1", "C57BL/6"), c("B6C3F1", "CD-1"),
                   c("BALB/c", "CD-1"), c("BALB/c", "C57BL/6"),
                   c("CD-1", "C57BL/6"))

ggplot(data = sample_data2, aes(x = as.factor(strain), y = moment_list[ps2])) + 
  geom_boxplot() + 
  # stat_summary(fun.y = mean, geom ="line", color="red", fill="red") +
  geom_point(size = 2) +
  stat_compare_means(comparisons = comparisons, size = 5) + 
  ggtitle("Particle Size: 2 Micron") + 
  # ylim(0,1.5) + 
  xlab("Strain") + 
  ylab("Third Moment of Near Acini Deposition") + 
  theme_classic() + 
  theme(text = element_text(size=20)) +
  ggsave(filename = "Moment Vs. Strain 2 micron.png", device = "png", dpi = 800,
         width = 8, height = 8)

ggplot(data = sample_data2, aes(x = as.factor(strain), y = sd_list[ps2])) + 
  geom_boxplot() + 
  # stat_summary(fun.y = mean, geom ="line", color="red", fill="red") +
  geom_point(size = 2) +
  stat_compare_means(comparisons = comparisons, size = 5) + 
  ggtitle("Particle Size: 2 Micron") + 
  xlab("Strain") + 
  ylab("Standard Deviation of Near Acini Deposition") + 
  theme_classic() + 
  theme(text = element_text(size=20)) +
  ggsave(filename = "Moment Vs. std 2 micron.png", device = "png", dpi = 800,
         width = 8, height = 8)