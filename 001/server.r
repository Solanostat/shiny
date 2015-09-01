library(shiny)
#library(datasets)
iris = read.table("/Users/Kevin/Downloads/shiny/iris.txt", sep=",") 
names(iris)<- c("sepal_length", "sepal_width", "petal_length", "petal_width","class")
sepal_length = iris[,1]
sepal_width = iris[,2]
petal_width = iris[,4]

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "sepal_length" = data.frame(sepal_length),
           "sepal_width"  = data.frame(sepal_width),
           "petal_width"  = data.frame(petal_width) )
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
    output$distPlot <- renderPlot({
    x <- as.matrix( datasetInput()) # iris data
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
 
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white', main="Histogram of selected column")
  })
})
