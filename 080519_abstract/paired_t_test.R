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

data = as.data.frame(read_excel(path = "pvANOVA.xlsx", sheet = "Overall"))

data = data[data$PS != 0.5,]

l = dim(data)[1]
ones = rep(1, l)

t.test(data$pvcranial, ones, paired = TRUE)
t.test(data$pvcaudal, ones, paired = TRUE)
t.test(data$pvmiddle, ones, paired = TRUE)
t.test(data$pvleft, ones, paired = TRUE)
t.test(data$pvaccessory, ones, paired = TRUE)

# [data$PS == 1,]

l = dim(data[data$PS == 1,])[1]
ones = rep(1, l)

t.test(data$pvcranial[data$PS == 1], ones, paired = FALSE)
# t.test(data$pvcranial[data$PS == 0.5], ones, paired = FALSE)
