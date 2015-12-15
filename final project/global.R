#global.R
#This script is for storing functions
#used by server.R and ui.R.

library(datasets)
data(mtcars)

mpg <- function(wt, trans){
 mpgmodel <- lm(mpg ~ am + wt, mtcars)
  trans <- as.numeric(trans)
  mpgpred <- predict(mpgmodel, data.frame(am = trans, wt = wt), interval = "prediction")
  mpgpred
}