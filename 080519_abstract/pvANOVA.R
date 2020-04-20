library(readxl)
library(multcomp)
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

data = as.data.frame(read_excel(path = "pvANOVA.xlsx", sheet = "ps2"))

res.aov = aov(data = data, formula = pvratio ~ lobe)
res.HSD = as.data.frame(TukeyHSD(res.aov)$lobe)
res.HSD = res.HSD[order(res.HSD$`p adj`),]

# windows(600,300)
# par(mfrow=c(1,2))
# plot(res.aov, 1)
# plot(res.aov, 2)

print(summary(res.aov))
kable(res.HSD)
