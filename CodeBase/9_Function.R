#Custom function
flip <- function(){
  coin <- c("heads", "tails")
  throw <- sample(coin, size =10,replace = T)
  
  print(throw)
}
flip()

# flip coin 10 times with 70 % tails probability
flip <- function(){
  coin <- c("heads", "tails")
  throw <- sample(coin, size =10, prob = c(.3,.7), replace = T)
  
  print(throw)
}
flip()

# example for factorial

# take input from the user

### example



# argumented
factorial1 <- function(num=0) {
  if(typeof(num) != "double"){
    print("Enter integer value")
    return
  }
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
typeof(5)
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


### example

f <- function(x) {
  f <- function(x) {
    f <- function(x) {
      x ^ 2
    }
    f(x) + 1
  }
  f(x) * 2
}

f(10)
