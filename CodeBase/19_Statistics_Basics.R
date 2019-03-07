### Population vs Sample

##Population:- collection of  all items of interest to your study.
# It is denoted as N
# And the numbers obtained using the population data are called Paramters

## Sample:- A subset of population. It is denoted as n
# And the numbers obtained using the population data are called Statistics

##  Central Tendency  ##

#1. Mean    2.Median  3. Mode

# 1 Mean:- average
library(tidyverse)

ny <- c(1,2,2,4,5,6,7,8,11,66)
la <- c(2,4,5,6,1,23,4,5,6,25)
pizza <- data.frame(ny,la)
mean(pizza$ny)
mean(pizza$la)


# Median:- middle number of the dataset
median(pizza$ny)
median(pizza$la)

# Mode:- majority of occurence
# to calculate mode- there is no starigh function
# we create a contingency table
xNY <- table(pizza$ny)
xNY
?table
names(xNY)[which(xNY==max(xNY))]
# Contigency table shows the frequency of the table(data)

summary(pizza)




### Measure of symmetry - -- Skewness
# Skewness indicates the observations in the dataset are whether concentrated on one side

col.1 <- c(1,1,1,1,2,2,2,2,2,2,3,3,3,3,4,4,5,5,7)
col.2 <- c(1,1,2,2,3,3,3,4,4,4,4,4,5,5,5,6,6,7,7)
col.3 <- c(1,2,3,3,4,4,4,5,5,5,5,6,6,6,6,6,6,7,7)

df <- data.frame(col.1,col.2,col.3)
df
summary(df)

#histogram of all 3
h1 <- ggplot(df,aes(x=col.1)) +
  geom_histogram(binwidth = 1,color="white", fill="red4") +
  theme_light()

h2 <- ggplot(df,aes(x=col.2)) +
  geom_histogram(binwidth = 1,color="white", fill="red4") +
  theme_light()

h3 <- ggplot(df,aes(x=col.3)) +
  geom_histogram(binwidth = 1,color="white", fill="red4") +
  theme_light()

h2
h3
h1   #-- Positive Skewness- Right skew
# The direction of the skew is counter-intuitive-- Determined by the side of the tail is leaning to

h2
# Zero or no skew, Mean = median = mode
# symmetrical distribution

h3
# Negative skewness -Left skew

# Skewness tells about data situation, distribution
# It is the link between central tendency measure and probability theory

####  Excercise  #####
sk1 <- read.csv("D:\\Study\\R\\WorkingDirectory\\skew-1.csv")
sk2 <- read.csv("D:\\Study\\R\\WorkingDirectory\\skew-2.csv")
sk1 <- data.frame(sk1)
sk2 <- data.frame(sk2)
sk1
sk2
sk<- data.frame(sk1,sk2)
sk
colnames(sk) <- c("sk1","sk2")
sk
top_n(sk,2)
summary(sk)


his1 <- ggplot(sk, aes(sk1))
his1 + geom_histogram(binwidth = 100) + theme_light()

his2 <- ggplot(sk, aes(sk2))
his2 + geom_histogram(binwidth = 100) + theme_light()

# install.packages("pysch")
# library(psych)

# describe(his1)
# describe(his2)


##### Measure of variability
#Univariate
#1. Variance 2. Standard Deviation  3. Coefficient of variation

#1. Variance:- Measure the dispersion of a set of data points around their mean value.


ny <- c(1,2,3,4,5,6,7,8,9,11)
la <- c(1,2,3,4,5,6,7,8,9,10)
pizza <- data.frame(ny,la)
pizza

## apply function:- lapply, sapply, vapply,mapply, rapply and tapply

#sapply: -great for running operations in a  repetetive way, from element to element.

lapply(pizza,mean)
sapply(pizza,mean)
sapply(pizza,var)
sapply(pizza,sd)
coef.var <- sapply(pizza,sd)/sapply(pizza,mean)
coef.var

#### Covariance and Correlation

##Sample land data

land <- read.csv("D:\\Study\\R\\WorkingDirectory\\landdata-states.csv", stringsAsFactors = F)
land <- as.tibble(land)
top_n(land,2)

land %>% subset(Date==2010) %>% ggplot(aes(x=log(Land.Value), y =Structure.Cost)) +
  geom_point() + theme_light() + labs(x="Land Value", 
                                      y ="Structural Cost",
                                      title = "Relation between land value and structural cost")
# here land value and structural cost are related to each other
# Covariance:- positive, negative  and zero:- It gives us sense that in which direction the two variables are moving
# Same direction:- covariance is positive
# Opposite>- negative
# Completely independent:- zero

## Correlation Coefficient:- It adjusts the covariance so that the relationship between the two variables
# is easy and intuitive to interpret(It standardise the covariance)

cor(land$Land.Value, land$Structure.Cost)
##   -1 <= Correlation Value  <= 1
# Perfect positive correlation means Correlation coefficient = 1

cor.test(land$Structure.Cost, land$Land.Value)
#t=? df =?, p-value=?

########### Excercise
#Exercise 26 Practical example with real estate data
#Section 10, Lecture 103
#Load the "practical_product.csv" and "practical_customer.csv" data files into R.

#Task 1: What are the types of data and the levels of measurement of the following variables: Cust ID, #Mortgage, Year of sale.

#Task 2: Create a histogram which represents the Price variable. Use the default binwidth values first and then #set bins of length $100,000. Use the data on all apartments, no matter if sold or not.

#Task 3: Interpret the results.

#Task 4: Create a scatter plot showing the relationship between Price and Area. Use the data on all apartments, #no matter if sold or not. Interpret the results.

#Task 5: Calculate the mean, median, mode, skewness, and standard deviation of Price for all apartments, no #matter if sold or not.

#Task 6: Interpret the measures.

#Task 7: Calculate the correlation between Price and Area. Is the result in line with the scatterplot?

prod <- read.csv("D:\\Study\\R\\WorkingDirectory\\practical-product.csv", stringsAsFactors = F)
cust <- read.csv("D:\\Study\\R\\WorkingDirectory\\practical-customer.csv", stringsAsFactors = F)
prod <- as.tibbe(prod)
head(prod,2)
cust <- as.tibble(cust)
head(cust,2)
select(cust,"Customer.ID","Mortgage",everything())
colnames(cust)
colnames(prod)

# Task 1

# Cust ID - Categorical/Nominal. This variable has the same properties as ID.
# Mortgage - Categorical/Nominal.	This is a Binary variable. Like a Yes/No question or Gender.
# Year of sale - Numerical, discrete/Interval.	Year is a numerical variable. It is always discrete. The level of measurement is questionable, but we would treat it as interval, as the 0 year would be the time when the Big Bang happened. The current BC-AD calendar was arbitrary chosen (similarly to degrees Celsius and Fahrenheit).

hisProd <- ggplot(prod,aes(Price))
hisProd + geom_histogram() + theme_light()
hisProd + geom_histogram(binwidth = 100000) + theme_light()
 # or
hisProd + geom_histogram(binwidth = 100000, 
                    color = "darkslategray", 
                    fill = "darkslategray4", 
                    alpha = 0.5) + 
  ggtitle("House Prices Frequency Distribution") + 
  labs(y = "Number of Houses", 
       x = "Price") + 
  theme_minimal() #+
  #scale_x_continuous(labels = comma) # this gets rid of the scientific notation on the x axis

# Task 3

# The two histograms point to similar insights - most of the apartment prices are concentrated in the interval ($217,000 to 317,000)	

#Task4

sp <- ggplot(prod, aes(x=Area..ft.., Price))
sp + geom_point() + 
  theme_light() + 
  labs(x = "Area in Square Feet", 
       y = "Price in USD", 
       title = "Relationship between Price and Area")

# The scatter plot shows a very strong linear relationship between Price and Area. This was to be expected as often Real Estate companies price their property per square foot.	
# Notice how for cheaper apartments (lower areas respectively), the points are closer so the variance is smaller. However, the bigger the apartment, the bigger the difference in the price.	


# task 5
summary(prod$Price)
sd(prod$Price)

# For mode we need to create a function

mod <- function(x){
  tab <- table(x)
  tab.Max <- max(tab)
  if(all(tab == tab.Max))
    mod <- NA
  else if(is.numeric(x))
  {
    mod <- as.numeric(names(tab[tab == tab.Max]))
  }
  else
  {
    mod <- names(tab[tab == tab.Max])
  }
  return (mod)
}
mod(prod$Price)
test <- c(1,2,3,4,4,5,6,7,8,9,2,3,4,5,6,3)
mod(test)
names(test)
?names 
# Functions to get or set the names of an object.
# example names
z <- list(a = 1, b = "c", c = 1:3)
names(z)
# change just the name of the third element.
names(z)[3] <- "c2"
z

z <- 1:3
names(z)
## assign just one name
names(z)[2] <- "b"
z

# We will only comment on the skew, as it is a bit tougher. 
# The skew is right (positive). This means that most aparments are relatively cheap with a tiny portion that is more expensive.														

# Task 7

cor.test(prod$Area..ft.., prod$Price)

# Yes, the result is in line with the scatter plot. The two variables are strongly correlated.



  