
###### categorical variable and factors

marital.status <- c("Married","Married","Single","Married","Divorced","Widowed","Divorced")

?str()  #### display the structure of the object

str(marital.status)
typeof(marital.status)
##### factor and levels

marital.factor <- factor(marital.status)

marital.factor

str(marital.factor)
typeof(marital.factor)
  
### explicit level/order

new.factor <- factor(marital.status, levels = c("Single","Married","Divorced","Widowed"))

new.factor
str(new.factor)

#### rename levels
labels(new.factor) <- c("S","M","D","W")
str(new.factor)
new.factor

### in one line

new.factor <- factor(marital.status, levels = c("Single","Married","Divorced","Widowed"),
                     labels = c("S","M","D","W"))
str(new.factor)

#### order the factor- ordinal
new.factor <- factor(marital.status, levels = c("Single","Married","Divorced","Widowed"),
                     labels = c("S","M","D","W"), ordered = T)
str(new.factor)
