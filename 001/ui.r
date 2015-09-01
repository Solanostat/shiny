library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Shiny Iris"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("sepal_length", "sepal_width", "petal_width")),
      
      numericInput("obs", "Number of observations to view:", 10),

      sliderInput("bins", "Number of bins:",
                  min = 1,max = 50, value = 30)
    ),

   # Show a summary of the dataset and an HTML table with the 
   # requested number of observations
    mainPanel(
      verbatimTextOutput("summary"), 
      tableOutput("view"),
      plotOutput("distPlot")
    )
  )
))
