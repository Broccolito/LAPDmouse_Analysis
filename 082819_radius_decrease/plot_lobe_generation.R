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

rm(list = ls())
load(file = "radii_lobe_mean.RData")

ggplot(data = subset(radii_lobe_df, generation <= 8), aes(x = generation, y = radius)) + 
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = radius - std, ymax = radius + std), 
                width = 0.2, size = 1) + 
  xlab("Airway Generation") + 
  ylab("Airway Radius") +
  facet_grid(strain ~ lobe) + 
  theme_bw() +
  theme(text = element_text(size = 20), 
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15)) + 
  ggsave(filename = "radii_lobe_mean.png", device = "png",
         dpi = 1200, width = 12, height = 10)

ggplot(data = subset(radii_lobe_df, generation <= 15), aes(x = generation,
                                                           y = log(n, base = 2))) + 
  geom_point(size = 2) +
  xlab("Airway Generation") + 
  ylab("log Detectable Airway #") +
  facet_grid(strain ~ lobe) + 
  theme_bw() +
  theme(text = element_text(size = 20), 
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15)) + 
  ggsave(filename = "count_lobe_mean.png", device = "png",
         dpi = 1200, width = 12, height = 10)