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

wd = get_directory()
setwd(wd)

#Read in all the csv files
fl = list.files(pattern = "csv")
for(f in fl){
  data = read.csv(file = f)
  assign(as.character(f), data)
}

for(d in ls(pattern = ".csv")){
  
  plot_name = unlist(strsplit(d, "[.]"))[1]
  
  data = get(d)
  
  ggplot(data = data, aes(time)) + 
    geom_line(aes(y = Flow), colour = "coral") + 
    geom_line(aes(y = RR), colour = "steelblue1") + 
    geom_line(aes(y = Inspiration * 100)) + 
    xlab("Time(s)") + 
    ylab("Airflow/RR/Inspiration") + 
    #xlim(min(data$time), min(data$time) + 8) + 
    ggtitle(label = paste0("Airflow, RR and Inspiration Vs. Time  of  ",plot_name),
            subtitle = "Orange: Airflow; Blue: Respiration Rate; Black: Inspiration")
  
  ggsave(filename = paste0(plot_name, ".png"))
  
}












