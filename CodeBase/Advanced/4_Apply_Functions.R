###  Apply function family
# Project :- Weather Patterns
# You have weather data of 4 cities

#Deliverables;-

#Import data

commponpath <- "D:\\Study\\R\\WorkingDirectory\\Weather-Data\\Weather Data\\"

Chicago <- read.csv("D:\\Study\\R\\WorkingDirectory\\Weather-Data\\Weather Data\\Chicago-F.csv",row.names = 1)
Chicago
NewYork <- read.csv("D:\\Study\\R\\WorkingDirectory\\Weather-Data\\Weather Data\\NewYork-F.csv",row.names = 1)
Houston <- read.csv("D:\\Study\\R\\WorkingDirectory\\Weather-Data\\Weather Data\\Houston-F.csv",row.names = 1)
SanFrancisco <- read.csv("D:\\Study\\R\\WorkingDirectory\\Weather-Data\\Weather Data\\SanFrancisco-F.csv",row.names = 1)


Chicago
NewYork
Houston
SanFrancisco

#check data frame
is.data.frame(Chicago)
#Lets convert to matrix
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#list
Weather <- list(Chicago=Chicago,NewYork=NewYork,Houston=Houston,SanFrancisco=SanFrancisco)
Weather
Weather[3]
Weather[[3]]
Weather$Houston


### Apply Apply functions
# apply(data,1,mean) == apply mean to rows 
# apply(data,1,max)
# apply(data,2,mean) == mean of all the columns
#for both, apply(data,c(1,2),mean)

## Apply family
#1. apply :- use on  amtrix: either the rows or columns
#2. tapply :- use on  a vector to extract subgroup and apply function to them 
#3. by:  use a data frames, same as group by sql
#4. eapply :- use on an Environment(E)
#5. lapply :- apply a function to elements of a list
#6. sapply :- a version of lapply, can simplify (S) the result , so it not presented as a list
#7. vapply :- has a predefined type of  return value(V)
#8. replication :- use to tun multiple time, use to generate random variables
#9. mapply :- multivariate version of sapply, arguments can be recycled
#10. rapply :- recursive version of lapply

#apply functions

apply(Chicago,1,mean)
#check
mean(Chicago[4,])

# analyze one city
apply(Chicago,1,max)
apply(Chicago,1,min)
#For practice
apply(Chicago,2,mean) # does not make any sense in the current data

#compare
apply(NewYork,1,mean)
apply(Houston,1,mean)
apply(SanFrancisco,1,mean)

# deliverable1

#Recerating the apply function with loop
# Find the mean of every row by method loop

output <- NULL
for(i in 1:5){
  output[i] <- mean(Chicago[i,])
}
output
apply(Chicago,1,mean)
#both are same

## using lapply
Chicago
t(Chicago)  #transpose
#apply transpose to all the city in the Weather list
mynewlist <- lapply(Weather,t)
mynewlist

#e.g 2
Chicago
rbind(Chicago,NewRow = 1:12)
# want to apply this to all cities in weather
lapply(Weather, rbind, NewRow = 1:12)

#eg
rowMeans(Chicago)  # same as apply(Chicago,1,mean)
#For all city
lapply(Weather,rowMeans)
#rowMeans, colSums, colMeans, rowSums


## combining lapply with []
Weather
Weather$Chicago[1]
# want to get first value of all the cities
lapply(Weather, "[", 1,1)
#First row of all the city
lapply(Weather,"[",1,)


## Adding your own function

lapply(Weather, function(x) x[1,])  # It will return a list which contain first row of all the cities in the Weather
lapply(Weather, function(x) x[5,])  #5th row
lapply(Weather, function(x) x[,12])  #12th col

lapply(Weather, function(x) x[1,]- x[2,])  #1st row -2nd row
# difference of min max temp with base as min
lapply(Weather, function(x) round((x[1,]-x[2,])/x[2,],2)) #temp fluctuation


#### using sapply
#output turned into a vector, simple
Weather
#AvgHigh_F for July
lapply(Weather, "[",1,7)
#it gave me lists
sapply(Weather,"[",1,7)
#It gives a vector

#AvgHigh_F for last quarter
lapply(Weather,"[",1,10:12)
sapply(Weather,"[",1,10:12)
#
lapply(Weather,rowMeans)
sapply(Weather,rowMeans)
sapply(Weather,rowMeans, simplify = F)  #get the result like lapply
round(sapply(Weather,rowMeans),2)  # delivery 1
lapply(Weather, function(x) round((x[1,]-x[2,])/x[2,],2)) #temp fluctuation
sapply(Weather, function(x) round((x[1,]-x[2,])/x[2,],2)) #temp fluctuation , delivry 2



### Nesting Apply functions
Weather
lapply(Weather,rowMeans)
#how to get rowMax, rowMin-- no pre-defined, create own
Chicago
#Need row Maximums of all rows
apply(Chicago,1,max)
## row max of all the cities in the weather
# apply across whole list
lapply(Weather,apply,1,max)  #Nesting  #prefered approach
#or
lapply(Weather, function(x) apply(x,1,max))

#tidy up
sapply(Weather, function(x) apply(x,1,max))  #deliv 3
sapply(Weather, function(x) apply(x,1,min))  #deliv 4

## Adavnced- which.max() & min()
sapply(Weather, function(x) apply(x,1,max))  
# this is giving the max of each rows, i want the metrics in which it has occured
# e.g max(AvgHigh_F) of Chicago happens in month July
?which.max
# it gives the index
Chicago
Chicago[1,]
which.max(Chicago[1,])
# 7th position,July-84
names(which.max(Chicago[1,]))
#here we got
# we will have apply for to iterate over a single matrix(eg-Chicago)
# and lapply or sapply for all the metrices in the list-Weather
apply(Chicago,1,max)
apply(Chicago,1,function(x)names(which.max(x)))

## Now for all cities
lapply(Weather,function(y)apply(y,1,function(x)names(which.max(x))) ) #or
sapply(Weather,function(y)apply(y,1,function(x)names(which.max(x))) )
