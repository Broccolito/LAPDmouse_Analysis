library(ggplot2)
library(knitr)

graphics.off()

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

adf = function(df){
  smart_assign = function(x){
    if(!exists(x)){
      assign(x, NA, envir = globalenv())
    }
  }
  sapply(names(df), smart_assign)
  return()
}

print_sig = function(fm){
  print(fm)
  print(kable(summary(lm(data = data, formula = fm))$coefficient))
}

setwd(get_directory())

data = read.csv(file = "FractalResultsFinal.csv")
data = data[data$q != "C",]
data$red = data$near_acini_std / data$near_acini_mean
`Particle Size` = as.factor(data$ps)
Strain = data$strain

##### Compare the slope and intercept with lobar deposition

print_sig(dvleft ~ b)
print_sig(dvcranial ~ b)
print_sig(dvmiddle ~ b)
print_sig(dvcaudal ~ b)
print_sig(dvaccessory ~ b)

print_sig(dvleft ~ m)
print_sig(dvcranial ~ m)
print_sig(dvmiddle ~ m)
print_sig(dvcaudal ~ m)
print_sig(dvaccessory ~ m)

if(F){
  ##### Intercept
  ggplot(data = data, aes(x = dvleft, y = b)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Left") + 
    ylab("Intercept") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Left Fractal Intercept.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ggplot(data = data, aes(x = dvcranial, y = b)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Cranial") + 
    ylab("Intercept") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Cranial Fractal Intercept.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ggplot(data = data, aes(x = dvmiddle, y = b)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Middle") + 
    ylab("Intercept") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Middle Fractal Intercept.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ggplot(data = data, aes(x = dvcaudal, y = b)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Caudal") + 
    ylab("Intercept") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Caudal Fractal Intercept.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ggplot(data = data, aes(x = dvaccessory, y = b)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Accessory") + 
    ylab("Intercept") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Accessory Fractal Intercept.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ##### Slope
  
  ggplot(data = data, aes(x = dvleft, y = m)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Left") + 
    ylab("Slope") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Left Fractal Slope.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ggplot(data = data, aes(x = dvcranial, y = m)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Cranial") + 
    ylab("Slope") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Cranial Fractal Slope.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ggplot(data = data, aes(x = dvmiddle, y = m)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Middle") + 
    ylab("Slope") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Middle Fractal Slope.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ggplot(data = data, aes(x = dvcaudal, y = m)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Caudal") + 
    ylab("Slope") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Caudal Fractal Slope.png", device = "png",
           width = 8, height = 6, dpi = 1200)
  
  ggplot(data = data, aes(x = dvaccessory, y = m)) + 
    geom_point(aes(pch = strain), size = 3) + 
    geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
    xlab("DV Accessory") + 
    ylab("Slope") +
    theme_classic() + 
    theme(text = element_text(size = 20)) + 
    ggsave(filename = "Accessory Fractal Slope.png", device = "png",
           width = 8, height = 6, dpi = 1200)
}

# print_sig(near_acini_mean ~ b)
print_sig(near_acini_std ~ b)
print_sig(near_acini_skewness ~ b)

# print_sig(near_acini_mean ~ m)
print_sig(near_acini_std ~ m)
print_sig(near_acini_skewness ~ m)

ggplot(data = data, aes(x = near_acini_std, y = b)) + 
  geom_point(aes(pch = Strain, color = `Particle Size`), size = 3) + 
  geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
  xlab("Standard Deviation") + 
  ylab("Intercept") +
  theme_classic() + 
  theme(text = element_text(size = 20)) + 
  ggsave(filename = "Std Intercept.png", device = "png",
         width = 8, height = 6, dpi = 1200)

ggplot(data = data, aes(x = near_acini_skewness, y = b)) + 
  geom_point(aes(pch = Strain, color = `Particle Size`), size = 3) + 
  geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
  xlab("Skewness") + 
  ylab("Intercept") +
  theme_classic() + 
  theme(text = element_text(size = 20)) + 
  ggsave(filename = "Skewness Intercept.png", device = "png",
         width = 8, height = 6, dpi = 1200)

ggplot(data = data, aes(x = near_acini_std, y = m)) + 
  geom_point(aes(pch = Strain, color = `Particle Size`), size = 3) + 
  geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
  xlab("Standard Deviation") + 
  ylab("Slope") +
  theme_classic() + 
  theme(text = element_text(size = 20)) + 
  ggsave(filename = "Std Slope.png", device = "png",
         width = 8, height = 6, dpi = 1200)

ggplot(data = data, aes(x = near_acini_skewness, y = m)) + 
  geom_point(aes(pch = Strain, color = `Particle Size`), size = 3) + 
  geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
  xlab("Skewness") + 
  ylab("Slope") +
  theme_classic() + 
  theme(text = element_text(size = 20)) + 
  ggsave(filename = "Skewness Slope.png", device = "png",
         width = 8, height = 6, dpi = 1200)

ggplot(data = data, aes(x = near_acini_std, y = b)) + 
  geom_point(aes(pch = strain), size = 3) + 
  geom_smooth(method = "lm", color = "black", se = FALSE, size = 2) + 
  xlab("Standard Deviation") + 
  ylab("Intercept") +
  theme_classic() + 
  theme(text = element_text(size = 20)) + 
  facet_grid(rows = .~ as.factor(ps)) +
  ggsave(filename = "Std Intercept by PS.png", device = "png",
         width = 12, height = 3, dpi = 1200)


ggplot(data = data, aes(x = near_acini_skewness, y = b)) + 
  geom_point(aes(pch = Strain, color = `Particle Size`), size = 3) + 
  geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
  xlab("Skewness") + 
  ylab("Intercept") +
  theme_classic() + 
  theme(text = element_text(size = 20)) + 
  facet_grid(rows = .~ ps)
ggsave(filename = "Skewness Intercept.png", device = "png",
       width = 15, height = 6, dpi = 1200)

# data2 = subset(data, ps == 2)
# ggplot(data = data2, aes(x = red, y = b)) + 
#   geom_point(aes(pch = strain), size = 3) + 
#   geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) + 
#   xlab("Relative Dispersion") + 
#   ylab("Intercept") +
#   theme_classic() + 
#   theme(text = element_text(size = 20)) + 
#   # facet_grid(rows = .~ ps) +
#   ggsave(filename = "Relative dispersion Intercept.png", device = "png",
#          width = 6, height = 6, dpi = 1200)
# 
# data0.5 = subset(data, ps == 0.5)
# ggplot(data = data0.5, aes(x = red, y = m)) +
#   geom_point(aes(pch = strain, color = q), size = 3) +
#   geom_smooth(method = "lm", color = "black", se = TRUE, size = 2) +
#   xlab("Relative Dispersion") +
#   ylab("Slope") +
#   theme_classic() +
#   theme(text = element_text(size = 20)) +
#   # facet_grid(rows = .~ ps) +
#   ggsave(filename = "Relative dispersion Slope.png", device = "png",
#          width = 6, height = 6, dpi = 1200)