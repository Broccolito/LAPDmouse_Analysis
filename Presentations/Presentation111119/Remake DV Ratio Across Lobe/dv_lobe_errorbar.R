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

data = as.data.frame(read_excel("080419_sample_summary_boxplot.xlsx"))
data$lobe = factor(data$lobe, levels = c("left", "cranial", "middle", "caudal", "accessory"))

p2 = ggplot(data, aes(x = lobe, y = mean, group = Strain, color = Strain)) + 
  geom_line() +
  geom_point()+
  xlab("") + 
  ylab("DV Ratio") + 
  geom_errorbar(aes(ymin= mean - std, ymax=mean + std), width = 0.2,
                position=position_dodge(0.2)) + 
  facet_grid(rows = .~ps) + 
  ggsave(width = 15, height = 6, filename = "errorbar_plot.png", device = "png", dpi = 1200)
