rm(list = ls())
graphics.off()

library(knitr)
library(readxl)
library(plotly)

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

filelist = paste0("Airway_with_Generation/m", seq(1,34), "_with_generations.csv")
filenames = paste0("m", seq(1,34), " Airway Radius Vs. Generations")

# Overall relationship
avg_mat = vector()
for(i in 1:length(filelist)){
  f = filelist[i]
  fn = filenames[i]
  d = read.csv(f)
  d = cbind.data.frame(d$radius, d$generations)
  d = na.omit(d)
  colnames(d) = c("radius", "generation")
  
  avg_list = vector()
  for(j in 1:max(d$generation)){
    avg_list = c(avg_list, mean(d$radius[d$generation == j]))
  }
  avg_list = c(avg_list, rep(NA, 50))
  avg_list = avg_list[1:35] # The max generation is 30
  avg_mat = rbind(avg_mat, avg_list)
}

# For CrRMB
avg_mat_CrRMB = vector()
for(i in 1:length(filelist)){
  f = filelist[i]
  fn = filenames[i]
  d = read.csv(f)
  d = subset(d, d$name == "CrRMB")
  d = cbind.data.frame(d$radius, d$generations)
  d = na.omit(d)
  colnames(d) = c("radius", "generation")
  
  avg_list = vector()
  for(j in 1:max(d$generation)){
    avg_list = c(avg_list, mean(d$radius[d$generation == j]))
  }
  avg_list = c(avg_list, rep(NA, 50))
  avg_list = avg_list[1:35] # The max generation is 30
  avg_mat_CrRMB = rbind(avg_mat_CrRMB, avg_list)
}

# For MiRMB
avg_mat_MiRMB = vector()
for(i in 1:length(filelist)){
  f = filelist[i]
  fn = filenames[i]
  d = read.csv(f)
  d = subset(d, d$name == "MiRMB")
  d = cbind.data.frame(d$radius, d$generations)
  d = na.omit(d)
  colnames(d) = c("radius", "generation")
  
  avg_list = vector()
  for(j in 1:max(d$generation)){
    avg_list = c(avg_list, mean(d$radius[d$generation == j]))
  }
  avg_list = c(avg_list, rep(NA, 50))
  avg_list = avg_list[1:35] # The max generation is 30
  avg_mat_MiRMB = rbind(avg_mat_MiRMB, avg_list)
}

# For AcRMB
avg_mat_AcRMB = vector()
for(i in 1:length(filelist)){
  f = filelist[i]
  fn = filenames[i]
  d = read.csv(f)
  d = subset(d, d$name == "AcRMB")
  d = cbind.data.frame(d$radius, d$generations)
  d = na.omit(d)
  colnames(d) = c("radius", "generation")
  
  avg_list = vector()
  for(j in 1:max(d$generation)){
    avg_list = c(avg_list, mean(d$radius[d$generation == j]))
  }
  avg_list = c(avg_list, rep(NA, 50))
  avg_list = avg_list[1:35] # The max generation is 30
  avg_mat_AcRMB = rbind(avg_mat_AcRMB, avg_list)
}

# For CaRMB
avg_mat_CaRMB = vector()
for(i in 1:length(filelist)){
  f = filelist[i]
  fn = filenames[i]
  d = read.csv(f)
  d = subset(d, d$name == "CaRMB")
  d = cbind.data.frame(d$radius, d$generations)
  d = na.omit(d)
  colnames(d) = c("radius", "generation")
  
  avg_list = vector()
  for(j in 1:max(d$generation)){
    avg_list = c(avg_list, mean(d$radius[d$generation == j]))
  }
  avg_list = c(avg_list, rep(NA, 50))
  avg_list = avg_list[1:35] # The max generation is 30
  avg_mat_CaRMB = rbind(avg_mat_CaRMB, avg_list)
}

# For LMB
avg_mat_LMB = vector()
for(i in 1:length(filelist)){
  f = filelist[i]
  fn = filenames[i]
  d = read.csv(f)
  d = subset(d, d$name == "LMB")
  d = cbind.data.frame(d$radius, d$generations)
  d = na.omit(d)
  colnames(d) = c("radius", "generation")
  
  avg_list = vector()
  for(j in 1:max(d$generation)){
    avg_list = c(avg_list, mean(d$radius[d$generation == j]))
  }
  avg_list = c(avg_list, rep(NA, 50))
  avg_list = avg_list[1:35] # The max generation is 30
  avg_mat_LMB = rbind(avg_mat_LMB, avg_list)
}


p = plot_ly(z = ~avg_mat) %>% add_surface(showscale=FALSE)

p_AcRMB = plot_ly(z = ~avg_mat_AcRMB) %>% add_surface(showscale=FALSE)
p_CrRMB = plot_ly(z = ~avg_mat_CrRMB) %>% add_surface(showscale=FALSE)
p_LMB = plot_ly(z = ~avg_mat_LMB) %>% add_surface(showscale=FALSE)
p_MiRMB = plot_ly(z = ~avg_mat_MiRMB) %>% add_surface(showscale=FALSE)
p_CaRMB = plot_ly(z = ~avg_mat_CaRMB) %>% add_surface(showscale=FALSE)

axx <- list(
  gridcolor='rgb(255, 255, 255)',
  zerolinecolor='rgb(255, 255, 255)',
  showbackground=TRUE,
  backgroundcolor='rgb(230, 230,230)'
)

overview = subplot(p, p_LMB, p_CrRMB, p_MiRMB, p_CaRMB, p_AcRMB) %>%
  layout(title = "3D Subplots",
         scene1 = list(domain=list(x=c(0,25),y=c(0,34)),
                      xaxis=axx, yaxis=axx, zaxis=axx,
                      aspectmode='cube'),
         scene2 = list(domain=list(x=c(0,25),y=c(0,34)),
                       xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'),
         scene3 = list(domain=list(x=c(0,25),y=c(0,34)),
                       xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'),
         scene4 = list(domain=list(x=c(0,25),y=c(0,34)),
                       xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'),
         scene5 = list(domain=list(x=c(0,25),y=c(0,34)),
                       xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'),
         scene6 = list(domain=list(x=c(0,25),y=c(0,34)),
                       xaxis=axx, yaxis=axx, zaxis=axx,
                       aspectmode='cube'))


# p_log = plot_ly(z = ~log(avg_mat/1.5, base = 10)) %>% add_surface()


fit_formula = function(radius, generation_from, generation_to){
  
  # graphics.off()
  
  # radius = avg_mat[4,]
  generation = 1:dim(avg_mat)[2]
  
  rg_data = na.omit(cbind.data.frame(generation = generation, radius = radius))
  rg_data = rg_data[generation_from : generation_to,]
  rm(radius, generation)
  
  radius = rg_data$radius
  generation = rg_data$generation
  
  g_list = vector()
  power_range = seq(1, 2, 0.001)
  for(i in power_range){
    l = glm(radius ~ I( radius[1] * 2^(-generation/i)    )        )
    goodness = 1 - sum(abs(l$residuals)^2)/dim(rg_data)[1]
    g_list = c(g_list, goodness)
  }
  # windows()
  # plot(power_range, g_list)
  fitted_power = power_range[which.max(g_list)]
  
  l = glm(radius ~ I( radius[1] * 2^(-generation/fitted_power)    )        )
  # windows()
  # plot(radius ~ generation)
  # points(generation, l$fitted.values, pch = 16, col = "red")
  # fitted_power
  # l$coefficients
  goodness = 1 - sum(abs(l$residuals)^2)/dim(rg_data)[1]
  # goodness
  
  res = c(goodness, fitted_power, l$coefficients[1], l$coefficients[2])
  names(res) = c("Goodness", "denominator", "Intercept", "exp_coef")
  return(res)
  
}

fitted_coef_list = vector()
for(j in 1:dim(avg_mat)[1]){
  fitted_coef = fit_formula(avg_mat[j,], 3, 15)
  fitted_coef_list = rbind.data.frame(fitted_coef_list, fitted_coef)
  cat("\n --Processed--\n")
}
colnames(fitted_coef_list) = c("Goodness", "denominator", "Intercept", "exp_coef")

# No outliers are spotted
# Goodness of fit is always above 99.9%
windows(width = 900, height = 300)
par(mfrow = c(1,3))
hist(fitted_coef_list$denominator)
hist(fitted_coef_list$Intercept)
hist(fitted_coef_list$exp_coef)

model_info = data.frame(denominator = mean(fitted_coef_list$denominator),
                        intercept = mean(fitted_coef_list$Intercept),
                        exp_coef = mean(fitted_coef_list$exp_coef))
kable(model_info)

# Sicne not much accuracy is needed, all coefs are rounded to 1 digit

# The proposed model is : Rz = 3.5 * Ro * 2^(-Z/1.5) + 0.1

use_formula = function(z, Ro){
  return(model_info$exp_coef * Ro * 2^(-z/model_info$denominator) + model_info$intercept)
}

# Check the goodness of fit of the model
gfit_list = vector()
for(i in 1:dim(avg_mat)[1]){
  gfit_list = c(gfit_list, 1 - sum((sapply(3:12, use_formula, avg_mat[i,3])[1:10] -
                                      avg_mat[i,3:dim(avg_mat)[2]][1:10])^2) / 10)
}
windows()
barplot(gfit_list, ylim = c(0.998,1), main = "Goodness of fit of the model")
