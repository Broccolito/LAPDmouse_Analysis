library(ggplot2)

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

fractal_analysis_plot = function(fname){
  acini_depo = read.csv(fname)
  sample_name = unlist(strsplit(fname, "/"))[3]
  
  x = acini_depo$centroidX
  y = acini_depo$centroidY
  z = acini_depo$centroidZ
  p = acini_depo$volume * acini_depo$mean
  
  xbord = range(x)
  ybord = range(y)
  zbord = range(z)
  
  cv_list = vector()
  for(d in 1:5){
    divide_to = d
    x_by = (max(x) - min(x))/divide_to
    xm = seq(min(x), max(x), x_by)
    y_by = (max(y) - min(y))/divide_to
    ym = seq(min(y), max(y), y_by)
    z_by = (max(z) - min(z))/divide_to
    zm = seq(min(z), max(z), z_by)
    
    for(i in 1:divide_to){
      for(j in 1:divide_to){
        for(k in 1:divide_to){
          xl = xm[i]
          xu = xm[i+1]
          yl = ym[j]
          yu = ym[j+1]
          zl = zm[k]
          zu = zm[k+1]
          dep = p[intersect(intersect(which(x > xl & x < xu),
                                      which(y > yl & y < yu)),
                            which(z > zl & z < zu))]
          mdep = sum(dep)
          cv = sd(dep)/mdep
          csize = (xu - xl) * (yu - yl) * (zu - zl)
          cv_list = rbind(cv_list, c(csize, mdep, cv, d))
        }
      }
    }
  }
  
  cv_list = na.omit(cv_list)
  
  cv_list = as.data.frame(cv_list)
  colnames(cv_list) = c("csize", "mdep", "cv", "by")
  cv_list$lg_mdep = log(cv_list$mdep)
  cv_list$lg_cv = log(cv_list$cv)
  cv_list$lg_size = log(cv_list$csize)
  
  n = dim(cv_list)[1]
  l = summary(lm(data = cv_list, lg_cv ~ lg_mdep))
  slope = l$coefficients[2,1]
  rsq = l$r.squared
  
  N = as.factor(cv_list$by)
  ggplot(data = cv_list, aes(x = lg_mdep, y = lg_cv, color = N)) +
    geom_point(size = 3) + geom_smooth(method = "lm", color = "black") +
    theme_classic() +
    theme(text = element_text(size = 20)) +
    xlab("Log Mean Particle Deposition") +
    ylab("Log Coefficient of variation") +
    ggtitle(label = sample_name, subtitle = paste0(
      "Sample size = ", n,
      "; Slope = ", round(slope,3),
      "; R-square = ", round(rsq,3)
    ))
  ggsave(filename = paste0(sample_name, ".png"), device = "png", dpi = 1200,
         width = 8, height = 8)
  return(data.frame(
    id = sample_name,
    n = n,
    slope = slope,
    rsq = rsq
  ))
}

# Test
# fractal_analysis_plot("m01_NearAciniDeposition.csv")

acini_dep_files = paste0("../CSV_Data/", 
                         list.files(path = "../CSV_Data/",
                                    all.files = TRUE,
                                    pattern = "NearAciniDeposition",
                                    recursive = TRUE))

cat("\n")
fractal_mat = vector()
for(f in acini_dep_files){
  cat(paste0("Processing ", f, " ... \n"))
  fractal_mat = rbind(fractal_mat, fractal_analysis_plot(f))
}