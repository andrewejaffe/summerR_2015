## ----sortVorder----------------------------------------------------------
x = c(1,4,7,6,4,12,9,3)
sort(x)
order(x)

## ----sortVorder1---------------------------------------------------------
circ = read.csv("../data/charmcitycirc_reduced.csv", header=TRUE,as.is=TRUE)
circ2 = circ[,c("day","date", "orangeAverage","purpleAverage",
              "greenAverage","bannerAverage","daily")]
head(order(circ2$daily,decreasing=TRUE))
head(sort(circ2$daily,decreasing=TRUE))

## ----sortVorder2---------------------------------------------------------
circSorted = circ2[order(circ2$daily,decreasing=TRUE),]
circSorted[1:5,]

## ----sortVorder3---------------------------------------------------------
rownames(circSorted)=NULL
circSorted[1:5,]

## ----rep1----------------------------------------------------------------
bg = rep(c("boy","girl"),each=50)
head(bg)
bg2 = rep(c("boy","girl"),times=50)
head(bg2)
length(bg)==length(bg2)

## ----ifelse1-------------------------------------------------------------
hi_rider = ifelse(circ$daily > 10000, 1, 0)
head(hi_rider)
table(hi_rider)

## ----ifelse2-------------------------------------------------------------
riderLevels = ifelse(circ$daily < 10000, "low", 
                  ifelse(circ$daily > 20000,
                  "high", "med"))
head(riderLevels)
table(riderLevels)

## ----factor1-------------------------------------------------------------
cc = factor(c("case","case","case",
        "control","control","control"))
cc
levels(cc) = c("control","case")
cc

## ----factor2-------------------------------------------------------------
factor(c("case","case","case","control",
          "control","control"), 
        levels =c("control","case") )
factor(c("case","case","case","control",
            "control","control"), 
        levels =c("control","case"), ordered=TRUE)

## ----factor3-------------------------------------------------------------
x = factor(c("case","case","case","control",
      "control","control"),
        levels =c("control","case") )
as.character(x)
as.numeric(x)

## ----cut1----------------------------------------------------------------
x = 1:100
cx = cut(x, breaks=c(0,10,25,50,100))
head(cx)  
table(cx)

## ----cut2----------------------------------------------------------------
cx = cut(x, breaks=c(0,10,25,50,100), labels=FALSE)
head(cx)  
table(cx)

## ----cut3----------------------------------------------------------------
cx = cut(x, breaks=c(10,25,50), labels=FALSE)
head(cx)  
table(cx)
table(cx,useNA="ifany")

## ----addingVar-----------------------------------------------------------
circ2$riderLevels = cut(circ2$daily, 
      breaks = c(0,10000,20000,100000))
circ2[1:2,]
table(circ2$riderLevels, useNA="always")

## ----mat1----------------------------------------------------------------
m1 = matrix(1:9, nrow = 3, 
      ncol = 3, byrow = FALSE)
m1
m2 = matrix(1:9, nrow = 3, 
      ncol = 3, byrow = TRUE)
m2

## ----mat2----------------------------------------------------------------
cbind(m1,m2)

## ----mat3----------------------------------------------------------------
rbind(m1,m2)

## ----cbind---------------------------------------------------------------
circ2$riderLevels = NULL
rider = cut(circ2$daily, breaks = c(0,10000,20000,100000))
circ2 = cbind(circ2,rider)
circ2[1:2,]

