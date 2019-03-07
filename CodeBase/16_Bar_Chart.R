### bar chart
library(tidyverse)
titanic <- read.csv("D:\\Study\\R\\WorkingDirectory\\titanic.csv", stringsAsFactors = F)
titanic <- as.tibble(titanic)

titanic
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)

titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)
titanic

bar <- ggplot(titanic, aes(x=Survived))
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count", Title="Survival Rate on Titanic")

### Survived and not survivd should appear deifferent color
bar <- ggplot(titanic, aes(x=Survived, fill=Survived))
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count", Title="Survival Rate on Titanic")

### Survival rate based on gender

bar <- ggplot(titanic, aes(x=Survived, fill=Sex))
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count", Title="Survival Rate on Titanic")

### See the graph Gender wise

bar <- ggplot(titanic, aes(x=Sex, fill=Survived))
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count",X= "Gender", Title="Survival Rate by Gender")
titanic
####  categories the data as per passenger class

bar <- ggplot(titanic, aes(x=Sex, fill=Survived))
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count",X= "Gender", Title="Survival Rate by Gender") + facet_wrap(~ Pclass)
##0r

bar <- ggplot(titanic, aes(x=Sex, fill=Survived))
bar + geom_bar() + theme_light() +
  labs(y = "Passenger Count",X= "Gender", Title="Survival Rate by Gender") + facet_wrap(Sex ~ Pclass)


### Excercise

emp <- read.csv("D:\\Study\\R\\WorkingDirectory\\employee-data.csv", stringsAsFactors = F, skip=23)
emp <- as.tibble(emp)
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)

emp.a <- filter(emp, salary > 45000)

bar <- ggplot(emp.a, aes(x= title, fill = gender))
bar + geom_bar() + labs(x="Job Position", y = "Employee Count", title = "Job Positions by Gender")
+ theme_grey()

## or
install.packages("ggthemes")
library(tidyverse)
library(ggthemes)

bar <- ggplot(emp.a, aes(title, fill = gender))
bar + geom_bar() + theme_fivethirtyeight() + scale_fill_manual(values = c("chartreuse4", "darkorange")) +
  labs(title = "Job Positions by Gender",
       y = "Employee count",
       x = "Job position")
