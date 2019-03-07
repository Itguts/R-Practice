#### Data frames from vectors

title <- c("DDLJ","Sholay","RDB")
year <- c(1975,1956,1998)
length <- c(180,212,140)
box.office <- c(234,456,126)

my.data <- data.frame(title, year, length, box.office)

my.data

#rename columns
names(my.data) <- c("Movie", "Release Year","Duration", "Box Office")
my.data

#or
my.data <- data.frame(Movie = title, Release = year, Length= length, Gross = box.office, stringsAsFactors = F)
my.data

str(my.data)




?data.frame
box.office1 <- c(234,456)
(my.data1 <- data.frame(title, year, length, box.office1))  ###???/

L3 <- LETTERS[1:3]
L3
fac <- sample(L3, 10, replace = TRUE)
fac
(d <- data.frame(x = 1, y = 1:10, fac = fac))
is.data.frame(d)
## The "same" with automatic column names:
data.frame(1, 1:10, sample(L3, 10, replace = TRUE))


small <- letters[1:3]
small


### example

name <- c("Flipper", "Bromley", "Nox", "Orion", "Dagger", "Zizi", "Carrie")
mo <- c(53, 19, 34, 41, 84, 140, 109)
size <- c("medium", "small", "medium", "large", "small", "extra small", "large")
weight <- c(21, 8, 4, 6, 7, 2, 36)
breed <- c("dog", "dog", "cat", "cat", "dog", "cat", "dog")

pets <- data.frame(mo, size, weight, breed)
pets
names(pets) <- c("Months old", "Size", "Weight", "Breed")
pets
rownames(pets) <- name
pets
# alternative naming

pets <- data.frame(row.names = name, "Months old" = mo, "Size" = size, "Weight" = weight, "Breed" = breed)
pets

levels(pets[, "Breed"]) <- c("dog", "cat")   ####?????
pets


##### tidyverse package
#install.packages("tidyverse")

########## Subsetting of data frames

library(tidyverse)
starwars
my.wars <- as.data.frame(starwars)
my.wars <- my.wars[, -(11:13)]
my.wars

head(my.wars)
tail(my.wars)

my.wars[3,9]
#or
my.wars[3,"homeworld"]
my.wars[5,]
head(my.wars[,1])
head(my.wars[["name"]])

head(my.wars$name)
head(my.wars["name"])


my.wars[c(1:10),c("name","homeworld")]


### adding/expanding data frame
title <- c("DDLJ","Sholay","RDB")
year <- c(1975,1956,1998)
length <- c(180,212,140)
box.office <- c(234,456,126)

my.data <- data.frame(title, year, length, box.office)

my.data
opinion <- c("Hit","Flop","Hit")
my.data <- cbind(my.data, opinion)
my.data

my.data$opinion =NULL

my.data

#or
my.data$opinion <- opinion
my.data


#### adding observation/row in the data frame
movSultan <- data.frame(title="Sultan",year=2017,length=180,box.office=500, opinion="Flop")
rbind(my.data,movSultan)


###### Excercise 16

name <- c("Flipper", "Bromley", "Nox", "Orion", "Dagger", "Zizi", "Carrie")
mo <- c(53, 19, 34, 41, 84, 140, 109)
size <- c("medium", "small", "medium", "large", "small", "extra small", "large")
weight <- c(21, 8, 4, 6, 7, 2, 36)
breed <- c("dog", "dog", "cat", "cat", "dog", "cat", "dog")

pets <- data.frame(mo, size, weight, breed)
names(pets) <- c("Months old", "Size", "Weight", "Breed")
rownames(pets) <- name

pets
vaccinated <- c("Yes","Yes","No","Yes","No","Yes","No")
pets <- cbind(pets,vaccinated)
pets

milo <- data.frame("Months old" =67,  Size = "small", Weight = 7, Breed = "dog", vaccinated = "yes" )
#milo <- NULL
milo
rownames(milo) <- c("Milo")
milo
pets
pets <- rbind(pets, milo)



milo <- data.frame(row.names = "Milo", Months.old = 67, Size = "small", Weight = 7, Breed = "dog", Vaccinated = "Yes")
pets <- rbind(pets, milo)
pets

ncol(pets)
nrow(pets)
colnames(pets)
rownames(pets)
str(pets)


class(diamonds)
is.data.frame(diamonds)
diamonds

UsJudgeRatings
is.data.frame(USJudgeRatings)
USJudgeRatings
str(USJudgeRatings)
my.df <- USJudgeRatings
my.df$AVRG <- rowMeans(my.df)
my.df
avrg <- my.df["AVRG"]
avrg


### Missing value

eg.na <- c(NA,1:10)
eg.na
(mean(eg.na))
(mean(eg.na, na.rm = T))
is.na(eg.na)

my.wars
is.na(my.wars)
any(is.na(my.wars))
any(is.na(my.wars$name))


########### Remove NA and replace to Unknown

my.wars
my.wars$species
is.na(my.wars$species)
any(is.na(my.wars$species))
my.wars$species[(is.na(my.wars$species))] <- "Unknown"

my.wars$species

subset(my.wars, species == "Unknown")

