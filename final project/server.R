# server.r
# This is the server definition script for the 
# Developing Data Products final project

library(shiny)
shinyServer(
    function(input,output) {
      output$prediction <- renderPrint({mpg(input$weight, input$trans)})
    }
  )