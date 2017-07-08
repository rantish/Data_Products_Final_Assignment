library(shiny)

# Define UI for dataset viewer application
fluidPage(
  
  # Application title
  titlePanel("My Course Era Data Products Assignment"),
  
  # Sidebar with controls to provide a caption, select a dataset,
  # and specify the number of observations using a slider.
  
  sidebarLayout(
    
    sidebarPanel(
      textInput("caption", "Caption:", "Data Summary"),
      
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("rock", "pressure", "cars","ChickWeight","CO2")),
      
      sliderInput("SampleSize","Sample Size(Limited to a max of 100 obs)", min=10,max=100,value = 0),
      p('The Maximum number of rows in the selected dataset are :'),
      textOutput("columns",container = span)
    ),
    
    # Show the caption, a summary of the dataset and an HTML 
    # table with the requested number of observations
    mainPanel(
      h3(textOutput("caption", container = span)),
      verbatimTextOutput("summary"), 
      
      tableOutput("view")
    )
  )
)