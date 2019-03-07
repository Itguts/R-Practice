### factors

fin <- read.csv("D:\\Study\\R\\WorkingDirectory\\Future-500.csv", na.strings = c(""))
head(fin)
colnames(fin)
tail(fin)
str(fin)

summary(fin)

# Factor is a categorical variable(Nominal), identifiers to each categorical value
# It is way of dealing categorical/string value numerically

# Here in this data Id and Inception- do nee any mathematical calculations/stats
# Revenue, Expenses and Growth are factors which should not be. They became factors might be because of some char attached to the value

#Changing from non-factor to factor

fin$ID <- factor(fin$ID)
str(fin$ID)
fin$Inception <- factor(fin$Inception)
str(fin)

####   Factor variable Trap

# It comes while converting a factor variable into a non-factor

#converting characters to numeric
a <- c("11","12")
a
typeof(a)
b <- as.numeric(a)
b
typeof(b)

## other exMPLE

z <- factor(c("11","12","13","12"))
z
typeof(z)
x <- as.numeric(z)
x
typeof(x)
#On as you see it gives the factor value not the actual value

### Correct way:  first convert vector to character and then numeric
x <- as.numeric(as.character(z))
x


# eg Revenue, Growth, Expenses from our data set
str(fin)

fin$Profit <- factor(fin$Profit)
str(fin)

fin$Profit <- as.numeric(as.character(fin$Profit))
head(fin)


############  Gsub() ans sub() -- Gsub replaces all instances
#e.g Revenue contains $ and Expenses contains dollar characters...

# First  Expense col
fin$Expenses <- gsub(" Dollar", "", fin$Expenses)
head(fin)
## Also remove comma
fin$Expenses <- gsub(",", "", fin$Expenses)
fin$Expenses <- gsub("s", "", fin$Expenses)
head(fin)


## Revenue

fin$Revenue <- gsub("$", "", fin$Revenue)
# Its not replacing dollar sign, its a special character
fin$Revenue <- gsub("\\$", "", fin$Revenue)
fin$Revenue <- gsub(",", "", fin$Revenue)
head(fin)

# Growth
 fin$Growth <- gsub("%","",fin$Growth)
head(fin) 
#Here gsub automatically converts factor to character, so we need to convert it those into numeric

fin$Revenue <- as.numeric(fin$Revenue)
fin$Expenses <- as.numeric(fin$Expenses)
fin$Growth <- as.numeric(fin$Growth)
str(fin)
summary(fin)

####  Dealing with Missing data
#1. Predict with 100% accuracy
#2. Leave record as is
#3. Remove record entirely(if more than 90% is missing)
#4. Replace with mean, median, mode
#5. Fill by exploring Corelation and similarities
#6. Introduce dummy variable for Missingness


#Now check our data set
# Employees column:- Missing filed can be filled with Median
# Industry filed:- we can delete the row which do not have industry field,  we can fill it
# Inception:-  we can either leave it or remove the row, or research it
# State:- It can be filled as per city filed, NY for the city New York
# Expnese :- Revenue-Profit
# Revenue:- Median
# Expenses:- Median
# Profit:- Revenue-Expenses
# Growth: - Also calculated


# What is NA:- Missing false
?NA
NA == NA
NA == 23
## All result is NA

## Locating and delaing missing value in our dataset
head(fin,10)
# we have NA, <NA>( in  Inception col)

complete.cases(fin)
#It checks the NA in any row
any( is.na(fin))

#Get all the row  which have NAs
fin[!complete.cases(fin),]
#only 6 rows,  empty does not count in NA category
# So While reading the csv, we must replace empty place to NA
head(fin,24)
fin[!complete.cases(fin),]
#Now getting more rows
# we have some <NA> and NA: -Factors variable come up with <NA>


### Filtering: usin which() for non-missing data
fin[fin$Revenue == 9746272,]
# here ,  we are getting some other rows which dont have id, revenue=9746272, becaase , Revenue field has many NA rows and NA are not comparable
# so correct way
which(fin$Revenue == 9746272)
# It retun the idex of the dataset rows
fin[which(fin$Revenue == 9746272),]
# here we get the entire row

fin[which(fin$Employees==45),]


## Filtering:- using is.na method
is.na(fin$Expenses)
any(is.na(fin$Expenses))
fin[is.na(fin$Expenses),]
 
# Removing record with missing data
# e.g:- blank Industry cell, we cant fill it, we dont know,
# before any cleaning take backuo if current dataset
fin_back <- fin

fin[!complete.cases(fin$Industry),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]
#removing the rows
fin <- fin[!is.na(fin$Industry),]
fin[is.na(fin$Industry),]
fin
# Row 14 and 15 row have been deleted

### Resetting the Data frame index after deleting rows
fin
rownames(fin) <- 1:nrow(fin)  ## Assigning each row a name, from 1 
rownames(fin)
fin
rownames(fin) <- NULL
fin
rownames(fin)
tail(fin)



## Replacing missing data- Factual Analysis method
#  Empty State can be filled with City Name, NY for New York

fin[!complete.cases(fin),]
fin[is.na(fin$State) & fin$City == "New York",]
fin[is.na(fin$State) & fin$City == "New York","State"] <- "NY"
# we have replaced
fin[is.na(fin$State) & fin$City == "New York",]

#san francisco
fin[is.na(fin$State) & fin$City == "San Francisco",]
fin[is.na(fin$State) & fin$City == "San Francisco","State"] <- "CA"
fin[is.na(fin$State) & fin$City == "San Francisco",]

fin[!complete.cases(fin),]


### Median impuation method
# Employee column, empty can be filled with Median (Not Mean, beacuse of high outliers value)
fin$Employees <- as.numeric(fin$Employees)
fin[is.na(fin$Employees),]
str(fin)
summary(fin)
median(fin$Employees,na.rm = T)
median(fin[, "Employees"], na.rm = TRUE)



fin[is.na(fin$Employees) & fin$Industry =="Retail"  ,"Employees"] <- median(fin[fin$Industry =="Retail", "Employees"], na.rm = TRUE)

fin[is.na(fin$Employees) & fin$Industry =="Financial Services"  ,"Employees"] <- median(fin[fin$Industry =="Financial Services", "Employees"], na.rm = TRUE)
fin[is.na(fin$Employees),]
fin[3,]
fin[330,]


fin[!complete.cases(fin),]
#only 4 rows to deal, Revnue, Expenses, Profit, Growth
#For Growth
med_Growth_Industry_Construction <- median(fin[fin$Industry =="Construction", "Growth"], na.rm = TRUE)
med_Growth_Industry_Construction
fin[is.na(fin$Growth) & fin$Industry == "Construction", "Growth"] <- med_Growth_Industry_Construction
fin[8,]

# For Revenue

fin[!complete.cases(fin),]
med_Rev_Industry_Construction <- median(fin[fin$Industry =="Construction", "Revenue"], na.rm = TRUE)
med_Rev_Industry_Construction
fin[is.na(fin$Revenue) & fin$Industry == "Construction", "Revenue"] <- med_Rev_Industry_Construction
fin[!complete.cases(fin),]

#For Expenses
med_Exp_Industry_Construction <- median(fin[fin$Industry =="Construction", "Expenses"], na.rm = TRUE)
med_Exp_Industry_Construction
fin[is.na(fin$Expenses) & fin$Industry == "Construction" & is.na(fin$Profit), "Expenses"] <- med_Exp_Industry_Construction
fin[!complete.cases(fin),]
#Expenses for IT Industry , we can apply formula Revenue-Profit

fin[is.na(fin$Expenses), "Expenses"] = fin[is.na(fin$Expenses),"Revenue"] - fin[is.na(fin$Expenses),"Profit"]
  
  
  ##For Profit (Rev-Exp)
  fin[is.na(fin$Profit), "Profit"] <- fin[is.na(fin$Profit),"Revenue"] - fin[is.na(fin$Profit),"Expenses"]
fin[c(8,42),]
#finally checking
fin[!complete.cases(fin),]
# only one,  and agree to leave as it is

#### Visualization#
library(ggplot2)
#1. A scatter plot  classified by Industry showing Revenue, expenses and profit
p <- ggplot(data=fin)
p
p + geom_point(aes(x=Revenue, y = Expenses,
                   color=Industry, size=Profit))

#2.  A scatterplot  that includes industry trends  for the expense~revenue relationship
d <- ggplot(data=fin, aes(x=Revenue, y = Expenses, color=Industry))

d + geom_point() +
  geom_smooth()

#or

d + geom_point() +
  geom_smooth(fill =NA, size=1)


#3.  Boxplot showing growth by industry

b <- ggplot(data=fin,aes(x=Industry, y =Growth, color = Industry))
b + geom_boxplot(size=1)
#Extra
b + geom_jitter() +
  geom_boxplot(size=1, alpha = 0.5, outlier.colour = NA)
