                            # vector arithematic
vec <- c(1,2,3)
vic <- c(11,12,13)
 print(vec+vic)
 print(vec - vic)
print(vec * vic)
print(sum(vec))
print(prod(vec))
 
                        # vector recycling  

weight <- c(71, 67, 83, 67)
height <- c(1.75, 1.81, 1.78, 1.82, 1.97, 2.12, 2.75)

bmi <- weight/height
print(bmi)
testno <- c(1,2)
print(weight+testno)


          # vector names and attributes
age <- c(12,34,54,23)
names(age)
attributes(age)

names(age) <- c("a","b","c","d")

print (age)
print(names(age))
print(attributes(age))


#example
my.vic <- 1:3
a <- c("a","b","c")
names(a) <- my.vic
print(a)
?sample
print(sample(1:10, 7,replace = F))
