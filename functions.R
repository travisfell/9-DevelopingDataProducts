#functions.R
#This script is for developing and testing 
#used by server.R and ui.R.

library(ggplot2)
library(datasets)
data(mtcars)

#if(!exists("mpg", mode="function")) source("functions.R")

#mpg <- function(wt, trans){
  
  mpgmodel <- lm(mpg ~ am + wt, mtcars)
  trans <- 1 # 1 = manual, 0 = auto
  wt <- 3.5 # in tons
  trans <- as.numeric(trans)
  mpgpred <- predict(mpgmodel, data.frame(am = trans, wt = wt), interval = "prediction")
  mpgpred
#}
  
#create plot 
  gwt <- ggplot(mtcars, aes(wt, mpg), colour = am)
  gwt <- gwt + geom_point(aes(colour = am))
  gwt <- gwt + geom_smooth(method = 'lm')
  gwt <- gwt + ylab("MPG")
  gwt <- gwt + xlab("Weight")
  gwt <- gwt + ggtitle("MPG by Weight and Transmission Type")
  gwt