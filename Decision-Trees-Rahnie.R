# Author: Rahnie Riggins; Date:09/23/2025 Purpose: Test decision trees in R
install.packages("rpart")

library(rpart)

#Load some dummy dataset

kyphosis <-kyphosis

#Create a decision tree
fit<- rpart(Kyphosis ~ Age + Number + Start,method="class",data=kyphosis)

# Plot the results
plot(fit, main="Classification plot for Kyphosis", uniform=TRUE); text(fit,use.n=TRUE,all=TRUE,cex=.8)