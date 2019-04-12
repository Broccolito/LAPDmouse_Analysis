library(plotly)
library(knitr)
library(rstudioapi)

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

#Set Up Plotly API Key
Sys.setenv("plotly_api_key"="thisisforplotly001")
Sys.setenv("plotly_api_key"="6H7VkPC6LQOBeyVdWKNn")

#Read the data
airway_data = read.csv(file = "m01_AirwayTreeTable.csv")

#Display the head of the data nicely
kable(head(airway_data,10))

startX = airway_data$centroidX + 0.5 * airway_data$length * airway_data$directionX
endX = airway_data$centroidX - 0.5 * airway_data$length * airway_data$directionX

startY = airway_data$centroidY + 0.5 * airway_data$length * airway_data$directionY
endY = airway_data$centroidY - 0.5 * airway_data$length * airway_data$directionY

startZ = airway_data$centroidZ + 0.5 * airway_data$length * airway_data$directionZ
endZ = airway_data$centroidZ - 0.5 * airway_data$length * airway_data$directionZ

airway_data_3d = cbind(airway_data, startX, endX, startY, endY, startZ, endZ)
rm(startX, startY,startZ, endX, endY, endZ)

#Drop certain columns that are not needed anymore
drops = c("centroidX", "centroidY", "centroidZ", "directionX", "directionY", "directionZ")
airway_data_3d = airway_data_3d[ ,!(names(airway_data_3d) %in% drops)]

kable(head(airway_data_3d, 10))
# 
# #Plot the airways using dots
# #The size is relevant to the radius of the airway
# p = plot_ly(data = airway_data, x = airway_data$centroidX,
#             y = airway_data$centroidY,
#             z = airway_data$centroidZ,
#             type = "scatter3d",
#             mode = "markers",
#             size = airway_data$radius * 5)
# p

airway = airway_data_3d[1,]
p = plot_ly(data = airway,
            x = c(airway$startX, airway$endX),
            y = c(airway$startY, airway$endY),
            z = c(airway$startZ, airway$endZ),
            type = "scatter3d",
            mode = "lines",
            line = list(color = "blue", width = 1)

)

#Pipelining new traces into
for(i in 2:dim(airway_data_3d)[1]){

  airway = airway_data_3d[i,]
  p = add_trace(p, data = airway,
                x = c(airway$startX, airway$endX),
                y = c(airway$startY, airway$endY),
                z = c(airway$startZ, airway$endZ),

                line = list(color = 'blue', width = 1)

  )

  cat(paste0("Plotting trace: ", i, "\n"))

}

#Hide the legend to make graphing faster
p = layout(p, showlegend = FALSE)

p



