#### Histogram

# Excellent for numeric data especially if it is continous data(frequencies)
# bins- range of values, bucket
library(tidyverse)
titanic <- read.csv("D:\\Study\\R\\WorkingDirectory\\titanic.csv", stringsAsFactors = F)
titanic <- as.tibble(titanic)

titanic
str(titanic)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)
titanic

hist <- ggplot(data = titanic, aes(x=Age))
hist + geom_histogram(binwidth = 5)

hist + geom_histogram(binwidth = 5, color = "red", fill="darkslategray4", alpha = 0.5)+ 
 # ggtitle("Age Distribution on the Titanic")+ 
  labs(y = "Number of Passangers", x = "Age", title ="Age Distribution on the Titanic") + theme_minimal()


#practice
employee <- read.csv("D:\\Study\\R\\WorkingDirectory\\employee-data.csv", stringsAsFactors = F, skip=23)
employee
employee <- as.tibble(employee)
head(employee)
emp <- filter(employee, salary > 45000)
emp

hist <- ggplot(emp, aes(x=salary))
  hist
  #library(ggthemes)
  hist + geom_histogram()

  hist + geom_histogram(binwidth = 20000, color = "darkslategray", fill = "darkseagreen2", alpha=0.5) + labs( y = "Number of Employees", x= "Salary", title = "Salary Distribution") + theme_light()

ggsave("D:\\Study\\R\\WorkingDirectory\\plot.png", width = 5, height = 5)
#save the graph

