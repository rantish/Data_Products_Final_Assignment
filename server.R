library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected
# dataset
function(input, output) {
  
  # Declaring datasetInput as a reactive expression
  
  datasetInput <- reactive({
           switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = mtcars,
           "CO2"=CO2,
           "ChickWeight"=ChickWeight)
  })
  
  output$columns = renderText({
    dataset <- nrow(datasetInput())
  })
  
  # The output$caption is computed based on a reactive expression
  # that returns input$caption. When the user changes the
  # "caption" field:

  output$caption <- renderText({
    input$caption
  })
  
  # The output$summary depends on the datasetInput reactive
  # expression
  
  output$summary <- renderPrint({
    dataset <- head(datasetInput(), n = input$SampleSize)
    summary(dataset)
  })
  
  # The output$view depends on both the databaseInput reactive
  # expression and input$obs, so will be re-executed whenever
  # input$dataset or input$obs is changed. 
  output$view <- renderTable({
    head(datasetInput(), n = input$SampleSize)
  })
}