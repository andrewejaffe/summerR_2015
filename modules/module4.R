## ----readCSV-------------------------------------------------------------
read.csv

## ----readCSV2------------------------------------------------------------
mon = read.csv("../data/Monuments.csv",header=TRUE,as.is=TRUE)
head(mon)

## ----subset5-------------------------------------------------------------
colnames(mon)
head(mon$zipCode)
head(mon$neighborhood)

## ----workingDirectory,eval=FALSE-----------------------------------------
## ## get the working directory
## getwd()
## # setwd("~/Dropbox/summerR_2015/Lectures")

## ----directoryNav--------------------------------------------------------
dir("./") # shows directory contents
dir("..")

## ----readCSV3------------------------------------------------------------
class(mon)
str(mon)

## ----names1--------------------------------------------------------------
names(mon)[1] = "Name"
names(mon)
names(mon)[1] = "name"
names(mon)

## ----logical1------------------------------------------------------------
z = c(TRUE,FALSE,TRUE,FALSE)
class(z)
sum(z) # number of TRUEs

## ----logical2------------------------------------------------------------
z2 = c("TRUE","FALSE","TRUE","FALSE")
class(z2)
# sum(z2)
identical(z,z2)

## ----logical3------------------------------------------------------------
x = 1:6
x > 4
x == 3

## ----logical4------------------------------------------------------------
Index = (mon$zipCode == 21202)
sum(Index)
table(Index)
mon2 = mon[Index,] 

## ----logical5------------------------------------------------------------
dim(mon2)
head(mon2)

## ----which---------------------------------------------------------------
mon$Location.1 != ""
which(mon$Location.1 != "")

