Predicting MPG
========================================================
author: Travis Fell
date: December 18, 2018

Introduction: Why Predict MPG and How To Do It
========================================================
<small>Automobile engineers could use the MPGPred application (available here: https://tfell2001.shinyapps.io/MPGPred) to estimate a car's miles per gallon (MPG) given two factors that have a big impact on MPG: weight and transmission type. 

The app predicts MPG by 

1. Prompting the user for weight in tons and transmission type
2. Training a predictive model on the mtcars dataset. 
3. Using the model to predict MPG from the user entered parameters with a 95% confidence interval

The following slides illustrate how the input, model training and output code works. 
</small>
Receiving Input
========================================================
<small>The the user interface provides documentation, controls and output display fields. 
<small>

```r
library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predicting MPG"),
    sidebarPanel(
      h3('Enter your parameters'),
      h6("This app creates a predictive model for MPG by weight and transmission type based on the mtcars data set."),
      h6("To find predicted MPG using this model, enter the weight in tons and transmission type below. Then click Submit."),
      numericInput('weight', 'Weight in tons', 2.5, min = 1.5, max = 5.5, step = .25), radioButtons('trans', 'Select Transmission Type', c("Automatic" = 0, "Manual" = 1)),
      submitButton('Submit')
    ),
    mainPanel(
        h3('Your MPG Prediction'),
        verbatimTextOutput("prediction"),
        h6("Given your selected weight and transmission type, the results above show the fitted value and the upper and lower bounds given a 95% confidence interval.")
    )
))
```
</small>
</small>

Training the Model
========================================================
<small>The code below calls the mtcars dataset and creates a linear model using weight and transmission type. 

```r
library(datasets)
data(mtcars)
mpg <- function(wt, trans){
 mpgmodel <- lm(mpg ~ am + wt, mtcars)
  trans <- as.numeric(trans)
  mpgpred <- predict(mpgmodel, data.frame(am = trans, wt = wt), interval = "prediction")
  mpgpred
}
```
</small>
Presenting the Output
========================================================
<small>The code below captures the input variables, feeds them to the mpg function created above and posts the results back to the UI.


```r
library(shiny)
shinyServer(
    function(input,output) {
      output$prediction <- renderPrint({mpg(input$weight, input$trans)})
    }
  )
```
