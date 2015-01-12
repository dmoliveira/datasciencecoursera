# Wine Quality Predictor App
----------------------------

## Problem

Suppose that we want to make prediction about the wine quality. To do that we considered an database composed by 11 input
variables and 1 output. The dataset was used primary in the ''Paulo Cortez, University of Minho, Guimarães, Portugal, http://www3.dsi.uminho.pt/pcortez 
A. Cerdeira, F. Almeida, T. Matos and J. Reis, Viticulture Commission of the Vinho Verde Region(CVRVV), Porto, Portugal 
@2009''

### Input Variables
1. fixed acidity 
2. volatile acidity 
3. citric acid 
4. residual sugar 
5. chlorides 
6. free sulfur dioxide 
7. total sulfur dioxide 
8. density 
9. pH 
10. sulphates 
11. alcohol 

### Output
* Wine Quality

## Files

* UI.R: The UI interface in R for Wine Quality. In there is defined the layout, interactive components and chart.
* Server.R: The Server file contains the controller for the app, it will import the plot regression and call the methods to 
			make the regression and plot the final graph.
* Plot Regression: The plot regression file contains all the logic to do the preprocessing, data slicing, prediction ang
					graph generation.

## How to Run

1. Install R packages: shiny, caret, kernlab, elasticnet, kknn and rpart.
2. Change to App workspace
3. Execute the command: runApp()

## See Online Application 
Check-out the online app at http://dmztheone.shinyapps.io/wine_quality_predictor_app

## See Online Presentation
Check-out the online presentation at http://rpubs.com/dmztheone/wine_quality_predictor