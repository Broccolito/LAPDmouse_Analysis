library(ggpubr)
library(ggplot2)
library(knitr)

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

data = read.csv(file = "previous_studies_ggplot.csv")

data$LOBE = as.character(data$LOBE)
data$LOBE[data$LOBE=="left"]="Left"
data$LOBE[data$LOBE=="cranial"]="R.Cranial"
data$LOBE[data$LOBE=="middle"]="R.Middle"
data$LOBE[data$LOBE=="caudal"]="R.Caudal"
data$LOBE[data$LOBE=="accessory"]="R.Accessory"
data$LOBE = factor(data$LOBE, levels = c("Left", "R.Cranial", "R.Middle",
                                         "R.Caudal", "R.Accessory"))

data$PS = paste(data$PS,"µm")

data$STUDY = factor(data$STUDY, levels = c("This study", 
                                           "Brain et al. 1976", 
                                           "Yang et al. 2019"))
data$PS = as.factor(data$PS)
data$STUDY_SIZE = paste0(data$PS," (",data$STUDY,")")
data$STUDY_SIZE = as.factor(data$STUDY_SIZE)
data$STUDY_SIZE = factor(data$STUDY_SIZE,
                         levels = c("1 µm (This study)",
                                    "2 µm (This study)",
                                    "3.5 µm (Yang et al. 2019)"))
data = subset(data, ANIMAL == "Mice C57BL/6")

dodge_radiance = 0.4

ggplot(data = data, aes(x = LOBE, y = DV, group = STUDY_SIZE)) + 
  geom_point(aes(pch = STUDY_SIZE), size = 5,
             position=position_dodge(dodge_radiance)) + 
  scale_shape_manual(values=c(16,15,1)) +
  geom_errorbar(aes(ymax = DV + SE, ymin = DV - SE), 
                width = 0.2,
                position=position_dodge(dodge_radiance)) +
  ylab("DV Ratio") + 
  xlab("Lung Lobe") +
  theme_classic() + 
  theme(text = element_text(size = 20, color = "black"),
        legend.title= element_blank(),
        legend.text = element_text(size = 13),
        axis.text.x = element_text(margin = margin(5,10,10,10),colour = "black"),
        axis.text.y = element_text(colour = "black"),
        axis.ticks.x = element_line(colour = "black"),
        axis.ticks.y = element_line(colour = "black"),
        legend.position = "top") + 
  ggsave(filename = "fig2sub2.png", device = "png", 
         width = 8, height = 6, dpi = 1200)

