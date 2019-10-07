#install.packages("ggplot2")
library(ggplot2)

# Importing dataset
dataset <- read.csv("Salary_Data.csv")

#Visualising Dataset to see linear trend
ggplot(dataset, aes(YearsExperience, Salary)) + geom_point()

# Splitting dataset into Training and Test sets
#install.packages("caTools")
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting training set to Linear Regression Model
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

# Predicting on test set
y_pred = predict(regressor, newdata = test_set)

# Visualising linear model with Training Set
ggplot() + geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'blue') +
  ggtitle('Salary vs Experience (Training set)') + xlab('Years of experience') + ylab('Salary')
  
# Visualising linear model with Test Set
ggplot() + geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') + xlab('Years of experience') + ylab('Salary')

# Training the model on complete dataset
regressor = lm(formula = Salary ~ YearsExperience, data = dataset)
