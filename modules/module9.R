## ----knit-setup, echo=FALSE, results='hide'------------------------------
library(knitr)
opts_chunk$set(echo=TRUE, message=FALSE, warning=FALSE,
               comment = "", dev="pdf")

## ----seed,echo=FALSE,results='hide'--------------------------------------
set.seed(3) 

## ----plotEx--------------------------------------------------------------
death = read.csv("http://biostat.jhsph.edu/~ajaffe/files/indicatordeadkids35.csv",
                 as.is=TRUE,header=TRUE, row.names=1)
death[1:2, 1:5]

## ------------------------------------------------------------------------
year = as.integer(gsub("X","",names(death)))
head(year)

## ----plot1, fig.width=4,fig.height=4-------------------------------------
plot(as.numeric(death["Sweden",])~year)

## ----plotEx2, fig.width=4,fig.height=4-----------------------------------
plot(as.numeric(death["Sweden",])~year,
      ylab="# of deaths per family", main = "Sweden")

## ----plotEx3, fig.width=4,fig.height=4-----------------------------------
plot(as.numeric(death["Sweden",])~year,
      ylab="# of deaths per family", main = "Sweden",
     xlim = c(1760,2012), pch = 19, cex=1.2,col="blue")

## ----plotEx4, fig.width=4,fig.height=4-----------------------------------
scatter.smooth(as.numeric(death["Sweden",])~year,span=0.2,
      ylab="# of deaths per family", main = "Sweden",lwd=3,
     xlim = c(1760,2012), pch = 19, cex=0.9,col="grey")

## ----plotEx5, fig.width=8,fig.height=4-----------------------------------
par(mfrow=c(1,2))
scatter.smooth(as.numeric(death["Sweden",])~year,span=0.2,
      ylab="# of deaths per family", main = "Sweden",lwd=3,
     xlim = c(1760,2012), pch = 19, cex=0.9,col="grey")
scatter.smooth(as.numeric(death["United Kingdom",])~year,span=0.2,
      ylab="# of deaths per family", main = "United Kingdom",lwd=3,
     xlim = c(1760,2012), pch = 19, cex=0.9,col="grey")

## ----plotEx6, fig.width=8,fig.height=4-----------------------------------
par(mfrow=c(1,2))
yl = range(death[c("Sweden","United Kingdom"),])
scatter.smooth(as.numeric(death["Sweden",])~year,span=0.2,ylim=yl,
      ylab="# of deaths per family", main = "Sweden",lwd=3,
     xlim = c(1760,2012), pch = 19, cex=0.9,col="grey")
scatter.smooth(as.numeric(death["United Kingdom",])~year,span=0.2,
      ylab="", main = "United Kingdom",lwd=3,ylim=yl,
     xlim = c(1760,2012), pch = 19, cex=0.9,col="grey")

## ----barplot2, fig.width=4,fig.height=4----------------------------------
## Stacked Bar Charts
cars = read.csv("http://biostat.jhsph.edu/~ajaffe/files/kaggleCarAuction.csv",
                as.is=TRUE)
counts <- table(cars$IsBadBuy, cars$VehicleAge)
barplot(counts, main="Car Distribution by Age and Status",
  xlab="Vehicle Age", col=c("darkblue","red"),
    legend = rownames(counts))

## ----barplot2a, fig.width=4,fig.height=4---------------------------------
## Use percentages (column percentages)
barplot(prop.table(counts, 2), 
    main="Car Distribution by Age and Status",
  xlab="Vehicle Age", col=c("darkblue","red"),
    legend = rownames(counts))

## ----barplot3, fig.width=4,fig.height=4----------------------------------
# Stacked Bar Plot with Colors and Legend    
barplot(counts, main="Car Distribution by Age and Status",
  xlab="Vehicle Age", col=c("darkblue","red"),
    legend = rownames(counts), beside=TRUE)

## ----boxplots, fig.width=4,fig.height=4----------------------------------
boxplot(weight ~ Diet, data=ChickWeight, outline=FALSE)
points(ChickWeight$weight ~ jitter(as.numeric(ChickWeight$Diet),0.5))

## ----box_ex, eval=FALSE--------------------------------------------------
## boxplot(weight ~ Diet, data=ChickWeight, outline=FALSE)

## ----geoboxplot, fig.width=4,fig.height=4--------------------------------
library(ggplot2)
qplot(factor(Diet), y= weight, data = ChickWeight, geom = "boxplot")

## ----geoboxpoint, fig.width=4,fig.height=4-------------------------------
qplot(factor(Diet), y= weight, data = ChickWeight, geom = c("boxplot", "point"),
      position = c('identity', "jitter"))

## ----hist, fig.width=4,fig.height=4--------------------------------------
hist(ChickWeight$weight, breaks=20)

## ----ghist, fig.width=4,fig.height=4-------------------------------------
qplot(x= weight, fill = Diet, data = ChickWeight, geom = c("histogram"))


## ----ghist_alpha, fig.width=4,fig.height=4-------------------------------
qplot(x= weight, fill = Diet, data = ChickWeight,
      geom = c("histogram"), alpha=I(.7))

## ----gdens, fig.width=4,fig.height=4-------------------------------------
qplot(x= weight, fill = Diet, data = ChickWeight, 
      geom = c("density"), alpha=I(.7))

## ----gdens_alpha, fig.width=4,fig.height=4-------------------------------
qplot(x= weight, colour = Diet, data = ChickWeight, geom = c("density"), alpha=I(.7))

## ----gdens_line_alpha, fig.width=4,fig.height=4--------------------------
qplot(x= weight,  colour = Diet, data = ChickWeight, 
      geom = c("line"), stat="density")

## ----spaghetti, fig.width=4,fig.height=4---------------------------------
qplot(x=Time, y=weight, colour = Chick, 
      data = ChickWeight, geom = "line")

## ----fac_spag, fig.width=4,fig.height=4----------------------------------
qplot(x=Time, y=weight, colour = Chick, 
      facets = ~ Diet, 
      data = ChickWeight, geom = "line")

## ----fac_spag_noleg, fig.width=4,fig.height=4----------------------------
qplot(x=Time, y=weight, colour = Chick, 
      facets = ~ Diet, 
      data = ChickWeight, geom = "line") +  
          guides(colour=FALSE)

## ----pal, fig.width=4,fig.height=4---------------------------------------
palette("default")
plot(1:8, 1:8, type="n")
text(1:8, 1:8, lab = palette(), col = 1:8)

## ----pal2, fig.width=4,fig.height=4--------------------------------------
palette(c("darkred","orange","blue"))
plot(1:3,1:3,col=1:3,pch =19,cex=2)

## ----pal3, fig.width=4,fig.height=4--------------------------------------
palette("default")
plot(weight ~ Time, data= ChickWeight, 
     pch = 19, col = Diet)

## ----pal4, fig.width=4,fig.height=4--------------------------------------
library(RColorBrewer)
palette(brewer.pal(5,"Dark2"))
plot(weight ~ Time, data=ChickWeight, 
     pch = 19,  col = Diet)

## ----pal5, fig.width=4,fig.height=4--------------------------------------
library(RColorBrewer)
palette(brewer.pal(5,"Dark2"))
plot(weight ~ jitter(Time,amount=0.2),
     data=ChickWeight,
     pch = 19,  col = Diet,xlab="Time")

## ----leg1, fig.width=4,fig.height=4--------------------------------------
palette(brewer.pal(5,"Dark2"))
plot(weight ~ jitter(Time,amount=0.2),
     data=ChickWeight,
     pch = 19,  col = Diet,xlab="Time")
legend("topleft", paste("Diet",
        levels(ChickWeight$Diet)), 
    col = 1:length(levels(ChickWeight$Diet)),
    lwd = 3, ncol = 2)

## ----circ, fig.width=4.5,fig.height=4.5----------------------------------
load("../data/charmcirc.rda")
palette(brewer.pal(7,"Dark2"))
dd = factor(circ$day)
plot(orangeAverage ~ greenAverage,data=circ, 
     pch=19, col = as.numeric(dd))
legend("bottomright", levels(dd), col=1:length(dd), pch = 19)

## ----circ2, fig.width=4.5,fig.height=4.5---------------------------------
dd = factor(circ$day, levels=c("Monday","Tuesday","Wednesday","Thursday",
                              "Friday","Saturday","Sunday"))
plot(orangeAverage ~ greenAverage, data=circ,
     pch=19, col = as.numeric(dd))
legend("bottomright", levels(dd), col=1:length(dd), pch = 19)

## ----lattice1, fig.width=4,fig.height=4----------------------------------
library(lattice)
xyplot(weight ~ Time | Diet, data = ChickWeight)

## ----lattice2, fig.width=4,fig.height=4----------------------------------
densityplot(~weight | Diet, data = ChickWeight)

## ----levelplot1, fig.width=4,fig.height=4--------------------------------
rownames(circ2) = circ2$date
mat = as.matrix(circ2[975:nrow(circ2),3:6])
levelplot(t(mat), aspect = "fill")

## ----levelplot2, fig.width=4,fig.height=4--------------------------------
library(RColorBrewer)
theSeq = seq(0,max(mat,na.rm=TRUE), by=50)
my.col = colorRampPalette(brewer.pal(
  5,"Greens"))(length(theSeq))
levelplot(t(mat), aspect = "fill",at = theSeq,
    col.regions = my.col,xlab="Route",ylab="Date")

## ----levelplot3, fig.width=8,fig.height=4--------------------------------
tmp=death[grep("s$", rownames(death)), 200:251]
yr = gsub("X","",names(tmp))
theSeq = seq(0,max(tmp,na.rm=TRUE), by=0.05)
my.col <- colorRampPalette(brewer.pal(5,"Reds"))(length(theSeq))
levelplot(t(tmp), aspect = "fill",at = theSeq,col.regions = my.col,
           scales=list(x=list(label=yr, rot=90, cex=0.7)))

