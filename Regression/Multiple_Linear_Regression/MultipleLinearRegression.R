# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

#Encoding the Categorical variable
dataset$State = factor(dataset$State,levels = levels(factor(dataset$State)), labels = c(1,2,3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting Multiple Linear Regression with Training set
regressor = lm(formula = Profit~.,data = training_set)

#Predicting the test results
test_pred = predict(regressor,newdata = test_set)

#Building the optimal model using Backward Elimination
regressor = lm(formula = Profit~R.D.Spend+Administration+Marketing.Spend+State,data = dataset)
summary(regressor)

regressor = lm(formula = Profit~R.D.Spend+Administration+Marketing.Spend,data = dataset)
summary(regressor)

regressor = lm(formula = Profit~R.D.Spend,data = dataset)
summary(regressor)

regressor = lm(formula = Profit~R.D.Spend,data = dataset)
summary(regressor)