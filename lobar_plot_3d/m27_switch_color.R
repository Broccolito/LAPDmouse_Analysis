library(EBImage)

m27 = readImage("m27_downsampled.tif")
m27_data = imageData(m27)

m27_data[m27_data==0.6] = 0.7
m27_data[m27_data==0.4] = 0.6
m27_data[m27_data==0.7] = 0.4
# m27_data[m27_data==0.2] = 0.15

imageData(m27) = m27_data
writeImage(m27,files = "m27_color_switched.tif")
