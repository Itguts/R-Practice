### know the working directory
getwd()
setwd("D:\\Study\\R\\WorkingDirectory")
getwd()

## read a file

data <- read.table("pokRdex-comma.csv", sep = , header = TRUE, stringsAsFactors = F)
data


data.csv <- read.csv("pokRdex-comma.csv", stringsAsFactors = F,  nrows = 20)
data.csv

#  read tab delimited file

data.tab <- read.delim("pokRdex-tab.txt", sep="\t", nrows = 10)
data.tab


################ Export data ############

title <- c("DDLJ","Sholay","RDB")
year <- c(1975,1956,1998)
length <- c(180,212,140)
box.office <- c(234,456,126)

my.data <- data.frame(title, year, length, box.office)

my.data
write.csv(my.data, file="Movie.csv", row.names = F)

(read.csv("Movie.csv"))

write.table(my.data, file="Movie_Tab.txt", sep = "\t")
(read.table("Movie_Tab.txt", sep="\t"))


### Excercise Employee data

emp.data <- read.csv("employee-data.csv", skip = 23, nrows = 200, stringsAsFactors = F)
names(emp.data) <- c( "Employees Number","First name","Last name","Birth Date","Gender","Job Title","Salary","From Date","To Date")
emp.data
str(emp.data)

write.csv(emp.data, "Employee_Export.csv", row.names = F)
(read.csv("Employee_Export.csv"))


### sense of data
nrow(emp.data)
ncol(emp.data)
colnames(emp.data)
rownames(emp.data)

summary(emp.data)
data()
