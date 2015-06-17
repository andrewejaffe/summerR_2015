## ----assign_help---------------------------------------------------------
## ?str
## help("str")

## ----numChar-------------------------------------------------------------
class(c("Andrew", "Jaffe"))
class(c(1, 4, 7))

## ----seq-----------------------------------------------------------------
x = seq(from = 1, to = 5) # seq() is a function
x
class(x)

## ----seqShort------------------------------------------------------------
1:5

## ----factor1-------------------------------------------------------------
x = factor(c("boy", "girl", "girl", "boy", "girl"))
x 
class(x)

## ----logical1------------------------------------------------------------
x = c(TRUE, FALSE, TRUE, TRUE, FALSE)
class(x)

## ----logical2------------------------------------------------------------
z = c("TRUE", "FALSE", "TRUE", "FALSE")
class(z)

## ----head----------------------------------------------------------------
z = 1:100 # recall a sequence from 1 to 100
head(z)
tail(z)
str(z)

## ----tab-----------------------------------------------------------------
x = c("boy", "girl", "girl", "boy", "girl")
table(x)
y = c(1, 2, 1, 2, 1)
table(x,y)

## ----subset1-------------------------------------------------------------
x1 = 10:20
x1
length(x1)

## ----subset2-------------------------------------------------------------
x1[1] # selecting first element
x1[3:4] # selecting third and fourth elements
x1[c(1, 5, 7)] # first, fifth, and seventh elements

## ----matrix--------------------------------------------------------------
n = 1:9 # sequence from first number to second number incrementing by 1
n
mat = matrix(n, nrow = 3)
mat

## ----subset3-------------------------------------------------------------
mat[1, 1] # individual entry: row 1, column 1
mat[1, ] # first row
mat[, 1] # first columns

## ----subset4-------------------------------------------------------------
class(mat[1, ])
class(mat[, 1])

## ----df1-----------------------------------------------------------------
data(iris) ## just use some data in R already
names(iris) ## get the column names
str(iris) # easy snapshot of data, like `describe` in Stata
head(iris, 3) # get top 3 rows

## ----df2-----------------------------------------------------------------
head(iris$Petal.Length)
class(iris$Petal.Width)

## ----subset6-------------------------------------------------------------
head(iris[, 2])

## ----subset7-------------------------------------------------------------
iris[1:3, c("Sepal.Width", "Species")]

## ----df3-----------------------------------------------------------------
x = c("Andrew", "Leonardo", "Shaun")
y = 1:3
df = data.frame(name = x, id = y)
df

## ----dfAdd---------------------------------------------------------------
iris2 = iris # copy `iris` to a new df
iris2$Index = 1:nrow(iris2)
head(iris2)
names(iris2)

