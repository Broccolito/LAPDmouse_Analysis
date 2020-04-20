library(ggpubr)
library(ggplot2)

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

data$LOBE = factor(data$LOBE, levels = c("left", "cranial", "middle",
                                         "caudal", "accessory"))
data$STUDY = factor(data$STUDY, levels = c("This study", 
                                           "Brain et al. 1976", 
                                           "Yang et al. 2019"))

dodge_radiance = 0.4
ggplot(data = data, aes(x = LOBE, y = DV, group = STUDY_ANIMAL,
                        color = STUDY)) + 
  scale_colour_grey(start = 0, end = 0.6) +
  geom_point(aes(pch = ANIMAL), 
             size = 3, position=position_dodge(dodge_radiance)) + 
  geom_errorbar(aes(ymax = DV + SE, ymin = DV - SE), 
                width = 0.2,
                position=position_dodge(dodge_radiance), size = 1) +
  ylab("DV Ratio") + 
  xlab(NULL) +
  theme_classic() + 
  theme(text = element_text(size = 20, color = "black"),
        legend.title= element_text(size = 15),
        legend.text = element_text(size = 13)) +
  ggsave(filename = "fig2sub1.png", device = "png", 
         width = 9, height = 6, dpi = 1200)