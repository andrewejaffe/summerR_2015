## ----loadData, comment="", prompt=TRUE, echo=FALSE, cache=TRUE-----------
set.seed(123)
Sal <- read.csv("../data/Baltimore_City_Employee_Salaries_FY2014.csv",as.is=TRUE)
mon <- read.csv("../data/Monuments.csv",as.is=TRUE,na.strings="")
circ <- read.csv("../data/charmcitycirc_reduced.csv",as.is=TRUE)
xx=runif(1)

## ----makeList, comment="", prompt=TRUE-----------------------------------
mylist <- list(letters=c("A", "b", "c"), 
        numbers=1:3, matrix(1:25, ncol=5))

## ----Lists, comment="", prompt=TRUE--------------------------------------
head(mylist)

## ----Listsref1, comment="", prompt=TRUE----------------------------------
mylist[1] # returns a list
mylist["letters"] # returns a list

## ----Listsrefvec, comment="", prompt=TRUE--------------------------------
mylist[[1]] # returns the vector 'letters'
mylist$letters # returns vector
mylist[["letters"]] # returns the vector 'letters'

## ----Listsref2, comment="", prompt=TRUE----------------------------------
mylist[1:2] # returns a list

## ----Listsref3, comment="", prompt=TRUE----------------------------------
mylist$letters[1]
mylist[[2]][1]
mylist[[3]][1:2,1:2]

## ----split1, comment="", prompt=TRUE-------------------------------------
dayList = split(circ,circ$day)

## ----lapply1, comment="", prompt=TRUE------------------------------------
# head(dayList)
lapply(dayList, head, n=2)

## ----lapply2, comment="", prompt=TRUE------------------------------------
# head(dayList)
lapply(dayList, dim)

## ----return2, comment="",prompt=TRUE-------------------------------------
return2 = function(x) {
  return(x[2])
}
return2(c(1,4,5,76))

## ----return2a, comment="",prompt=TRUE------------------------------------
return2a = function(x) {
  x[2]
}
return2a(c(1,4,5,76))

## ----return2b, comment="",prompt=TRUE------------------------------------
return2b = function(x) x[2]
return2b(c(1,4,5,76))

## ----return2c, comment="",prompt=TRUE------------------------------------
return2c = function(x,n) x[n]
return2c(c(1,4,5,76), 3)

## ----sqdif, comment="",prompt=TRUE---------------------------------------
sqdif <- function(x=2,y=3){
     (x-y)^2
}

sqdif()
sqdif(x=10,y=5)
sqdif(10,5)

## ----top, comment="",prompt=TRUE-----------------------------------------
top = function(mat,n=5) mat[1:n,1:n]
my.mat = matrix(1:1000,nr=100) 
top(my.mat) #note that we are using the default value for n 

## ----top2, comment="",prompt=TRUE----------------------------------------
lapply(dayList, top, n = 2)

## ----top3, comment="",prompt=TRUE----------------------------------------
lapply(dayList, function(x) x[1:2,1:2])

## ----sapply1, comment="", prompt=TRUE------------------------------------
sapply(dayList, dim)
sapply(circ, class)

## ----sapply2, comment="", prompt=TRUE------------------------------------
myList = list(a=1:10, b=c(2,4,5), c = c("a","b","c"),
                d = factor(c("boy","girl","girl")))
tmp = lapply(myList,function(x) x[1])
tmp
sapply(tmp, class)

## ----sapply3, comment="", prompt=TRUE------------------------------------
sapply(myList,function(x) x[1])
sapply(myList,function(x) as.character(x[1]))

