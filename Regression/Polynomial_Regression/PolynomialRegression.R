# Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[,2:3]
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting Linear Regression to the Dataset
lin_reg = lm(formula = Salary ~ .,data = dataset)
summary(lin_reg)

#Fitting Polynomial Regression to the Dataset
dataset$Level2 = dataset$Level ^ 2
dataset$Level3 = dataset$Level ^ 3
dataset$Level4 = dataset$Level ^ 4
pol_reg = lm(formula = Salary ~ .,data = dataset)
summary(pol_reg)

#Visualizing the Linear Regression Results
ggplot() +
  geom_point(aes(dataset$Level,dataset$Salary),colour = 'Red') +
  geom_line(aes(dataset$Level,predict(lin_reg,newdata = dataset)),colour = 'blue') +
  ggtitle('Truth vs Lies(LinReg)') +
  xlab('Level') +
  ylab('Salary')

#Visualizing the Polynomial Regression Results
ggplot() +
  geom_point(aes(dataset$Level,dataset$Salary),colour = 'Red') +
  geom_line(aes(dataset$Level,predict(pol_reg,newdata = dataset)),colour = 'blue') +
  ggtitle('Truth vs Lies(PolReg)') +
  xlab('Level') +
  ylab('Salary')

#Predicting the new results from Linear Regression
y_pred = predict(lin_reg,newdata = data.frame(Level = 6.5))

#Predicting the new results from Polynomial Regression
y_pred = predict(pol_reg,newdata = data.frame(Level = 6.5,Level2 = 6.5^2,Level3 = 6.5^3,Level4 = 6.5^4))

