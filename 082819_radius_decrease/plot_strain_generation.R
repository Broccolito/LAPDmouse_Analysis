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
load(file = "radii_mean.RData")

# fm = y ~ poly(x, 5)
dodge = 0.2
plt = ggplot(data = overall_radii, aes(x = generation, y = radius)) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = radius - std, ymax = radius + std), 
                width = 0.2, size = 1) + 
  # geom_smooth(aes(color = strain), method = lm, formula = fm, se = FALSE) +
  xlab("Airway Generation") +
  ylab("Radius") +
  theme_classic() + 
  theme(text = element_text(size = 20, color = "black"),
        legend.title= element_text(size = 15),
        legend.text = element_text(size = 13)) + 
  ggsave(filename = "Airway_Generation.png", device = "png", 
         width = 9, height = 6, dpi = 1200)

strain_plt = ggplot(data = radii_df, aes(x = generation, y = radius)) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = radius - std, ymax = radius + std), 
                width = 0.2, size = 1) + 
  # geom_smooth(aes(color = strain), method = lm, formula = fm, se = FALSE) +
  xlab("Airway Generation") +
  ylab("Radius") +
  theme_classic() + 
  theme(text = element_text(size = 20, color = "black"),
        legend.title= element_text(size = 15),
        legend.text = element_text(size = 13)) + 
  facet_grid(rows = .~strain) +
  ggsave(filename = "Airway_Generation.png", device = "png", 
         width = 9, height = 6, dpi = 1200)

strain_plt = ggplotly(strain_plt)
plt = ggplotly(plt)