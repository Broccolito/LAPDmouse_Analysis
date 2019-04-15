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

#Get filelist
fl = list.files(pattern = "csv")

#Get filename
temp = unlist(strsplit(fl, "[.]"))
fn = temp[temp != "csv"]

#Read the data into the workspace
for(i in 1:length(fl)){
  assign(fn[i], read.csv(fl[i]))
}

#Inhale average volume
#Inhale volume Std
#Exhale average volume
#Exhale volume Std
#Average Respiratory Rate
#Max Respiratory Rate
#Min Respiratory Rate
#Std Respiratory Rate
#Measurement Time Span

sum_up = function(dataset){
  
  flow_in = dataset$Flow[dataset$Flow > 10]
  flow_out = dataset$Flow[dataset$Flow <= 10]
  rr = dataset$RR
  mtime = dataset$time
  
  #Inhale average volume
  flow_in_average = mean(flow_in)
  #Inhale volume Std
  flow_in_std = sd(flow_in)
  #Exhale average volume
  flow_out_average = mean(flow_out)
  #Exhale volume Std
  flow_out_std = sd(flow_out)
  
  #Average Respiratory Rate
  rr_average = mean(rr)
  #Max Respiratory Rate
  rr_max = max(rr)
  #Min Respiratory Rate
  rr_min = min(rr[rr > 10]) #Omit measurement errors
  #Std Respiratory Rate
  rr_std = sd(rr[rr > 10]) #Omit measurement errors
  #Measurement Time Span
  mtime_range = max(mtime) - min(mtime)
  #Dataset Name
  dataset_name = deparse(substitute(dataset))
  
  res = round(c(flow_in_average, flow_in_std, 
                flow_out_average, flow_out_std, 
                rr_average, rr_max, rr_min,
                rr_std, mtime_range), 1)
  names(res) = c("Breathe in", "in std", 
                 "Breathe out", "out std",
                 "Respiratory Rate", "RR Max", 
                 "RR Min", "RR std", "Time Span")
  
  res = t(as.data.frame(res))
  row.names(res) = dataset_name
  
  return(res)
  
}

sample_name_list = c("m01", "m02", "m03", "m04", "m05", "m06", "m07", "m08", "m09",
                     "m10", "m11", "m12", "m13", "m14", "m15", "m16", "m17", "m18")

result = data.frame()
for(sample_name in sample_name_list){
  
  df = eval(parse(text = paste0("
            rbind.data.frame(
            sum_up(",sample_name, "_Ventilation_Pre),
            sum_up(",sample_name,"_Ventilation_Post1),
            sum_up(",sample_name,"_Ventilation_Post2))
            "
  )
  ))
  
  result = rbind.data.frame(result, df)
  
}

kable(result)




