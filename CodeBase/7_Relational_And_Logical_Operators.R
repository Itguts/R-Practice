### Relational operators
##  ==, !=, <, >, <=, >= ##
3==3

"one" == "one"
"one" == "ONE"

TRUE == TRUE
TRUE == T

TRUE > FALSE
"rat" > "cat"


# logical operators
## & | !  ##

FALSE & FALSE

!TRUE

## logical operator on vectors

v <- c(1,3,5,7)
w <- c(1,2,3,4)

3== v
3 == w

w == v

v >= w
w >= v


s <- c(5,1,2,5)
(s > 4) & (s > 2)
(s < 4) && (s > 2)

#&- logical operator
# &&- It checks first element
