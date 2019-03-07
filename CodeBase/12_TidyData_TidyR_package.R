#### tidy data and tidyr package
# Consistently organised data , important in data cleaning

library(tidyverse)

billboard <- read.csv("D:\\Study\\R\\WorkingDirectory\\billboard.csv")
billborad <- as.tibble(billboard)
billboard
head(billboard,2)
## here after date.peaked col, there are many cols x1st.week to x76th.week which contains value and NAs, we 
# want to have a single weak col without NA and their value count in Rank, so basically we need to gather

billboard.a <- billboard %>%
  gather(x1st.week:x76th.week, key = "Week", value="Rank") %>%
  arrange(artist.inverted)

head(billboard.a)
## Multiple variables in a single column

tb <- read.csv("D:\\Study\\R\\WorkingDirectory\\tb.csv")
tb
tb <- as.tibble(tb)
head(tb)

tb.gathered <- tb %>%
  gather(m.014:f.65, key="column" ,value = "Cases" , na.rm = T) %>%
  arrange(country)
tb.gathered

top_n(tb.gathered,n = 10)

# Now seperate column to age and sex

tb.separated <- tb.gathered %>%
  separate(column, into = c("sex", "age"))
tb.separated

#tb.separated <- tb.gathered %>%
 # separate(column, into = c("sex", "age"), sep = ".")

#tb.separated
#install.packages("stringr")
library(stringr)
str_replace_all?
tb.separated$age <- str_replace_all(tb.separated$age,"0","0-")
tb.separated$age <- str_replace_all(tb.separated$age,"15","15-")
tb.separated$age <- str_replace_all(tb.separated$age,"25","25-")
tb.separated$age <- str_replace_all(tb.separated$age,"35","35-")
tb.separated$age <- str_replace_all(tb.separated$age,"45","45-")
tb.separated$age <- str_replace_all(tb.separated$age,"55","55-")
tb.separated$age <- str_replace_all(tb.separated$age,"65","65-100")
tb.separated

## unite function:- a case where one variable is spreaded to two  columns
# here tb.separated age column can be spreaded to age min and age max after splititng by -

tb.separated <- tb.separated %>%
  separate(age,into = c("age.min","age.max"))
tb.separated

#unti age.min and age.max to age range
tb.united <- tb.separated %>%
  unite("age-range", c("age.min","age.max"),sep = "-")
tb.united

### Weather data
weather <- read.csv("D:\\Study\\R\\WorkingDirectory\\weather.csv")
weather <- as.tibble(weather)
## Here two rows are identical on tmax and tmin
weather

## now spread element column
weather.spread <- spread(weather, key = "element", value=value)
weather.spread

### Excercise-- tide data from untidy data
weather <- read.csv("D:\\Study\\R\\WorkingDirectory\\weather-untidy.csv", stringsAsFactors = F)
weather <- as.tibble(weather)
weather
weather.a <- gather(weather,key = "day", value = "value", na.rm = T, d1:d31)
weather.a
weather.b <- weather.a %>% mutate(day = parse_number(day)) %>%
  select(id, year, month, day, element, value) %>%
  arrange(id, year, month, day)
weather.b

parse_number("dff12f2")
## parse_number extracts the first continous digit
weather.c <- spread(weather.b ,key = element, value=value)
weather.c


## tidying the tb data
tb <- read.csv("D:\\Study\\R\\WorkingDirectory\\tb-untidy.csv", stringsAsFactors = F)
tb
tb <- as.tibble(tb)
tb
tb.a <- tb %>%
  gather(m04:f65, key = "column", value = "cases", na.rm = T) %>%
  arrange(country)
tb.a
tb.b <- separate(tb.a,col = column, into  = c("sex", "age"))
tb.b

###
tb <- read.csv("D:\\Study\\R\\WorkingDirectory\\tb-untidy.csv", stringsAsFactors = FALSE)
tb <- as.tibble(tb)
tb
names(tb)
names(tb) <- str_replace(names(tb), "new_sp_", "")
names(tb) <- str_replace(names(tb), "m", "m.")
names(tb) <- str_replace(names(tb), "f", "f.")
tb
tb$m.04 <- NULL
tb
tb$m.514 <- NULL
tb$f.04 <- NULL
tb$f.514 <- NULL
tb$m.u <- NULL 
tb$f.u <- NULL
tb
tb.a <- tb %>% gather(m.014:f.65, key = "column", value = "cases", na.rm = TRUE) %>% arrange(country)
tb.b <- tb.a %>% separate(column, into = c("sex", "age"))
tb.b

