###  Hypothesis testing  ### 

#Steps in data-driven decision-making:-
#1. Research question
#2. Generate a theory
#3. Formulate a hypothesis
#4. Find correct test
#5. Execute the test
#6. Make a decision

# A hypothesis is a statement that can be tested
#e.g:-  Apples in Newyork is expensive. This is  not a hypothesis as it cant be tested. It is a statement
# e.g:- Apples in NY are more expensive than 1.75 dollars. This is a hypo
# Hypo  can be true or false

# types of hypo
#1. The Alternative hypo(H1):- What the  theory predicts will be true
#2. The Null hypo(H0):- What the  theory predicts will be false.


#Case study:- As per Glassador:- The mean salary of  a data scientist in US is 12300 $
# H1:-  The mean salary of  a data scientist in US is not 123000 $
# H0:-  The mean salary of  a data scientist in US is 123000 $


#Case study2:- As per Glassador:- The mean salary of  a data scientist in US is more 12300 $
# H1:-  The mean salary of  a data scientist in US is more than 123000 $
# H0:-  The mean salary of  a data scientist in US is 123000 $
# For H1:- I need to proof that the mean salary <= $123000

#case study3:- Grade in UK university. If a hypothesis statement says that avg grade is 70%. You also have population data and its mean
# as 55 %, so here in this case
#H0:- Mean-grade = 70%
#H1:- Mean-Greade not equal to 70%
# here 70 % lies in the rejection region so we can reject the hypo
# If hypo is 56% we cannot reject the it(Null hypothesis

## Excercise -- test for the mean

sal <- read.csv("D:\\Study\\R\\WorkingDirectory\\ztest-a.csv")
head(sal,2)
summary(sal)

# As per Glassador the mean sal is 113000 and SD=15000 the H0  = mean =113000
# and the alternative hypothesis , H1 = mean not equal to 113000
# Here we need to standarize it

# z = x-x-bar/sd  ie. sample-mean/sd
# Since it is s sample we use standard error
#  Z = xbar- sample mean/SE, sample mean-the value of interest from no hypothesis divided by standard error

z.test <- function(a, mu, sd){
  zeta = (mean(a)- mu)/ (sd/sqrt(length(a)))
  return (zeta)
}
z.test(sal$salary, 113000, 15000)
qnorm(0.975)
#o/p = -4.67, here we take positive Z, ie:- 4.67 and compare to z- table
# Z = 4.67, z = 1.96 and alpha = 0.05

### Excercide

# Using the data from the lesson, test the null hypothesis at 10% significance
# 
# sample mean: $100,200
# 
# population sd: $15,000
# 
# standard error: $2,739
# 
# sample size: 30
# 
# z-score: -4.67
# 
# H0: (Glassdoor data): $113,000

## Solution:-
# Given:-
#1 H0 = mu = $113000
#2 H1 = mu # $113000(So it is goint to be two tailed test)
#3 SD of population = $15000
#4 sample size = 30(so z-test)
#5 alpha = .10 (.05 on each tail)
#6 Go for z-table and search area to calculate critical value(cv) = .05 = 1.65
#7 Now calculate Z value = mean-sample- pop sample/sd of pop/sqrt of sample size = 
Zvalue <- z.test(sal$salary, 113000, 15000)
Zvalue
# = -4.673 which is higher than critical value, so we reject the null hypothesis.

## Also we can calcualte the T test and follow t table to calulate cv from alpha :-
#1. when SD of pop is not given
#2. When sample size is less than 30
#3 T- value = sapmle mean-pop mean/sd of sample/sqrt of sample size

T.test <- function(sample, mu,sdsample){
  return (mean(sample)-mu/sdsample/sqrt(len(sample)))
}



###  p value###
# It is the lowest level of significance at which you can reject the Null hypothesis.
# It is the smallest problalibty

# eg:- let say Z-score is 2.58, go to the Z table, find Z from first row for 2.5 and .08 from column, pick the intrsection
#point value, it is .9951
#so p value = (1-.9951) = .0049 and let say alpha =.05
# If p value < alpha, we can reject the Null hypothesis
# For two tailed test, p = 2times , here  p = .0098



## Excercise------112
# Using the data from the lesson, solve the following tasks:

# What if the question was: is the competitor open rate EXACTLY 40%. What would be the decision then?

# 1. Test at 5% significance. Comment on the decision with the appropriate statistical jargon.
# 2. Test at 1% significance. Comment on the decision with the appropriate statistical jargon.

# Hint: Think about what type of test would be suitable here (one- or two-sided).
install.packages("pysch")
library(psych)

rate <- read.csv("D:\\Study\\R\\WorkingDirectory\\ttest-a.csv") # load your data
describe(rate) # understand your data
rate
my.t.test <- function(a, hmean){
  t <- (mean(a) - hmean)/(sd(a)/sqrt(length(a)))
  return(t) # create the test
}
print(mean(rate$Open.rate))
print(sd(rate$Open.rate))
my.t.test(rate$Open.rate, 0.4)

# H0 = open rate is NOT 40%
# H1 = open rate is 40%
# The problem is a two-sided test
# T = 0.53
# t1 = 2.26(From t table) Accept the null. At the 5% significance level we cannot say that the competitor's open rate is 40%
# t2 = 3.25(from t table) Accept the null. The test on that sample shows that at 1% significance, our competitor's open rate is not 40%.

### Comparing two means-Dependent samples
# the samples whic are tested before condition and same tested after condition are said to be dependent
# e.g, a drug company is goint to test  a pill to 10 random people to check the magnesium level
# so 10 people go for test before taking the mg pill to get mg level and after taking pill to notedown the mg level

#e.g 
depppl <- read.csv("D:\\Study\\R\\WorkingDirectory\\dependent-samples.csv") # load your data
depppl
summary(depppl) # understand your data
#install.packages("pastecs")
#here H0 : D0 >= 0 and H1:D0<0

library(pastecs)
 dep.test <- t.test(depppl$Before,depppl$After, paired = T, alternative = "l")
dep.test 

#Here, paired shoes dependent samples, alternative shows one tailed left test

stat.desc(depppl)   # need to understand each term


#### Excercise 114
# A health guru on the internet designed a weight-loss program.
# 
# You are wondering if it is working. You are given a sample of some people who did the program.
# 
# You can find the data in kg if you prefer working with kg as a unit of measurement.
# 
# State the null hypothesis.
# 
# Calculate the appropriate statistic
# 
# Decide if this is a one-sided or a two-sided test. What is the p-value?
#   
#   Based on the p-value, decide at 1%,5% and 10% significance, if the program is working. Comment using the appropriate statistical jargon.

#Ans:-
#Here Ho means weigth is less than or equal the before weight
# and H1 says weight is more before-   so it is single tailed(right side)

wppl <- read.csv("D:\\Study\\R\\WorkingDirectory\\weight-data-exercise-kg.csv") # load your data
wppl

t-test-val <- t.test(wppl$before,wppl$after,paired = T, alternative = "g")



#### Comparing two means- Independent samples
#e.g In UK university,  Dean proposed that diff between eng mean and Management mean =-4
#so H0 = muE-muM = -4
#and H1 = muE-muG # -4 (two tailed  t test)
#sample
#install.packages("tidyverse")
library(tidyverse)
uk <- read.csv("D:\\Study\\R\\WorkingDirectory\\independent-samples.csv")
uk
uk <- gather(uk, Engineering, Management, key="Course", value="Grades")
uk
#calucluate T test
ukT <- t.test(uk~Course, data = Grades, mu = -4)
