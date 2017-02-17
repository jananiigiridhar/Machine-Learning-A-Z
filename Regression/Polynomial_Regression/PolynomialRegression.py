# Polynomial Linear Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values  #1:2 makes it a matrix
y = dataset.iloc[:, 2].values

# Splitting the dataset into the Training set and Test set
#from sklearn.cross_validation import train_test_split
#X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.3, random_state = 0)

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

#Fitting Linear Regression to the dataset
from sklearn.linear_model import LinearRegression
linear_regressor = LinearRegression()
linear_regressor.fit(X,y)

#Fitting Polynomial regressin to the dataset
from sklearn.preprocessing import PolynomialFeatures
polynomial_regressor = PolynomialFeatures(degree=4)
X_poly= polynomial_regressor.fit_transform(X)
linear_regressor2 = LinearRegression()
linear_regressor2.fit(X_poly,y)

#visualizing the Linear Regression Results
plt.scatter(X,y,color = "Red")
plt.plot(X,linear_regressor.predict(X),color='blue')
plt.title('Truth or Bluff(LinReg)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

#visualizing the Polynomial Regression Results
X_grid = np.arange(min(X),max(X),0.1)
X_grid = X_grid.reshape((len(X_grid),1))
plt.scatter(X,y,color = "Red")
plt.plot(X_grid,linear_regressor2.predict(polynomial_regressor.fit_transform(X_grid)),color='blue')
plt.title('Truth or Bluff(PolReg)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()

#Predicting a new result with Linear Regression
linear_regressor.predict(6.5) #value used instead of X

#Predicting a new result with Polynomial Regression
linear_regressor2.predict(polynomial_regressor.fit_transform(6.5)) #value used instead of X_poly
