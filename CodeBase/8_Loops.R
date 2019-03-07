### for
ar <- 1:5
ar2 <- vector(length=5)
ar2
for(n in ar)
{
  print(n)
  ar2[n] =n
}
ar2

for( i in 22:43)
{
  print(paste("I is :- ",i))
}

## while
n <- -10
while(n < 0)
{
  print(paste("The no is:- ", n))
  n <- n+1
}

?paste

######### Repeat ##########3

x <- -10
repeat {
  print(paste("No is :- ",x))
  x <- x+1
  if(x >= 0)
  {
    print("Its done")
    break
  }
}