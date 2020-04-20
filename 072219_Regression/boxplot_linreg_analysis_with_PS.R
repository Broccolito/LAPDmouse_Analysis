rm(list = ls())
graphics.off()

library(ggplot2)
library(knitr)
library(readxl)
library(glue)
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

flatten_data_frame = function(df){
  for(i in 1:length(names(df))){
    assign(names(df)[i], df[,i], envir = .GlobalEnv)
  }
}

plt <- function(fm, notation = "Some notations here", save = FALSE, display = TRUE, 
                default_title = TRUE, costomize_title = "Plot Title"){
  
  if(!default_title){
    plot_title = costomize_title
  }else{
    plot_title = glue_collapse(as.character(fm)[c(2,1,3)], sep = " ")
  }
  
  fit = lm(fm)
  p = ggplot(fit$model, aes(x = fit$model[,2], y = fit$model[,1])) + 
    geom_point(size = 4, show.legend = TRUE,
               aes(x = fit$model[,2], y = fit$model[,1])) +
    stat_smooth(method = "lm", col = "black") +
    labs(subtitle = paste(
      " Intercept =",signif(fit$coef[[1]],5 ), " ",
      " Slope =",signif(fit$coef[[2]], 5), " ",
      " Pr =", round(signif(summary(fit)$coef[2,4], 4), 5),
      " Rsq = ",signif(summary(fit)$adj.r.squared, 2), "\n",
      notation),
      title = plot_title) + 
    theme_minimal() + 
    xlab(as.character(fm)[3]) +
    ylab(as.character(fm)[2])
  if(save){
    ggsave(filename = paste0(plot_title, ".png"),
           plot = p, width = 8, height = 6)
  }
  if(display){
    p
  }
}

bp = function(data, factor_x, vector_y, save = FALSE, default_title = TRUE, costomize_title = "Plot_title"){
  
  if(!default_title){
    plot_title = costomize_title
  }else{
    plot_title = paste0(deparse(substitute(vector_y)), " across ", deparse(substitute(factor_x)), ".png")
  }
  
  ggplot(data, aes(x = as.factor(factor_x), y = vector_y), outlier.colour = "red") + 
    labs(title = plot_title) + 
    ylab(deparse(substitute(vector_y))) + 
    xlab(deparse(substitute(factor_x))) + 
    geom_boxplot()
  if(save){
    ggsave(filename = paste0(plot_title, ".png"), device = "png")
  }
}

wd = get_directory()
setwd(wd)

d = as.data.frame(read_excel(path = list.files(pattern = "_sample_summary")))

# Select d only when PS == 2
d = d[d$PS == 0.5,]

# Get rid of the data point with quality "C"
d = d[d$Q != "C", ]
d_NNULL_pre = d[-which(d$RR_Pre == "NULL"),]
d_NNULL_pre$RR_Pre = as.numeric(d_NNULL_pre$RR_Pre)

d_NNULL_Wt = d[-which(d$Wt. == "NULL"),]
d_NNULL_Wt$Wt. = as.numeric(d_NNULL_Wt$Wt.)

flatten_data_frame(d)

bp(data = d_NNULL_pre, d_NNULL_pre$Strain, d_NNULL_pre$RR_Pre, save = TRUE, 
   default_title = FALSE, costomize_title = "RR_Pre Across Strain")
bp(data = d_NNULL_pre, d_NNULL_pre$Sex, d_NNULL_pre$RR_Pre, save = TRUE,
   default_title = FALSE, costomize_title = "RR_Pre Across Sex")

bp(data = d, PS, pvleft, save = TRUE)
bp(data = d, PS, pvcranial, save = TRUE)
bp(data = d, PS, pvmiddle, save = TRUE)
bp(data = d, PS, pvcaudal, save = TRUE)
bp(data = d, PS, pvaccessory, save = TRUE)

bp(data = d, Q, pvleft, save = TRUE)
bp(data = d, Q, pvcranial, save = TRUE)
bp(data = d, Q, pvmiddle, save = TRUE)
bp(data = d, Q, pvcaudal, save = TRUE)
bp(data = d, Q, pvaccessory, save = TRUE)

bp(data = d, Strain, pvleft, save = TRUE)
bp(data = d, Strain, pvcranial, save = TRUE)
bp(data = d, Strain, pvmiddle, save = TRUE)
bp(data = d, Strain, pvcaudal, save = TRUE)
bp(data = d, Strain, pvaccessory, save = TRUE)

bp(data = d, Strain, RR_P1, save = TRUE)
bp(data = d, Strain, RR_P2, save = TRUE)

bp(data = d, Strain, LV, save = TRUE)

bp(data = d, Strain, ET, save = TRUE)

bp(data = d, Strain, AS, save = TRUE)

bp(data = d, Strain, AO, save = TRUE)

bp(data = d, Sex, pvleft, save = TRUE)
bp(data = d, Sex, pvcranial, save = TRUE)
bp(data = d, Sex, pvmiddle, save = TRUE)
bp(data = d, Sex, pvcaudal, save = TRUE)
bp(data = d, Sex, pvaccessory, save = TRUE)

bp(data = d, Sex, LV, save = TRUE)

bp(data = d, Sex, ET, save = TRUE)

bp(data = d, Sex, AS, save = TRUE)

bp(data = d, Sex, AO, save = TRUE)


bp(data = d, Sex, RR_P1, save = TRUE)
bp(data = d, Sex, RR_P2, save = TRUE)

plt(pvcaudal ~ RR_P1, save = TRUE)
plt(pvcaudal ~ RR_P2, save = TRUE)
plt(d_NNULL_pre$pvcaudal ~ d_NNULL_pre$RR_Pre, save = TRUE, default_title = FALSE, costomize_title = "pvcaudal ~ RR_Pre")
plt(pvcaudal ~ PS, save = TRUE)
plt(pvcaudal ~ tr_angle, save = TRUE)
plt(pvcaudal ~ tr_rad_diff, save = TRUE)
plt(pvcaudal ~ lr_angle, save = TRUE)
plt(pvcaudal ~ lr_rad_diff, save = TRUE)
plt(pvcaudal ~ Crr_angle, save = TRUE)
plt(pvcaudal ~ Crr_rad_diff, save = TRUE)
plt(pvcaudal ~ RCr_angle, save = TRUE)
plt(pvcaudal ~ RCr_rad_diff, save = TRUE)

plt(pvcranial ~ RR_P1, save = TRUE)
plt(pvcranial ~ RR_P2, save = TRUE)
plt(d_NNULL_pre$pvcranial ~ d_NNULL_pre$RR_Pre, save = TRUE, default_title = FALSE, costomize_title = "pvcranial ~ RR_Pre")
plt(pvcranial ~ PS, save = TRUE)
plt(pvcranial ~ tr_angle, save = TRUE)
plt(pvcranial ~ tr_rad_diff, save = TRUE)
plt(pvcranial ~ lr_angle, save = TRUE)
plt(pvcranial ~ lr_rad_diff, save = TRUE)
plt(pvcranial ~ Crr_angle, save = TRUE)
plt(pvcranial ~ Crr_rad_diff, save = TRUE)
plt(pvcranial ~ RCr_angle, save = TRUE)
plt(pvcranial ~ RCr_rad_diff, save = TRUE)

plt(pvleft ~ RR_P1, save = TRUE)
plt(pvleft ~ RR_P2, save = TRUE)
plt(d_NNULL_pre$pvleft ~ d_NNULL_pre$RR_Pre, save = TRUE, default_title = FALSE, costomize_title = "pvleft ~ RR_Pre")
plt(pvleft ~ PS, save = TRUE)
plt(pvleft ~ tr_angle, save = TRUE)
plt(pvleft ~ tr_rad_diff, save = TRUE)
plt(pvleft ~ lr_angle, save = TRUE)
plt(pvleft ~ lr_rad_diff, save = TRUE)
plt(pvleft ~ Crr_angle, save = TRUE)
plt(pvleft ~ Crr_rad_diff, save = TRUE)
plt(pvleft ~ RCr_angle, save = TRUE)
plt(pvleft ~ RCr_rad_diff, save = TRUE)

plt(pvmiddle ~ RR_P1, save = TRUE)
plt(pvmiddle ~ RR_P2, save = TRUE)
plt(d_NNULL_pre$pvmiddle ~ d_NNULL_pre$RR_Pre, save = TRUE, default_title = FALSE, costomize_title = "pvmiddle ~ RR_Pre")
plt(pvmiddle ~ PS, save = TRUE)
plt(pvmiddle ~ tr_angle, save = TRUE)
plt(pvmiddle ~ tr_rad_diff, save = TRUE)
plt(pvmiddle ~ lr_angle, save = TRUE)
plt(pvmiddle ~ lr_rad_diff, save = TRUE)
plt(pvmiddle ~ Crr_angle, save = TRUE)
plt(pvmiddle ~ Crr_rad_diff, save = TRUE)
plt(pvmiddle ~ RCr_angle, save = TRUE)
plt(pvmiddle ~ RCr_rad_diff, save = TRUE)

plt(pvaccessory ~ RR_P1, save = TRUE)
plt(pvaccessory ~ RR_P2, save = TRUE)
plt(d_NNULL_pre$pvaccessory ~ d_NNULL_pre$RR_Pre, save = TRUE, default_title = FALSE, costomize_title = "pvaccessory ~ RR_Pre")
plt(pvaccessory ~ PS, save = TRUE)
plt(pvaccessory ~ tr_angle, save = TRUE)
plt(pvaccessory ~ tr_rad_diff, save = TRUE)
plt(pvaccessory ~ lr_angle, save = TRUE)
plt(pvaccessory ~ lr_rad_diff, save = TRUE)
plt(pvaccessory ~ Crr_angle, save = TRUE)
plt(pvaccessory ~ Crr_rad_diff, save = TRUE)
plt(pvaccessory ~ RCr_angle, save = TRUE)
plt(pvaccessory ~ RCr_rad_diff, save = TRUE)