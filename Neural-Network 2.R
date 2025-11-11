#Author: Rahnie Riggins; Date: 11/06/2025; Purpose: Implement Neural Networks

#Load Library Caret
library(caret)

#Load sample dataset
dataset<- iris

#80% split for training data and 20% split for validation data

validation_index <- 
createDataPartition(dataset$Species, p=0.80, list=FALSE)

validation <- dataset[validation_index,]
dataset <- dataset[validation_index,]

control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# Train the model using LDA/Linear Determination Analysis
set.seed(7)
fit.lda <- train(Species~., data=dataset, method= "lda", metric=metric,
                 trControl=control)
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric,
                trControl= control)
#Summarizing the accuracy of LDA models
results <- resamples(list(lda=fit.lda, rf=fit.rf))
summary(results)

#Based upon accuracy values we choose lda model to do our predictions on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)

Confusion Matrix and Statistics

Reference
Prediction   setosa versicolor virginica
setosa         40          0         0
versicolor      0         38         1
virginica       0          2        39

Overall Statistics

Accuracy : 0.975           
95% CI : (0.9287, 0.9948)
No Information Rate : 0.3333          
P-Value [Acc > NIR] : < 2.2e-16       

Kappa : 0.9625          

Mcnemar's Test P-Value : NA              

Statistics by Class:

                     Class: setosa Class: versicolor
Sensitivity                 1.0000            0.9500
Specificity                 1.0000            0.9875
Pos Pred Value              1.0000            0.9744
Neg Pred Value              1.0000            0.9753
Prevalence                  0.3333            0.3333
Detection Rate              0.3333            0.3167
Detection Prevalence        0.3333            0.3250
Balanced Accuracy           1.0000            0.9688
                     Class: virginica
Sensitivity                    0.9750
Specificity                    0.9750
Pos Pred Value                 0.9512
Neg Pred Value                 0.9873
Prevalence                     0.3333
Detection Rate                 0.3250
Detection Prevalence           0.3417
Balanced Accuracy              0.9750
