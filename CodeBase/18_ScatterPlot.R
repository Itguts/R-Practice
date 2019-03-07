##### Scatter Plot
# It is the visual representation of relationship between two numerical variable(sales and profit and age and salaey, exp and salary, power and mileage)

#e.g Corruption  index and Human development index

hdi <- read.csv("D:\\Study\\R\\WorkingDirectory\\hdi-cpi.csv")
hdi <- as.tibble(hdi)
hdi

library(tidyverse)
scat <- ggplot(hdi,aes(x=CPI.2015,y=HDI.2015))
scat + geom_point(aes(color=Region)) + theme_light() +
labs(x="Corruption Perception Index,2015", 
       y = "Human Development Index,2015", 
       title="Corruption and Human Development")# + ggtitle("Corruption and Human Development")

### to know the shapes google- ggplot2 shapes
scat + geom_point(aes(color=Region), shape=21, fill = "white", size=3, stroke=2) + theme_light() +
  labs(x="Corruption Perception Index,2015", 
       y = "Human Development Index,2015", 
       title="Corruption and Human Development")# + ggtitle("Corruption and Human Development")
# adding stats

scat + geom_point(aes(color=Region), shape=21, fill = "white", size=3, stroke=2) + theme_light() +
  labs(x="Corruption Perception Index,2015", 
       y = "Human Development Index,2015", 
       title="Corruption and Human Development")+
  stat_density2d()

