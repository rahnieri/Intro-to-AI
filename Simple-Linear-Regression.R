#Author: Tj Tyson, Date: Aug 28, 2025; Purpose: Test similar linear regression

# Get some dummy dataset
cars <- mtcars

# Scatter plot on training data
scatter.smooth(x=cars$mpg, y =cars$disp, main = "SpeedVSdistance")
