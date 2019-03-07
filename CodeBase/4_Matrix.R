                    #Matrix
mtrx <- matrix(1:12, nrow=3)
print(mtrx)
mtrx <- matrix(1:12, ncol=4)
print(mtrx)
 #byrow 
mtrx <- matrix(1:12, ncol=4, byrow=T)
print(mtrx)


#cbind function
usa <- c(1,2,3,4,5,6)
aus <- c(2,4,6,8,10,12)
aus
ngo <- cbind(usa,aus)
ngo

# adding names to the rows
rownames(ngo) <- c('2011',"2012","2013","2014","2015","2016")
ngo

#transposing rows to cols
ngo <- t(ngo)
ngo

#adding object to rows

ind <- c(3,5,7,9,11,13)
ngo <- rbind(ngo,ind)
ngo

#in single line
gdp <- matrix(c(1.5,2,3,4,5,6,7,8,9), nrow=3, byrow=T, 
              dimnames = list(c("aus","usa","ind"),c("2015","2016","2017")))
gdp
print(list(c("aus","usa","ind"),c("2015","2016","2017")))
#excercise
player <- c("dark","light","dark","light")
piece <- c("king","queen","pawn","knight")

final <- cbind(player,piece)
final

              #matricx recycle
expl <- matrix(1:10, nrow=4, ncol=4)
expl

              #Indexing/subsetting
gross <- 1:16
g.mat <- matrix(gross, nrow=8)
g.mat
g.mat[6,2]

g.mat[6]
#entire row
g.mat[6,]
g.mat[,2]

            #slicing matrices
g.mat[c(1,3,5),]
g.mat[,c(1,2)]


            #matrix arithamatic
mat <- matrix(seq(2,24, by =2), nrow=3, ncol =4)
mat

#add
add.mat <- mat+2
add.mat
#sub
sub.mat <- mat-2
sub.mat
#div
div.mat <- mat/2
div.mat

#multiplication
mat1 <- matrix(1:12, nrow=3)
mat1

mat.mul <- mat*mat1
mat.mul

          #Exercise
# Lookup the runif() function. Create a 3x4 matrix with 12 random numbers generated using the runif() function; have the matrix be filled our row-by-row, instead of column-by-column.
# 
# Name the columns of the matrix uno, dos, tres, cuatro, and the rows x, y, z.
# 
# Scale the matrix by 10 and save the result.
# 
# Extract a 2x4 matrix from it and save the result.
# 
# Subtract the smaller matrix from the larger one. Can you do that? Why?
#   
#   Extract a 3x3 matrix from the original matrix and save the result. Try the subtraction again. Can you do that? Why?
#   
#   Extract the column called "uno" as a vector from the original matrix and save the result. Try the subtraction again. Can you do that? Why?
#   
#   Lookup the rnorm() function. Create a new 3x4 matrix with 12 random values generated using the rnorm() function.
# 
# Perform matrix multiplication (using the * sign). Can you do that? How is the operation carried out?
#   
#   Perform inner matrix multiplication with the two matrixes. Can you do that? Why? Can you think of something to do to make this possible

?runif()
runif(20)
runif(12, 2,20)
r.mat <- matrix(runif(12,2,6), nrow=3, ncol=4)
r.mat
colnames(r.mat) <- c("uno","dos","tres","cuatro")
rownames(r.mat) <- c("x","y","z")
r.mat
r.mat.scale <- r.mat+10
r.mat.scale
r.mat.extract <- r.mat[c(1,2),]
r.mat.extract
r.mat - r.mat.extract
r.mat.extract1 <- r.mat[c(1,2,3),c(1,2,3)]
r.mat.extract1
r.mat - r.mat.extract1
r.mat.uno <- r.mat[,1]
r.mat.uno
############################## rnorm ############33
?rnorm()
rnorm.mat <- rnorm(5, 3,2.5)
s1 <- rnorm.mat

mean(s1)
sd(s1)
############### Matrix operation#######33
matrix.mov <- matrix(c(175.5,213,312,198,222,324), nrow=3, byrow = T, 
                     dimnames=list(c("DDLJ","Sholay","Sultan"),c("India","Worldwide")))
matrix.mov

#sum of all the columns
sum <- colSums(matrix.mov)
sum
###row sum
rowSums((matrix.mov))

### avg of row and col
avg <- colMeans(matrix.mov)
rowMeans(matrix.mov)

matrix.prelim <- rbind(matrix.mov, sum, avg)
matrix.prelim


matrix( rnorm(N*M,mean=0,sd=1), N, M) 
rnorm(10)

mat.norm <- matrix(rnorm(12), nrow=3, byrow = T)
runif(12)
mat.runif <- matrix(runif(12),nrow=3, byrow=T)


