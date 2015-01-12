# Load Libraries
library(caret)
library(kernlab)
library(elasticnet)
library(kknn)
library(rpart)

# Load and Process Data Sample
URL <- 'http://www3.dsi.uminho.pt/pcortez/wine/winequality.zip'

preprocess_data <- function(filename) {
    
    temp <- tempfile()
    download.file(url=URL, temp, mode="wb")
    unzip(temp, filename)
    
    df <- read.csv2(file=filename, header=TRUE, stringsAsFactors = FALSE)
    for(i in names(df)) {
        df[,i] <- as.numeric(df[,i])
        if(i != 'quality') {
            df[,i] <- (df[,i] - mean(df[,i]))/sd(df[,i])
        }
    }
    df
}

df_white <- preprocess_data('winequality/winequality-white.csv')
df_red <- preprocess_data('winequality/winequality-red.csv')

# Plot Function
plot_regression <- function(training_percentage, wine_type, method) {
    # Parameter selection
    df = df_white
    color = 'BLUE'
    if(wine_type == 1) {
        df = df_red
        color = 'RED'
    }
    
    # Data slicing
    inTrain <- createDataPartition(y=df$quality, 
                                   p=training_percentage/100.0, list=FALSE)
    training <- df[inTrain,]
    test <- df[-inTrain,]

    # Model fit
    mod_fit <- train(quality ~ ., data=training, method=method)
    
    # Prediction
    prediction <- predict(mod_fit, test)
    
    # Plot
    qplot(quality, prediction, colour=quality, data=test, alpha = 0.1, geom = c("point", "smooth"), span=1) +
        scale_colour_gradient(limits=c(1, 10), low=color, high='WHITE')
}
