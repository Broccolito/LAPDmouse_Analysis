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

data0.5 = data[data$PS == 0.5,]
data1 = data[data$PS == 1,]
data2 = data[data$PS == 2,]

comp_to_one = function(x){
  xlen = length(x)
  ones = rep(1, xlen)
  return(t.test(x, ones, paired = TRUE))
}

comp_to_one(data0.5$pvleft)$p.value
comp_to_one(data0.5$pvcranial)$p.value
comp_to_one(data0.5$pvmiddle)$p.value
comp_to_one(data0.5$pvcaudal)$p.value
comp_to_one(data0.5$pvaccessory)$p.value

comp_to_one(data1$pvleft)$p.value
comp_to_one(data1$pvcranial)$p.value
comp_to_one(data1$pvmiddle)$p.value
comp_to_one(data1$pvcaudal)$p.value
comp_to_one(data1$pvaccessory)$p.value

comp_to_one(data2$pvleft)$p.value
comp_to_one(data2$pvcranial)$p.value
comp_to_one(data2$pvmiddle)$p.value
comp_to_one(data2$pvcaudal)$p.value
comp_to_one(data2$pvaccessory)$p.value
