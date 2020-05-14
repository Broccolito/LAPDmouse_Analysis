rm(list = ls())
graphics.off()
gc()

library(ggplot2)
library(gridExtra)
library(ggpubr)
library(ggpmisc)
library(dplyr)
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

d = read.csv("depo_distro_overall.csv")

plt1 = ggplot(data = d, aes(x = distance,y = depo)) +
  geom_point(color = "black",size = 0.2) +
  geom_smooth(method = "lm",color = "coral",formula = "y~x",size = 0.7) +
  xlab("Distance (mm)") +
  ylab("Mean Aerosol Deposition (a.u.)") +
  stat_fit_glance(method = 'lm',
                  method.args = list(formula = "y~x"),
                  geom = "text",
                  aes(label = paste("P = ", signif(..p.value.., digits = 3), sep = "")),
                  size = 3) +
  facet_wrap(.~id,nrow = 5,scales = "free_y") +
  theme_bw() + 
  ggsave(filename = "depo_dist_overall.png",device = "png",
         dpi = 1200,width = 18,height = 9)


m08_threshold = median(filter(d,id=="m08")$depo)+qnorm(0.99)*sd(filter(d,id=="m08")$depo)
m27_threshold = median(filter(d,id=="m27")$depo)+qnorm(0.99)*sd(filter(d,id=="m27")$depo)
m34_threshold = median(filter(d,id=="m34")$depo)+qnorm(0.99)*sd(filter(d,id=="m34")$depo)
d_m08 = filter(d,id=="m08") %>%
  mutate(hotspot_color = ifelse(depo>m08_threshold,"black","gray60")) %>%
  mutate(hotspot_shape = ifelse(depo>m08_threshold,15,16))
d_m27 = filter(d,id=="m27")%>%
  mutate(hotspot_color = ifelse(depo>m27_threshold,"black","gray60")) %>%
  mutate(hotspot_shape = ifelse(depo>m27_threshold,15,16))
d_m34 = filter(d,id=="m34")%>%
  mutate(hotspot_color = ifelse(depo>m34_threshold,"black","gray60")) %>%
  mutate(hotspot_shape = ifelse(depo>m34_threshold,15,16))
d = rbind.data.frame(d_m08,d_m27,d_m34)
d$id = factor(d$id,levels = c("m34","m08","m27"))

plt2 = ggplot(data = d, aes(x = distance,y = depo)) + 
  geom_point(size = 1.8, color = d$hotspot_color, shape = d$hotspot_shape) + 
  geom_smooth(method = "lm",color = "black",formula = "y~x") + 
  xlab("Distance (mm)") + 
  ylab("Mean Aerosol Deposition (a.u.)") + 
  facet_wrap(.~id,nrow = 1,scales = "fixed") +
  theme_bw() + 
  theme(text = element_text(size = 20),
        strip.text = element_blank());plt2
ggsave(filename = "fig5.png",device = "png",dpi = 1200,
       width = 13, height = 6)

# 0.5 micron
summary(lm(depo~distance,data = d_m34))$coefficient
# 1 micron
summary(lm(depo~distance,data = d_m08))$coefficient
# 2 micron
summary(lm(depo~distance,data = d_m27))$coefficient
