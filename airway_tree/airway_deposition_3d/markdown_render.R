library(rmarkdown)

list_length = length(list.files(pattern = "Rmd"))
filelist = list.files(pattern = "Rmd")

for(i in 1:list_length){
  
  render(input = filelist[i], output_format = "html_document")
  
  try({
    rgl.close()
  }, silent = TRUE)
  
  cat("\n")
  cat(paste0("Finished rendering ", filelist[i]))
  cat("\n")
  
}