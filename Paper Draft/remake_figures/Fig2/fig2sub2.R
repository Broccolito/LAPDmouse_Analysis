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

data$STUDY = factor(data$STUDY, levels = c("This study", 
                                           "Brain et al. 1976", 
                                           "Yang et al. 2019"))
data$PS = as.factor(data$PS)
data$STUDY_SIZE = paste(data$STUDY, data$PS)
data = subset(data, ANIMAL == "Mice C57BL/6")

dodge_radiance = 0.4

# kable(data)
`PARTICLE SIZE (??m)` = data$PS
ggplot(data = data, aes(x = LOBE, y = DV, group = STUDY_SIZE,
                        color = STUDY)) + 
  scale_colour_grey(start = 0, end = 0.5) +
  geom_point(aes(cex = `PARTICLE SIZE (??m)`), position=position_dodge(dodge_radiance)) + 
  geom_errorbar(aes(ymax = DV + SE, ymin = DV - SE), 
                width = 0.2,
                position=position_dodge(dodge_radiance), size = 1) +
  ylab("DV Ratio") + 
  xlab("Lung Lobe") +
  theme_classic() + 
  theme(text = element_text(size = 20, color = "black"),
        legend.title= element_text(size = 15),
        legend.text = element_text(size = 13)) + 
  ggsave(filename = "fig2sub2.png", device = "png", 
         width = 10, height = 6, dpi = 1200)
