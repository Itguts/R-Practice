## Box Plot:- It represents  grouped numerical  data in terms of quartile
# It shows quartile, median, highest and lowest data point also

library(tidyverse)
titanic <- read.csv("D:\\Study\\R\\WorkingDirectory\\titanic.csv", stringsAsFactors = F)
titanic <- as.tibble(titanic)

titanic
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)
titanic

box <- ggplot(titanic, aes(y=Age, x = Survived, fill=Sex))  # inherit.Aes=False
box + geom_boxplot() +
  labs(title = "Survival Rate on Titanic based on Age") +
  theme_light()
## the values(...) that go beyond the line are outliers, vertical line in the box is median

#or
box <- ggplot(titanic, aes(y=Age, x = Survived))
box + geom_boxplot() + geom_jitter(width = 0.2, aes(color=Sex), alpha=0.5)
  labs(title = "Survival Rate on Titanic based on Age and Gender") +
  theme_light()
  
  ## To flip
  box <- ggplot(titanic, aes(y=Age, x = Survived))
  box + geom_boxplot(outlier.colour = "red", outlier.shape = 4) + geom_jitter(width = 0.2, aes(color=Sex)) +
  labs(title = "Survival Rate on Titanic based on Age and Gender") +    theme_classic() + coord_flip()
  
  
  ## Excercise 23- employee data
  #Using the filtered data from Exercise 21, create a box plot showing the salary distribution according to position.
  
  #Set outlier identifiers.
  
  #Add a layer that overlays data points on each position box and have them be colored according to gender.
  
  #Set a title "Salary distribution" and a subtitle "based on position and gender".
  
  #Set the axis labels.
  
  emp <- read.csv("D:\\Study\\R\\WorkingDirectory\\employee-data.csv", stringsAsFactors = F, skip=23)
  emp <- as.tibble(emp)
  emp$gender <- as.factor(emp$gender)
  emp$title <- as.factor(emp$title)
  
  emp.a <- filter(emp, salary > 45000)
emp.a  
boxe <- ggplot(emp.a, aes(x=title, y = salary))  
boxe + geom_boxplot(outlier.colour = "red", outlier.shape = 4) + geom_jitter(aes(color=gender))+ labs(title = "Salary distribution")

## or
library(tidyverse)
library(ggthemes)
#install.packages("wesanderson")
library(wesanderson)


boxx <- ggplot(emp.a, aes(x = title, y = salary))
my.bp <- boxx + geom_boxplot(outlier.color = "orangered1", outlier.shape = 3) +
  geom_jitter(width = 0.3, aes(color = gender)) +
  ggtitle("Salary distribution", subtitle = "based on position and gender") +
  ylab("Salary") + xlab("Job position") + 
  theme_economist_white() + 
  theme(legend.position = "right", axis.text.x = element_text(angle = 90, hjust = 1)) +
  coord_flip() # this can be added if the axis.text.x doesn't make sense to you; it's also easier to read

my.bp

my.bp + scale_color_manual(values=wes_palette(name = "Darjeeling", n = 2))

# or

my.bp + scale_color_brewer(palette="Set1")

# the palette is part of the RColorBrewer package which you should already have on your
# machines because it comes with the tidyverse