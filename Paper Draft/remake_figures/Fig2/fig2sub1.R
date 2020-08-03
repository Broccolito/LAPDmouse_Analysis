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


data$STUDY_ANIMAL = factor(data$STUDY_ANIMAL,
                           levels = c("Mice C57BL/6 (This study)",
                                      "Mice C57BL/6 (Yang et al. 2019)",
                                      "Rat Sprague Dawley (Brain et al. 1976)",
                                      "Hamster Syrian Golden (Brain et al. 1976)"))

dodge_radiance = 0.6
# ggplot(data = data, aes(x = LOBE, y = DV)) + 
#   # scale_colour_grey(start = 0, end = 0.8) +
#   geom_point(aes(pch = STUDY_ANIMAL), 
#              size = 5, position=position_dodge(dodge_radiance)) + 
#   scale_shape_manual(values=c(16,1,12,2)) +
#   guides(shape = guide_legend(nrow = 2)) + 
#   geom_errorbar(aes(ymax = DV + SE, ymin = DV - SE,group = STUDY_ANIMAL), 
# =======
data$STUDY_ANIMAL = factor(levels = c("Mice C57BL/6 (This study)",
                                      "Mice C57BL/6 (Yang et al. 2019)",
                                      "Rat Sprague Dawley (Brain et al. 1976)",
                                      "Hamster Syrian Golden (Brain et al. 1976)"))
dodge_radiance = 0.6
plt1 = ggplot(data = data, aes(x = LOBE, y = DV,
                        shape = STUDY_ANIMAL)) +
  scale_shape_manual(values=c(16,21,22,24)) +
  geom_errorbar(aes(ymax = DV + SE, ymin = DV - SE), 
# >>>>>>> 9074619c4fcc85f36643da8b005b702266532920
                width = 0.2,
                position=position_dodge(dodge_radiance)) +
  geom_point(size = 5, position=position_dodge(dodge_radiance),
             colour = "black", fill = "white",stroke = 1) + 
  ylab("DV Ratio") + 
  xlab("Lung Lobe") +
  guides(shape = guide_legend(nrow = 2)) +
  # guide(shape = "") + 
  theme_classic() + 
  theme(text = element_text(size = 20, color = "black"),
        # legend.title = element_text(size = 15),
        legend.title = element_blank(),
        legend.text = element_text(size = 13),
# <<<<<<< HEAD
        axis.text.x = element_text(margin = margin(5,10,10,10),colour="black"),
        axis.text.y = element_text(colour = "black"),
        axis.ticks.x = element_line(colour = "black"),
        axis.ticks.y = element_line(colour = "black"),
        legend.position = "top") + 
  ggsave(filename = "fig2sub1.png", device = "png",
         width = 8, height = 6, dpi = 1200)
# =======
        # ) +
  # ggsave(filename = "sub1.png",device = "png",dpi=1200)

plt1
# >>>>>>> 9074619c4fcc85f36643da8b005b702266532920
