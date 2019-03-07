#Indexing of vector
deck <- c("a","b","c","d","f")
n.deck <- c(6,7,8,9,10)

#filter by index
print(deck[2])
print(deck[-2]) #return all except 2nd index value
print(deck[c(2,3,4)]) #return multiple values


#indexing by name

names(n.deck) <- deck
print(n.deck)
print(deck)
print(n.deck["b"])
print(n.deck[2])
print(n.deck[c("b","c")])


              #Slicing
n.deck[2:4]
deck[2:4]
lv <- seq(10,100,10)
print(lv)
print(lv[4:7])

#take all except that slicing range
print(lv[-(4:7)])
print(lv[lv > 30])

#practice
# Extract the following values from the atk object:
#   
#   The 6-th value (can you do it in more than one way)
# All the values but the 2nd one
# Values 1, 3, 5, 7, and 9
# All the values but the 4th, 5th, and 6th
# All the values larger than 2000

atk <- c("a","b","c","d","e","f","g","h","i","j")
print(atk[6])
n.atk <- 1:10
names(n.atk) <- atk
print(n.atk["f"])
print(atk)
print(n.atk)
print(atk[-2])
print(atk[c(1,3,5,7,9)])
print(atk[-c(2,3)])
print(atk[atk>"d"])
