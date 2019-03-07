
library((tidyverse))
starwars

star <- starwars
star
View(star)

## filter

a<-filter(star, species == "Droid")
a
?filter
(filter(star, species=="Droid", homeworld =="Tatooine"))
(filter(star, eye_color == "red" | eye_color == "yellow"))

## select

select(star, name, birth_year,homeworld,species,starships)
select(star,name,birth_year,homeworld:starships)
select(star,ends_with("color"))

select(star,name,everything())


### Mutate and transmute
star <- mutate(star, bmi= mass/((height/100)^2))
print(star, name:bmi)
select(star, bmi)


star.tran <- transmute(star, bmi= mass/((height/100)^2))
star.tran

### Arranging, Group by

arrange(star, desc(mass))

summarize(star, avg.height = mean(height, na.rm = T))
summarize(star)

star.species <- group_by(star, species)
star.species

summarize(star.species, avg.height = mean(height, na.rm = T))


### Random data from data frame
#>deplyr

sample_n(star,10)
sample_n(star,10,replace = T)
sample_frac(star,0.1)


#### filter

filter(summarize(group_by(star,species),count = n(), avg.mass = mean(mass, na.rm=T)), count >1)


#### pipe operator

star %>%
  group_by(species) %>%
    summarise(count =n(), avg.mass = mean(mass, na.rm=T)) %>%
      filter(count > 1)

## Excersice

# Requirements: the employees data from Exercise 17.
# 
# Load the employees data and convert it into a tibble. Then, make the gender and title variables into a factor.
# 
# Hint: the commands are analogous to the as.data.frame() function.
# 
# Check if the data has any missing values.
# 
# Arrange the dataset by gender, then last name, and make first_name, last_name, and gender the first three variables in the data frame. Show only the employees whose salary is higher than 70,000.
# 
# Use the ends_with() function with select.
# 
# Create a data frame containing only the employee numbers of those earning more than 70,000.
# 
# Find out how much each position (title) earns on average by gender; create a new variable that represents the average monthly figures and arrange your result by gender and average monthly salary, from largest to smallest.

employee.data <- read.csv("D:\\Study\\R\\WorkingDirectory\\employee-data.csv", skip = 23, stringsAsFactors = FALSE)
employee.data
employee.data <- as.tibble(employee.data)
## tibble is derived from as.data.frame, it does very less work as compared to data frame but good for complaining when 
# a var is missing
employee.data
employee.data$gender <- as.factor(employee.data$gender)
employee.data$title <- as.factor(employee.data$title)


any(is.na(employee.data))


employee.a <- employee.data %>% 
  select(ends_with("name"), gender, everything()) %>%
  filter(salary >= 70000) %>% 
  arrange(gender, last_name)

employee.a

good.earners <- employee.a["emp_no"]
good.earners
employee.b <- employee.data %>% 
  group_by(title, gender) %>% 
  summarise(avg.salary = mean(salary)) %>% 
  mutate(monthly = avg.salary/12) %>% 
  arrange(gender, desc(monthly))

employee.b
