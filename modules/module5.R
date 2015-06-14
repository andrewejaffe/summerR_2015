## ----writecsv, comment="",prompt=TRUE------------------------------------
circ = read.csv("../data/Charm_City_Circulator_Ridership.csv", header=TRUE,as.is=TRUE)
circ2 = circ[,c("day","date", "orangeAverage","purpleAverage","greenAverage",
                "bannerAverage","daily")]
write.csv(circ2, file="../data/charmcitycirc_reduced.csv", row.names=FALSE)

## ----xlsx1, comment="",prompt=TRUE,eval=FALSE----------------------------
install.packages("xlsx") # OR:
install.packages("xlsx",
    repos="http://cran.us.r-project.org")
library(xlsx) # or require(xlsx)

## ----save1, comment="",prompt=TRUE---------------------------------------
save(circ,circ2,file="../data/charmcirc.rda")

## ----ls, comment="",prompt=TRUE------------------------------------------
ls()

## ----loadData, comment="",prompt=TRUE------------------------------------
tmp=load("../data/charmcirc.rda")
tmp
ls()

## ----negativeIndex, comment="",prompt=TRUE-------------------------------
x = c(1,3,77,54,23,7,76,5)
x[1:3] # first 3
x[-2] # all but the second

## ----negativeIndex2, comment="",prompt=TRUE------------------------------
x[-c(1,2,3)] # drop first 3
# x[-1:3] # shorthand. R sees as -1 to 3
x[-(1:3)] # needs parentheses

## ----andEx, comment="",prompt=TRUE---------------------------------------
# which Mondays had more than 3000 average riders?
which(circ$day =="Monday" & circ$daily > 3000)[1:20] 

## ----andEx2, comment="",prompt=TRUE--------------------------------------
Index=which(circ$daily > 10000 & circ$purpleAverage > 3000)
length(Index) # the number of days
head(circ[Index,],2) # first 2 rows

## ----orEx1, comment="",prompt=TRUE---------------------------------------
Index=which(circ$daily > 10000 | circ$purpleAverage > 3000)
length(Index) # the number of days
head(circ[Index,],2) # first 2 rows

## ----naEval, comment="",prompt=TRUE--------------------------------------
circ$purpleAverage[1:10] > 0
which(circ$purpleAverage > 0)[1:10]

## ----inEx, comment="",prompt=TRUE----------------------------------------
(circ$day %in% c("Monday","Tuesday"))[1:20] # select entries that are monday or tuesday
which(circ$day %in% c("Monday","Tuesday"))[1:20] # which indices are true?

## ----colSelect, comment="",prompt=TRUE-----------------------------------
circ[1:3, c("purpleAverage","orangeAverage")]
circ[1:3, c(7,5)]

## ----colRemove, comment="",prompt=TRUE-----------------------------------
tmp = circ2
tmp$daily=NULL
tmp[1:3,]

