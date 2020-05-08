rm(list = ls())
graphics.off()
gc()

library(ggplot2)
library(gridExtra)
library(ggpubr)
library(ggpmisc)

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

d = read.csv("depo_dist.csv")

plt1 = ggplot(data = d, aes(x = dis,y = depo)) +
  geom_point(color = "gray") +
  geom_smooth(method = "lm",color = "black",formula = "y~x") +
  xlab("Distance (mm)") +
  ylab("Mean Deposition") +
  stat_fit_glance(method = 'lm',
                  method.args = list(formula = "y~x"),
                  geom = "text",
                  aes(label = paste("P = ", signif(..p.value.., digits = 3), sep = "")),
                  size = 3) +
  facet_wrap(.~id,nrow = 5,scales = "free_y") +
  theme_classic() +
  ggsave(filename = "depo_dist_overall.png",device = "png",dpi = 1200,
         height = 12,width = 16)

plt2 = ggplot(data = filter(d,id=="m27"|id=="m08"|id=="m34"), aes(x = dis,y = depo)) + 
  geom_point(size = 1.8,
             color = ifelse(filter(d,id=="m27"|id=="m08"|id=="m34")$depo>=2.329173,"red","black")) + 
  geom_smooth(method = "lm",color = "black",formula = "y~x") + 
  xlab("Distance (mm)") + 
  ylab("Mean Deposition") + 
  # stat_fit_glance(method = 'lm',
  #                 method.args = list(formula = "y~x"),
  #                 geom = "text",
  #                 aes(label = paste("P = ", signif(..p.value.., digits = 3), sep = "")),
  #                 size = 3) + 
  facet_wrap(.~id,nrow = 1,scales = "fixed") +
  theme_classic() + 
  theme(text = element_text(size = 20)) + 
  ggsave(filename = "depo_dist_2micron.png",device = "png",dpi = 1200,
         height = 5,width = 12)