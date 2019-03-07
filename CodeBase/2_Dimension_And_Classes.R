                  #Dimesion and Classes in Vector
a <- seq(10,120, by =10)
print(typeof(a))
class(a)
dim(a) <- c(3,4)
 print(a)
 print(typeof(a))
 class(a)
            #classes
 b <- seq(10,120, by =10)
 print(typeof(b))
 print(class(b))
 dim(b) <- c(3,4)
 print(b)
 print(typeof(b))
 print(class(b))

 
            #excercise
 # Create a vector s that stores the number sequence 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30. Use the seq() command to do that.
 # 
 # Check the attributes of s.
 # 
 # Does it have any dimensions?
 #   
 #   Give it dimensions. Try specifying 3 rows and 5 columns.
 # 
 # What happens if we try to go beyond the traditional height and width properties and specify a value for depth, too. Let's create a hypercube that has 1 row, 3 columns and 5 "slices".
 # 
 # Try assigning the following dimensions to s: 1, 3, 5.
 
 atk <- seq(2, 30, by = 2)
print(attributes(atk)) 
dim(atk) <- c(3,5)
print(atk)

dim(atk) <- c(1,3,5)

print(atk)
