#Author: Tj Tyson, Date: Sep 9, 2025; Purpose: Test similar linear regression

# Get some dummy dataset
cars <- mtcars

# Scatter plot on training data
scatter.smooth(x=cars$mpg, y =cars$disp, main = "SpeedVSdistance")

#Calculate correlation value between mpg and disp
cor(cars$mpg, cars$disp)

# - dim() tells you the columns and rows the data has

# Split training and testing data for regression
training_data <- cars[1:16,] 
# - comma at end selects rows comma at beginning selects rows
test_data <- cars[17:32,]

# Build a regression model
regression_result <- lm(mpg ~ gear, data=training_data)
# lm means linear model

# Predict regression function on test data
prediction_result <- predict(regression_result, test_data)

#Results of prediction
actual_prediction_values <- data.frame(cbind(actuals=training_data$gear, predicteds=prediction_result))

                  actuals predicteds
Chrysler Imperial       4   15.80000
Fiat 128                4   21.28571
Honda Civic             4   21.28571
Toyota Corolla          3   21.28571
Toyota Corona           3   15.80000
Dodge Challenger        3   15.80000
AMC Javelin             3   15.80000
Camaro Z28              4   15.80000
Pontiac Firebird        4   15.80000
Fiat X1-9               4   21.28571
Porsche 914-2           4   26.77143
Lotus Europa            3   26.77143
Ford Pantera L          3   26.77143
Ferrari Dino            3   26.77143
Maserati Bora           3   26.77143
Volvo 142E              3   21.28571

