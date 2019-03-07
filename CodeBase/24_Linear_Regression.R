##### Linear Regression  ###############

#It is a linear approximation of causal relationship between two or more variables.
# e.g income and education, more education more income, , here income is predicted value and x1 is the education sample data
# Y = beta0 + beta1*x1 + error
# Y is predicted value, beta0 is the constant, beta1 quantifies the independent x and x1 is the sample data of independent variable

#e.g, SAT and GPA
#SAT is the test, given by 84 students to get grade GPA
# We will create a  linear regression whihc will predict the GPA of the students based on the SAT score
# Better SAT score, better college and more GPU grade passing

college <- read.csv("D:\\Study\\R\\WorkingDirectory\\regression-example.csv")
college
head(college)
summary(college)
library(pastecs)
stat.desc(college)

#Here SAT is the predictors and GPA is the reponse

linmod <- lm(GPA~SAT, data = college)
linmod

#Also see the point graph

ggplot(college, aes(SAT,GPA)) +
  geom_point() +
  theme_light() +
  labs(title = "SAT and GPA", x =" GPA score ", y="SAT score")
# Higher the SAT more the GPA

#Also plot the regression line in the graph

ggplot(college, aes(SAT,GPA)) +
  geom_point() +
  theme_light() +
  labs(title = "SAT and GPA", x =" GPA score ", y="SAT score") +
  stat_smooth(method = "lm", se = FALSE)

summary(linmod)


## How to interpret the linear regression model

# when you run lm(linmod)
# you get coefficient table, here intercept is the constant- beta0 = 0.275 and below that beta1 = 0.0017
# GPA = 0.275 + 0.0017*SAT  linear regression equation
# Std.Error in the table shows the accuracy of the prediction for each variable, lowe SE = better estimation


### Excercise 121
# Using the provided housing data, please answer the following questions:
#   
#   Load the libraries you will need
# 
# Load the data as a tibble (readr has a function that does this directly)
# 
# Get the descriptives for your data so you can understand what you're dealing with a little better
# 
# Explore the data and see if there are any interesting trends to consider
# 
# Define the linear model
# 
# Plot the regression line
# 
# Print the results of the model
# 
# How many observations was the regression run on?
# 
# What is the R-squared of this regression? What does it tell you?
# 
# Determine if size is a statistically significant predictor of price.
# 
# What is the regression equation associated with this regression model?

realstate <- read.csv("D:\\Study\\R\\WorkingDirectory\\real-estate-price-size-year-view.csv")
realstate
head(realstate)
summary(realstate)
stat.desc(realstate)
relstate <- as.tibble(realstate)
realstate
stat.desc(realstate)
head(realstate,10)
# here we can check the price as per the size

ggplot(realstate,aes(price,size)) +
  geom_point() +
  theme_classic() +
  labs(x="Price", y="size", title="Price and Size")

# for linear regression line
ggplot(realstate,aes(price,size)) +
  geom_point() +
  theme_classic() +
  labs(x="Price", y="size", title="Price and Size") +
  stat_smooth(method="lm")
# get the linear model

lmmode <- lm(price~size, data = realstate)
lmmode
summary(lmmode)

# As per coefficient table 
# b0-constant = 101912.6
# b1 = 223.2
#so linear equation:-
# Price = 101912.6 + 223.2*Size

## or 

#setwd("C:/Users/Simona/R/Data")

### Load the libraries you will need 

library(tidyverse) 
library(psych) # good for descriptives, remember? 

# this is an additional library I have included (I want to show you something super useful :))
library(scales) # new package! we will use this to create a custom format when plotting the data

### Load the data as a tibble (readr has a function that does this directly)

data <- read_csv("D:\\Study\\R\\WorkingDirectory\\real-estate-price-size-year-view.csv")

### Get the descriptives for your data so you can understand what you're dealing with a little better

describe(data) # get a sense of your data
summary(data) # get a sense of your data


### Explore the data and see if there are any interesting trends to consider

point <- format_format(big.mark = " ", decimal.mark = ",", scientific = FALSE) # this helps us get rid of the scientific notation in the graph
ggplot(data, aes(price, size)) + 
  geom_point() +
  theme_light() +
  labs(x = "House price (in USD)",
       y = "House size (in sq ft)",
       title = "House pricing and size") +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point) # this is where we tell ggplot2 to use the format we set up above (point)

### Define the linear model 

linmod <- lm(price~size, data = data)

### Plot the regression line

ggplot(data, aes(price, size)) + 
  geom_point() +
  theme_light() +
  stat_smooth(method = "lm", se = FALSE) +
  labs(x = "House price (in USD)",
       y = "House size (in sq ft)",
       title = "House pricing and size") +
  scale_x_continuous(labels = point) + 
  scale_y_continuous(labels = point) # this is where we tell ggplot2 to use the format we set up above (point)


### Print the results of the model

summary(linmod)

### How many observations was the regression run on?

# 100. this is evident from the degrees of freedom (residual)
# degrees of freedom (residual) is calculated based on the sample size (n) minus the number of parameters (k) being estimated minus 1
# degrees of freedom (residual) = n - k - 1 
# 98 = n - 1 - 1 
# n = 100


### What is the R-squared of this regression? What does it tell you?

# Adjusted R-squared:  0.7421 - we only look at the adjusted R-squared because it is more reliabel.
# the adjusted R-squared increases only if the new term improves the model more than would be expected by chance
# it decreases when a predictor improves the model by less than expected by chance

# The value tells us that this regression model explains a big part of the variablity in the model (~75%)


### Determine if size is a statistically significant predictor of price. 

# Size is indeed a statistically significant predictor of price. This is evident from the p-value of the t-statistic.

### What is the regression equation associated with this regression model?

# y-hat = 101912.6 + 223.2*x1 
