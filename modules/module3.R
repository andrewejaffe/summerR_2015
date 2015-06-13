## ----assign_help, comment="", prompt=TRUE--------------------------------
## ?str
## help("str")

## ----numChar, comment="", prompt=TRUE------------------------------------
class(c("Andrew", "Jaffe"))
class(c(1, 4, 7))

## ----seq, comment="", prompt=TRUE----------------------------------------
x = seq(from = 1, to = 5) # seq() is a function
x
class(x)

## ----seqShort, comment="", prompt=TRUE-----------------------------------
1:5

## ----factor1, comment="", prompt=TRUE------------------------------------
x = factor(c("boy", "girl", "girl", "boy", "girl"))
x 
class(x)

## ----logical1, comment="", prompt=TRUE-----------------------------------
x = c(TRUE, FALSE, TRUE, TRUE, FALSE)
class(x)

## ----logical2, comment="", prompt=TRUE-----------------------------------
z = c("TRUE", "FALSE", "TRUE", "FALSE")
class(z)

## ----head, comment="",prompt=TRUE----------------------------------------
z = 1:100 # recall a sequence from 1 to 100
head(z)
tail(z)
str(z)

## ----tab, comment="",prompt=TRUE-----------------------------------------
x = c("boy", "girl", "girl", "boy", "girl")
table(x)
y = c(1, 2, 1, 2, 1)
table(x,y)

## ----subset1, comment="",prompt=TRUE-------------------------------------
x1 = 10:20
x1
length(x1)

## ----subset2, comment="",prompt=TRUE-------------------------------------
x1[1] # selecting first element
x1[3:4] # selecting third and fourth elements
x1[c(1, 5, 7)] # selecting first, fifth, and seventh elements

## ----matrix, comment="", prompt=TRUE-------------------------------------
n = 1:9 # sequence from first number to second number incrementing by 1
n
mat = matrix(n, nrow = 3)
mat

## ----subset3, comment="", prompt=TRUE------------------------------------
mat[1, 1] # individual entry: row 1, column 1
mat[1, ] # first row
mat[, 1] # first columns

## ----subset4, comment="", prompt=TRUE------------------------------------
class(mat[1, ])
class(mat[, 1])

## ----df1, comment="", prompt=TRUE----------------------------------------
data(iris) ## just use some data in R already
names(iris) ## get the column names
str(iris) # easy snapshot of data, like `describe` in Stata
head(iris, 3) # get top 3 rows

## ----df2, comment="", prompt=TRUE----------------------------------------
head(iris$Petal.Length)
class(iris$Petal.Width)

## ----subset6, comment="", prompt=TRUE------------------------------------
head(iris[, 2])

## ----subset7, comment="", prompt=TRUE------------------------------------
iris[1:3, c("Sepal.Width", "Species")]

## ----df3, comment="", prompt=TRUE----------------------------------------
x = c("Andrew", "Leonardo", "Shaun")
y = 1:3
df = data.frame(name = x, id = y)
df

## ----dfAdd, comment="", prompt=TRUE--------------------------------------
iris2 = iris # copy `iris` to a new df
iris2$Index = 1:nrow(iris2)
head(iris2)
names(iris2)

