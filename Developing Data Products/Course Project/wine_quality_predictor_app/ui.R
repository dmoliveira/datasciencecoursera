library(shiny) 
shinyUI(pageWithSidebar(
    headerPanel("Wine Quality Predictor App"), 
    sidebarPanel(
        h5('We want to predict the quality of white and red wine.'),
        h6('Inputs (11):
            Fixed acidity,
            volatile acidity,
            citric acid,
            residual sugar,
            chlorides,
            free sulfur dioxide,
            total sulfur dioxide,
            density,
            pH,
            sulphates,
            alcohol.'),
        h6('Output (1):
            Quality (score between 0 and 10)'),
        h5(' '),
        h5('Parameters'),
        numericInput(inputId = 'training_percentage',
                     'Training [80-99]%:', 
                     80, min = 80, max = 99, step = 1),
        radioButtons('wine_type', 
                     'Wine Type:',
                     c('White' = 0, 'Red' = 1),
                     0),
        selectInput('method', 
                    'Method:', 
                    c('Linear' = 'lm', 'Lasso' = 'lasso', 'CART' = 'rpart', 'KNN' = 'kknn'),
                    0),
        submitButton('Predict!')
    ),
    mainPanel(
        h3('Prediction Results'),
        verbatimTextOutput('parameters'),
        plotOutput('prediction_plot'),
        h6('* Please note that changing the parameters bring subtle changes in the graph. Vary the parameters at will.')
    ) ))