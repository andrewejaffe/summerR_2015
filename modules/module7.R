<<<<<<< HEAD
## ----colMeans------------------------------------------------------------
=======
## ----colMeans, prompt=TRUE,comment=""------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
circ2 = read.csv("../data/charmcitycirc_reduced.csv", 
            header=TRUE,as.is=TRUE)
colMeans(circ2[,3:6],na.rm=TRUE)
head(rowMeans(circ2[,3:6],na.rm=TRUE))

<<<<<<< HEAD
## ----summary1------------------------------------------------------------
summary(circ2)

## ----apply1--------------------------------------------------------------
=======
## ----summary1, prompt=TRUE,comment=""------------------------------------
summary(circ2)

## ----apply1, prompt=TRUE,comment=""--------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
tmp = circ2[,3:6]
apply(tmp,2,mean,na.rm=TRUE) # column means
apply(tmp,2,sd,na.rm=TRUE) # columns sds
apply(tmp,2,max,na.rm=TRUE) # column maxs

<<<<<<< HEAD
## ----tapply1-------------------------------------------------------------
tapply(circ2$daily, circ2$day, max, na.rm=TRUE)

## ----scatter1------------------------------------------------------------
data(cars)
plot(cars$speed, cars$dist)

## ----hist1---------------------------------------------------------------
hist(circ2$daily)

## ----dens1,fig.width=5,fig.height=5--------------------------------------
## plot(density(circ2$daily))
plot(density(circ2$daily,na.rm=TRUE))

## ----box1----------------------------------------------------------------
boxplot(circ2$daily ~ circ2$day)

## ----box2----------------------------------------------------------------
boxplot(daily ~ day, data=circ2)

## ----matplot1------------------------------------------------------------
=======
## ----tapply1, comment="",prompt=TRUE-------------------------------------
tapply(circ2$daily, circ2$day, max, na.rm=TRUE)

## ----scatter1, comment="",prompt=TRUE------------------------------------
data(cars)
plot(cars$speed, cars$dist)

## ----hist1, comment="",prompt=TRUE---------------------------------------
hist(circ2$daily)

## ----dens1, comment="",prompt=TRUE,fig.width=5,fig.height=5--------------
## plot(density(circ2$daily))
plot(density(circ2$daily,na.rm=TRUE))

## ----box1, comment="",prompt=TRUE----------------------------------------
boxplot(circ2$daily ~ circ2$day)

## ----box2, comment="",prompt=TRUE----------------------------------------
boxplot(daily ~ day, data=circ2)

## ----matplot1, comment="",prompt=TRUE------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
matplot(circ2[,3:6])

