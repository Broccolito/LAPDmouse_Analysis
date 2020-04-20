library(magick)

filelist = list.files(pattern = "png")

for(filepath in filelist){
  img = image_read(path = filepath)
  img = image_annotate(img, unlist(strsplit(filepath, "[.]"))[1], size = 30, location = "+60+60")
  image_write(img, paste0("annotated_", filepath))
}



