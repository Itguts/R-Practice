my.book <- list(Name= "Physics", Author="CV Verma", Published=1948,
                Contents = list(Partone = "About Author",
                                PartTwo = c(1:5),
                                PartThree = c(1:10)))
my.book
str(my.book)

###### getting sublist([]) and element([[]])

#sublist/object

my.book[2]
my.book[4]
my.book[[4]][2]

#element
 my.book[[2]]
 my.book[[4]]
 my.book[[4]][[2]]
 my.book[4][[2]]
 

  