library(EBImage)

m27 = readImage("m27_Lobes.tif")
m27_data = imageData(m27)

m27_data= m27_data * (1/max(m27_data))
m27_data = round(m27_data,1)
imageData(m27) = m27_data

# Downsample m27 to 1/2 of its original size
d1 = dim(m27_data)[1]
d2 = dim(m27_data)[2]
d3 = dim(m27_data)[3]
m27_data = m27_data[seq(1,d1,2),seq(1,d2,2),seq(1,d3,2)]
imageData(m27) = m27_data

# writeImage(m27, files = "m27_downsampled.tif")
