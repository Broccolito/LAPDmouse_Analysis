rm(list = ls())
graphics.off()

library(knitr)
library(readxl)


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

getinto = function(filename){
  if(!dir.exists(filename)){
    print("The file is not found...")
    stop("Wrong directory...")
  }else{
    setwd(paste(getwd(),"/",filename,sep = ""))
  }
}

wd = get_directory()
setwd(wd)

filelist = paste0("Airway_with_Generation/m", seq(1,34), "_with_generations.csv")
filenames = paste0("m", seq(1,34), " Airway Radius Vs. Generations")

for(i in 1:length(filelist)){
  f = filelist[i]
  fn = filenames[i]
  d = read.csv(f)
  d = cbind.data.frame(d$radius, as.factor(d$generations))
  d = na.omit(d)
  colnames(d) = c("radius", "generation")
  p = ggplot(d, aes(x=generation, y=radius)) + 
    geom_boxplot(outlier.colour="red", outlier.shape=8, outlier.size=1) + 
    stat_summary(fun.y = mean, colour="darkblue", geom = "point", 
                 shape = 16, size=3) + 
    xlab("Airway Generation") + 
    ylab("Airway Radius") + 
    ggtitle(fn, subtitle = "Dark Blue Dot: Average Radius || Red Star: Outlier")
  ggsave(filename = paste0("radius_decrease_plot/", fn, ".png"), 
         device = "png", plot = p, width = 10, height = 10)
}




