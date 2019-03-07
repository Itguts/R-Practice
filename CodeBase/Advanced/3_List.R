#### Lists ##########3
# A data structure in  R

# https://www.superdatascience.com/rcourse-advanced/
# Get the Machine Utilization csv from above URL
# It has 3 columns, TimeStamp, Machine and Percent Idle
# Machine Utilization  Project

#In Australia coal BAY, where cal is shipped to other places,
# work here continues to 24*7, need data science to check which machine requires maintenance
# ie. study about the performance of the machines


# Deliverables:- A list with the following components
#1. Character:- Machine Name
#2. Vector:- min,mean,max (Utilization for the month- excluding unknown hours)
#3. Logical:- Has utilization ever fallen 90%? True or  False
#4. Vector:-  All hours where utilization is Unknown(NA's)
#5. DataFrame:-  For this machine
#6. Plot:- For this machine


util <- read.csv("D:\\Study\\R\\WorkingDirectory\\Machine-Utilization.csv")
head(util)
str(util)
summary(util)
#Derive Utilization column
util$Utilization <- 1-util$Percent.Idle
head(util,12)


# Handling date-time in R
# We have time stamp dd/mm/yyyy hh:mm
#universal format/standard-  1970 to today, int data type
?POSIXct

as.POSIXct(util$Timestamp, format = "%d/%m/%Y %H:%M")
util$PosixTime <- as.POSIXct(util$Timestamp, format = "%d/%m/%Y %H:%M")
head(util,12)
summary(util)


# How to re-arrange data in data frame
#Remove Timestamp column
util$Timestamp <- NULL
util <- util[,c(4,1,2,3)]
util <- util[,c(2,1,3,4)]
head(util)

# What is a List
# het RL1 machine subset
RL1 <- util[util$Machine == "RL1", ]
summary(RL1)
#still getting other machine=0
RL1$Machine <- factor(RL1$Machine)
summary(RL1)

# Now construct our required list
#1. Character:- Machine Name
#2. Vector:- min,mean,max (Utilization for the month- excluding unknown hours)
#3. Logical:- Has utilization ever fallen 90%? True or  False

util_stat_rl1 <- c(min(RL1$Utilization, na.rm = T),
                   mean(RL1$Utilization, na.rm = T),
                   max(RL1$Utilization, na.rm = T))
util_stat_rl1                   
# Now to get below 90% util
RL1$Utilization < .90
which(RL1$Utilization < .90)  # Got the indices
length(which(RL1$Utilization < .90))
length(which(RL1$Utilization < .90)) > 0
# 27 times 90% below uitlization
util_under_90_flag <-   length(which(RL1$Utilization < .90)) > 0                 
util_under_90_flag

list_RL1 <- list("RL1", util_stat_rl1, util_under_90_flag)
list_RL1

# naming components of the list
names(list_RL1)

names(list_RL1) <- c("Machine","Stats","LowThresold")  # or at the time of creating list
list_RL1
names(list_RL1)

# Extracting components from List
# Three ways
#1. []  wil always retrun a list
#2. [[]] wil always return the actual object
#3. $ same as [[]] but prettier

list_RL1[1]

list_RL1[[1]]

list_RL1$Machine

list_RL1[2]
list_RL1[[2]]
list_RL1$Stats
list_RL1[[2]][3]
list_RL1$Stats[3]

# Adding and deleting components
list_RL1
list_RL1[4] <- "New Information"
list_RL1
#or by using $ sign
# We will add
# Vector:-  All hours where utilization is Unknown(NA's)

RL1
RL1[is.na(RL1$Utilization),]
RL1[is.na(RL1$Utilization),"PosixTime"]
list_RL1$UnknownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]
list_RL1
#Remove "New Information" component
list_RL1[4] <- NULL
list_RL1
# Notice:- Numeration has changed automatically
list_RL1[4]
#No 5 become the no 4 after deletion

# Add data frame
list_RL1$Data <- RL1
list_RL1
summary(list_RL1)

# Subsetting a list
list_RL1$UnknownHours[1]
list_RL1[[4]][1]

#subset
list_RL1[1]
list_RL1[1:2]
list_RL1[c(1,4)]
sub_list_ <-list_RL1[c("Machine")]
sub_list_

### Time series plot

library(ggplot2)

p <- ggplot(data=util)
p + geom_line(aes(x=PosixTime,y=Utilization,
                  color=Machine), size=1.2)
# seperate color
p + geom_line(aes(x=PosixTime,y=Utilization,
                  color=Machine), size=1.2) +
  facet_grid(Machine~.)

# adding line
myplot <- p + geom_line(aes(x=PosixTime,y=Utilization,
                  color=Machine), size=1.2) +
  facet_grid(Machine~.) +
  geom_hline(yintercept = .90, color="Gray", size = 1.2, linetype=3)
myplot
#Adding this picture in my final list
list_RL1$Plot <- myplot

list_RL1
summary(list_RL1)
list_RL1$Plot
str(list_RL1)
