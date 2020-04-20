graphics.off()
rm(list = ls())

library(readxl)
library(knitr)
library(ggplot2)
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

wd = get_directory()
setwd(wd)

data = as.data.frame(read_excel("080419_sample_summary_ps_errorbar.xlsx"))
data$lobe = factor(data$lobe, levels = c("left", "cranial", "middle", "caudal", "accessory"))
data$`Particle Size` = factor(data$ps)

p2 = ggplot(data, aes(x = lobe, y = mean, group = `Particle Size`, color = `Particle Size`)) + 
  geom_line() +
  geom_point()+
  scale_fill_manual("Particle Size") +  
  xlab("") +
  ylab("DV Ratio") + 
  geom_errorbar(aes(ymin = mean - std, ymax = mean + std), width = 0.2,
                position=position_dodge(0.1)) +
  ggsave(width = 5, height = 4.5, filename = "ps_errorbar_plot.png", device = "png", dpi = 1200)
