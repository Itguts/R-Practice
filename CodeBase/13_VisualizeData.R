##Visualize data
#Grammar of graphics:- Layers, Aesthetic mappings
#e.g:- The young wizard climbed over the sofa resolutely, and grabbed the letter
# The- Determiner
# Young- Adjective
# Wizard- Noun
# Climbed- Verb
# Over - Preposition
# resolutely - Adverb
# and - Conjunction
# his - Pronoun

#Grammar of Graphics containes:-
#1 Data
#2 Aesthetics:- what u map on x and y axis
#3 Geometries- how ur data will be presented visualy
#4 Facets:- The discrete of plots ur graph can split into
#5 Stats- The statistical transformation u may choose to do  the interpretation of data
#6 Coordinates- where u want to plot ur data and subset of it
#7 Themes- color, fonts


###ggplot2. dplyr
library(tidyverse)
hdi <- read.csv("D:\\Study\\R\\WorkingDirectory\\hdi-cpi.csv", stringsAsFactors = F)
hdi <- as.tibble(hdi)
hdi
sc <- ggplot(hdi)
sc <- ggplot(hdi, aes(CPI.2015, HDI.2015))
sc
sc + geom_point()
#Facets (Breaking up a plot into sub plots based on a discrete varable)
#split data plot bases on redgion

sc + geom_point() + facet_grid(Region ~.)

# apply statitics- (Tranforming and summarizing the data)
sc + geom_point(aes(color = Region), size=3) + facet_grid(Region ~.) + stat_smooth()

# Cooridinates -specifying the dimension of a graph(Zooming in - out)
# eg:-see the only countries in the upper limit of crime index(CPI)
sc + geom_point(aes(color = Region),size = 3) + facet_grid(Region ~.) + stat_smooth() + coord_cartesian(xlim = c(0.75,1))
# observation- leat crime countries are from  western europe groups

#Themes
#ggthemes package
sc + geom_point(aes(color = Region), size=3)  + stat_smooth() + theme_minimal()

