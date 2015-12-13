#ui.R
# This is the UI definition script for the 
# Developing Data Products final project

library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predicting MPG"),
    sidebarPanel(
      h3('Enter your parameters'),
      h6("To find predicted MPG, enter the weight in tons and transmission type below. Then click Submit."),
      numericInput('weight', 'Weight in tons', 2.5, min = 1.5, max = 5.5, step = .5),
      radioButtons('trans', 'Select Transmission Type', 
        c("Automatic" = "auto",
          "Manual" = "man")),
      submitButton('Submit')
    ),
    mainPanel(
        h3('Your MPG Prediction'),
        verbatimTextOutput("prediction")
    )
))