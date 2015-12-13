# server.r
# This is the server definition script for the 
# Developing Data Products final project

library(shiny)
library(datasets)
data(mtcars)

mpg <- function(wt, trans){
  mpgmodel <- lm(mpg ~ am + wt, mtcars)
  ifelse(trans == 'auto', trans <- 0, trans <- 1)
  mpgpred <- predict(mpgmodel, data.frame(am = trans, wt = wt), interval = "prediction")
  mpgpred
}

shinyServer(
    function(input,output) {
      output$prediction <- renderPrint({mpg(input$weight, input$trans)})
    }
  )