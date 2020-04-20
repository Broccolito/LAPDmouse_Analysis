rm(list = ls())
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

getinto = function(filename){
  if(!dir.exists(filename)){
    print("The file is not found...")
    stop("Wrong directory...")
  }else{
    setwd(paste(getwd(),"/",filename,sep = ""))
  }
}

# get_generation = function(index){
#   n = 1
#   temp = index
#   while(length(temp) != 0){
#     temp = d$up_conn[d$up_conn[temp]]
#     index = temp
#     n = n + 1
#     print(temp)
#   }
#   return(n)
# }


get_generation = function(dataset = d, entrance = 1){
  generations = rep(-1, dim(d)[1])
  for(i in entrance:dim(d)[1]){
    if(i == entrance){
      generations[i] = 1
    }
    
    if(length(unlist(strsplit(as.character(d$down_conn[i]), "&"))) == 2){
      if(generations[i] == -1){
        generations[as.numeric(unlist(strsplit(as.character(d$down_conn[i]), "&"))[1])] = -1
        generations[as.numeric(unlist(strsplit(as.character(d$down_conn[i]), "&"))[2])] = -1
      }else{
        generations[as.numeric(unlist(strsplit(as.character(d$down_conn[i]), "&"))[1])] = generations[i] + 1
        generations[as.numeric(unlist(strsplit(as.character(d$down_conn[i]), "&"))[2])] = generations[i] + 1
      }
    }
  }
  generations[generations == -1] = NA
  return(generations)
}


library(ggplot2)
library(knitr)

wd = get_directory()
setwd(wd)

filelist = paste0("Airway_with_UpDown_Conn/new_m", seq(1,34), "_data.csv")
filename = paste0("Airway_with_Generation/m", seq(1,34), "_with_generations.csv")

for(i in 1:length(filelist)){
  f = filelist[i]
  fn = filename[i]
  d = read.csv(f)
  d = d[,-1]
  d = na.omit(d)
  generations = get_generation(d)
  # g_LMB = get_generation(d, 2)
  # g_RMB = get_generation(d, 3)
  # g_CrRMB = get_generation(d, 6)
  # g_MiRMB = get_generation(d, 15)
  # g_AcRMB = get_generation(d, 33)
  # g_CaRMB = get_generation(d, 34)
  d = cbind.data.frame(d, generations)
  write.table(d, file = fn, quote = FALSE, sep = ",", row.names = FALSE)
}

