library(shiny) 
source('./plot_regression.R')

print_parameters <- function(training_percentage, wine_type, method) {
    paste('Parameters Choosed -', 
          'Training%:', training_percentage, 
          ', Wine Type:', wine_type,
          ', Method:', method,
          sep=' ')
}

plot_prediction <- function(training_percentage, wine_type, method) {
    plot_regression(training_percentage, as.integer(wine_type), method)
}

shinyServer(
    function(input, output) {
        output$parameters <- renderPrint(
            {print_parameters(
                input$training_percentage,
                input$wine_type,
                input$method
            )})
        
        output$prediction_plot <- renderPlot(
            plot_prediction(input$training_percentage,
                            input$wine_type,
                            input$method)
            )
    } )