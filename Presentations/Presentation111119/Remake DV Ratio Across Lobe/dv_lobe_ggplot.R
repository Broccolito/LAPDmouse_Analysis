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

data = as.data.frame(read_excel("080419_sample_summary_ggplot.xlsx"))
data$Name = as.factor(data$Name)
data$lobe = factor(data$lobe, levels = c("left", "cranial", "middle", "caudal", "accessory"))
data$Strain = as.factor(data$Strain)
data$PS = as.factor(data$PS)

p1 = ggplot(data = data, aes(x = lobe, y = pvratio, group = Name)) +
  xlab("") +
  ylab("DV Ratio") +
  geom_point(aes(color = Strain)) +
  geom_line(aes(color = Strain)) +
  facet_grid(rows = .~data$PS) +
  ggsave(width = 15, height = 6, "DVratio_across_lobe.png", device = "png", dpi = 1200)

