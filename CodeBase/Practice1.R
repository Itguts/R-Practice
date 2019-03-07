a <- 1:10
a2 <- c(1,2,3)
typeof(a2)
a3 <- c(1L,2L,3L)
typeof(a3)
char <- c("vikash","kumar","2")
print(char)
char1 <- c("vikas",3)
print(char1)
typeof(char)
atk <- c(300,200,NA,3,NA,37)
print(atk)
typeof(atk)
com <- c(char, atk)
print(com)
typeof(com)
com1 <- c(atk,TRUE)
print(com1)
typeof(com1)
var <- c(T,T,F)
typeof(var)
print(var)
message(var)
cat(var)
var1 <- 10
var2 <- 20
cat("My  objects are %s\n and %s",var1,var2)
#complex and raw
?is.complex
                                        # Function:-
m <- mean(1:10)
print(m)
r <- round(m)
print(r)
print(round(mean(m)))
#example
myNos <- c(8,10,10,1,10,10,8,12,1,12)
sumVal <- sum(myNos)
print(sumVal)
avg <- sum(myNos)/length(myNos)
print(avg)
print(median(myNos))
print(mean(myNos))
print(sd(myNos))

# Know the function argument
args(round)
args(median)
print(median(myNos, na.rm = TRUE))
args(sample)
print(sample(1:100,5))

#Custom function
flip <- function(){
  coin <- c("heads", "tails")
  throw <- sample(coin, size =10,replace = T)

  print(throw)
}
# flip coin 10 times with 70 % tails probability
flip <- function(){
  coin <- c("heads", "tails")
  throw <- sample(coin, size =10, prob = c(.3,.7), replace = T)
  
  print(throw)
}
flip()

# example for factorial

# take input from the user
factorial <- function() {
  num = as.integer(readline(prompt="Enter a number: "))
  factorial = 1
  # check is the number is negative, positive or zero
  if(num < 0) {
    print("Sorry, factorial does not exist for negative numbers")
  } else if(num == 0) {
    print("The factorial of 0 is 1")
  } else {
    for(i in 1:num) {
      factorial = factorial * i
    }
    print(paste("The factorial of", num ,"is",factorial))
  }
}
factorial()

### example



# argumented
factorial1 <- function(num=0) {
  
  factorial = 1
  # check is the number is negative, positive or zero
  if(num < 0) {
    print("Sorry, factorial does not exist for negative numbers")
  } else if(num == 0) {
    print("The factorial of 0 is 1")
  } else {
    for(i in 1:num) {
      factorial = factorial * i
    }
    print(paste("The factorial of", num ,"is",factorial))
  }
}
factorial1()
factorial1(5)
factorial1("a")

## Example pick three random cards

deck <- c("Duke","Assasin","Captian","Ambassador","Contessa")


draw <- function(deck){
  hand <- sample(deck, size = 3, replace = T)
  print(hand)
}
draw(deck)

### Example pick top 3 cards of the deck
deck1 <- matrix(rep(c("Duke","Assasin","Captian","Ambassador","Contessa"),3),ncol = 1)
deck1
draw(deck1)

drawTop3 <- function(deck){
  hand <- deck[1:3]
  print(hand)
}
drawTop3(deck1)
## it is giving exactly same out put all the time, so  need to shuffle before pick
## function constructor

shuffle <- function(deck){
  random <- sample(1:15, size = 15)
  deck.s <- deck1[random, drop = F]
  return (deck.s)
}

drawTop3Final <- function(deck){
  shuffled <- shuffle(deck)

  hand <- shuffled[1:3]
  return (hand)
}

drawTop3Final(deck1)


