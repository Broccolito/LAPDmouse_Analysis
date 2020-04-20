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

data = read.csv("fractal_sample_summary.csv")
data = na.omit(data)
data = data[data$q != "C",]

kable(summary(lm(data = data, fractal5 ~ ps))$coefficient)
kable(summary(lm(data = data, fractal5 ~ dvaccessory))$coefficient)
kable(summary(lm(data = data, fractal5 ~ dvcranial))$coefficient)

ggplot(data = data, aes(x = ps, y = fractal5)) + 
  geom_smooth(method = "lm", color = "black") +
  geom_point(size = 3) + 
  theme_classic() + 
  theme(text = element_text(size = 20)) +
  xlab("Particle Size") + 
  ylab(("Fractal Slope")) + 
  ggsave(filename = "Fractal5 Vs. PS.png", device = "png", dpi = 1200, 
         width = 8, height = 8)

ggplot(data = data, aes(x = dvcranial, y = fractal5)) + 
  geom_smooth(method = "lm", color = "black") +
  geom_point(size = 3) + 
  theme_classic() + 
  theme(text = element_text(size = 20)) +
  xlab("DV Cranial") + 
  ylab(("Fractal Slope")) + 
  ggsave(filename = "Fractal5 Vs. DV Cranial.png", device = "png", dpi = 1200, 
         width = 8, height = 8)

ggplot(data = data, aes(x = dvaccessory, y = fractal5)) + 
  geom_smooth(method = "lm", color = "black") +
  geom_point(size = 3) + 
  theme_classic() + 
  theme(text = element_text(size = 20)) +
  xlab("DV accessory") + 
  ylab(("Fractal Slope")) + 
  ggsave(filename = "Fractal5 Vs. DV accessory.png", device = "png", dpi = 1200, 
         width = 8, height = 8)


ggplot(data = data, aes(x = ps, y = fractal4)) + 
  geom_smooth(method = "lm", color = "black") +
  geom_point(size = 3) + 
  theme_classic() + 
  theme(text = element_text(size = 20)) +
  xlab("Particle Size") + 
  ylab(("Fractal Slope")) + 
  ggsave(filename = "Fractal4 Vs. PS.png", device = "png", dpi = 1200, 
         width = 8, height = 8)

ggplot(data = data, aes(x = as.factor(ps), y = fractal5)) + 
  # geom_smooth(method = "lm", color = "black") +
  geom_boxplot() + 
  geom_point(size = 3) + 
  theme_classic() + 
  theme(text = element_text(size = 20)) +
  xlab("Particle Size") + 
  ylab(("Fractal Slope")) + 
  ggsave(filename = "Fractal5 Vs. PS boxplot.png", device = "png", dpi = 1200, 
         width = 8, height = 8)

ggplot(data = data, aes(x = as.factor(ps), y = fractal4)) + 
  # geom_smooth(method = "lm", color = "black") +
  geom_boxplot() + 
  geom_point(size = 3) + 
  theme_classic() + 
  theme(text = element_text(size = 20)) +
  xlab("Particle Size") + 
  ylab(("Fractal Slope")) + 
  ggsave(filename = "Fractal4 Vs. PS boxplot.png", device = "png", dpi = 1200, 
         width = 8, height = 8)