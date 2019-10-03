import pandas as pd
import matplotlib.pyplot as plt

# Importing datase
dataset = pd.read_csv("Salary_Data.csv")
X = dataset.iloc[:, ["YearsExperience"]].values
y = dataset.iloc[:, 1].values

# Visualizing data
plt.scatter(X, y)
plt.show()

# Values can be represented by a Simple Linear Regression Model

# Splitting dataset to Training Set and Test Set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Fitting values to the model
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

# Predicting values from the test set
y_pred = regressor.predict(X_test)

# Visualising Training Set with the model
plt.scatter(X_train, y_train, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'blue')
plt.title('Salary vs Experience - Training Set')
plt.xlabel('Years of experience')
plt.ylabel('Salary')
plt.show()

# Visualsing Test Set with the model
plt.scatter(X_test, y_test, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'blue')
plt.title('Salary vs Experience - Test Set')
plt.xlabel('Years of experience')
plt.ylabel('Salary')
plt.show()

# Model give a good fit

# Training model with the whole dataset
regressor.fit(X, y)