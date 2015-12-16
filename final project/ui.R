#ui.R
# This is the UI definition script for the 
# Developing Data Products final project

library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predicting MPG"),
    sidebarPanel(
      h3('Enter your parameters'),
      h6("This app creates a predictive model for MPG by weight and transmission type based on the mtcars data set."),
      h6("To find predicted MPG using this model, enter the weight in tons and transmission type below. Then click Submit."),
      numericInput('weight', 'Weight in tons', 2.5, min = 1.5, max = 5.5, step = .25),
      radioButtons('trans', 'Select Transmission Type', 
        c("Automatic" = 0,
          "Manual" = 1)),
      submitButton('Submit')
    ),
    mainPanel(
        h3('Your MPG Prediction'),
        verbatimTextOutput("prediction"),
        h6("Given your selected weight and transmission type, the results above show the fitted value and the upper and lower bounds given a 95% confidence interval.")
    )
))