## ----readCSV-------------------------------------------------------------
read.csv

## ----readCSV2, comment=""------------------------------------------------
mon = read.csv("../data/Monuments.csv",header=TRUE,as.is=TRUE)
head(mon)

## ----subset5, comment="", prompt=TRUE------------------------------------
colnames(mon)
head(mon$zipCode)
head(mon$neighborhood)

## ----workingDirectory, comment="", prompt=TRUE,eval=FALSE----------------
## get the working directory
getwd()
# setwd("~/Dropbox/summerR_2015/Lectures")

## ----directoryNav, comment="", prompt=TRUE-------------------------------
dir("./") # shows directory contents
dir("..")

## ----readCSV3, comment="", prompt=TRUE-----------------------------------
class(mon)
str(mon)

## ----names1, comment="", prompt=TRUE-------------------------------------
names(mon)[1] = "Name"
names(mon)
names(mon)[1] = "name"
names(mon)

## ----logical1, comment="", prompt=TRUE-----------------------------------
z = c(TRUE,FALSE,TRUE,FALSE)
class(z)
sum(z) # number of TRUEs

## ----logical2, comment="", prompt=TRUE-----------------------------------
z2 = c("TRUE","FALSE","TRUE","FALSE")
class(z2)
# sum(z2)
identical(z,z2)

## ----logical3, comment="", prompt=TRUE-----------------------------------
x = 1:6
x > 4
x == 3

## ----logical4, comment="", prompt=TRUE-----------------------------------
Index = (mon$zipCode == 21202)
sum(Index)
table(Index)
mon2 = mon[Index,] 

## ----logical5, comment="", prompt=TRUE-----------------------------------
dim(mon2)
head(mon2)

## ----which, comment="", prompt=TRUE--------------------------------------
mon$Location.1 != ""
which(mon$Location.1 != "")

