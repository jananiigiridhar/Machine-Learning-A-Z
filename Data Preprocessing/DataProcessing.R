#Data preprocessing

#Importing the dataset
dataset = read.csv('data.csv')

#Taking care of missing values
dataset$Age = ifelse(is.na(dataset$Age),mean(dataset$Age,na.rm = T),dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),mean(dataset$Salary,na.rm = T),dataset$Salary)

#Encoding categorical data
dataset$Country = factor(dataset$Country,levels = c('France','Spain','Germany'),labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased,levels = c('Yes','No'),labels = c(1,0))

#splitting the dataset into train and test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset,SplitRatio = 0.8)
training_set = subset(dataset,split == TRUE)
testing_set = subset(dataset,split == FALSE)

#Feature scaling
training_set[,2:3] = scale(training_set[,2:3])
testing_set[,2:3] = scale(testing_set[,2:3])

