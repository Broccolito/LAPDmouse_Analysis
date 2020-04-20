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
data = data[data$Q != "C",] # Get rid of Quality C
data$Name = as.factor(data$Name)
data$lobe = factor(data$lobe, levels = c("left", "cranial", "middle", "caudal", "accessory"))
data$Strain = as.factor(data$Strain)
data$PS = as.factor(data$PS)

theme_set(theme_bw())
p1 = ggplot(data = data, aes(x = lobe, y = pvratio, group = Name)) +
  xlab("") +
  ylab("DV Ratio") +
  geom_point(aes(color = Strain, shape = Strain), size = 2.5) +
  scale_colour_grey(start = 0, end = 0.7) +
  geom_line(aes(color = Strain), size = 0.8) +
  facet_grid(rows = .~data$PS) + 
  ggtitle(label = NULL, subtitle = NULL) +
  theme_bw(base_size = 20) +
  theme(axis.text.x = element_text(angle = 60, hjust = 1, size = 20), 
        legend.text=element_text(size=15),
        strip.text = element_blank())
ggsave(filename = "DVratio_across_lobe.png",
       width = 16, height = 7, device = "png", dpi = 1200)

p1