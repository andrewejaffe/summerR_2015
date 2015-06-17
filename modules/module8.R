<<<<<<< HEAD
## ----table---------------------------------------------------------------
=======
## ----table, comment="", prompt=TRUE--------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
table(c(0, 1, 2, 3, NA, 3, 3, 2,2, 3), 
        useNA="ifany")
table(c(0, 1, 2, 3, 2, 3, 3, 2,2, 3), 
        useNA="always")
tab <- table(c(0, 1, 2, 3, 2, 3, 3, 2,2, 3), 
             c(0, 1, 2, 3, 2, 3, 3, 4, 4, 3), 
              useNA="always")
margin.table(tab, 2)

<<<<<<< HEAD
## ----table2--------------------------------------------------------------
prop.table(tab)
prop.table(tab,1)

## ----readSal-------------------------------------------------------------
Sal = read.csv("../data/Baltimore_City_Employee_Salaries_FY2014.csv",
                as.is=TRUE)

## ----isna----------------------------------------------------------------
Sal[1:4,]
any(is.na(Sal$Name))

## ----gender, echo=FALSE--------------------------------------------------
set.seed(4)
gender <- sample(c("Male", "mAle", "MaLe", "M", "MALE", "Ma", "FeMAle", "F", "Woman", "Man", "Fm", "FEMALE"), 1000, replace =TRUE)

## ----gentab--------------------------------------------------------------
table(gender)

## ----RawlMatch-----------------------------------------------------------
grep("Rawlings",Sal$Name)

## ----grepl---------------------------------------------------------------
=======
## ----table2, comment="", prompt=TRUE-------------------------------------
prop.table(tab)
prop.table(tab,1)

## ----readSal, comment="", prompt=TRUE------------------------------------
Sal = read.csv("../data/Baltimore_City_Employee_Salaries_FY2014.csv",
                as.is=TRUE)

## ----isna, comment="", prompt=TRUE---------------------------------------
Sal[1:4,]
any(is.na(Sal$Name))

## ----gender, comment="", prompt=TRUE, echo=FALSE-------------------------
set.seed(4)
gender <- sample(c("Male", "mAle", "MaLe", "M", "MALE", "Ma", "FeMAle", "F", "Woman", "Man", "Fm", "FEMALE"), 1000, replace =TRUE)

## ----gentab, comment="", prompt=TRUE-------------------------------------
table(gender)

## ----RawlMatch, comment="", prompt=TRUE----------------------------------
grep("Rawlings",Sal$Name)

## ----grepl, comment="", prompt=TRUE--------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
grep("Rawlings",Sal$Name)
grep("Rawlings",Sal$Name,value=TRUE)
Sal[grep("Rawlings",Sal$Name),]

<<<<<<< HEAD
## ----greppers------------------------------------------------------------
=======
## ----greppers, comment="", prompt=TRUE-----------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
head(grep("Tajhgh",Sal$Name, value=TRUE))
grep("Jaffe",Sal$Name)
length(grep("Jaffe",Sal$Name))

<<<<<<< HEAD
## ----grepstar------------------------------------------------------------
grep("Payne.*", x=Sal$Name, value=TRUE)

## ----grepstar2-----------------------------------------------------------
grep("Leonard.?S", x=Sal$Name, value=TRUE)
grep("Spence.*C.*", x=Sal$Name, value=TRUE)

## ----classSal------------------------------------------------------------
class(Sal$AnnualSalary)

## ----orderstring---------------------------------------------------------
sort(c("1", "2", "10")) #  not sort correctly (order simply ranks the data)
order(c("1", "2", "10"))

## ----destringSal---------------------------------------------------------
head(as.numeric(Sal$AnnualSalary), 4)

## ----orderSal------------------------------------------------------------
=======
## ----grepstar, comment="", prompt=TRUE-----------------------------------
grep("Payne.*", x=Sal$Name, value=TRUE)

## ----grepstar2, comment="", prompt=TRUE----------------------------------
grep("Leonard.?S", x=Sal$Name, value=TRUE)
grep("Spence.*C.*", x=Sal$Name, value=TRUE)

## ----classSal, comment="", prompt=TRUE-----------------------------------
class(Sal$AnnualSalary)

## ----orderstring, comment="", prompt=TRUE--------------------------------
sort(c("1", "2", "10")) #  not sort correctly (order simply ranks the data)
order(c("1", "2", "10"))

## ----destringSal, comment="", prompt=TRUE--------------------------------
head(as.numeric(Sal$AnnualSalary), 4)

## ----orderSal, comment="", prompt=TRUE-----------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
Sal$AnnualSalary <- as.numeric(gsub(pattern="$", replacement="", 
                              Sal$AnnualSalary, fixed=TRUE))
Sal <- Sal[order(Sal$AnnualSalary,decreasing=TRUE), ] # use negative to sort descending
Sal[1:5, c("Name", "AnnualSalary", "JobTitle")]

<<<<<<< HEAD
## ----Paste---------------------------------------------------------------
=======
## ----Paste, comment="", prompt=TRUE--------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
paste("Visit", 1:5, sep="_")
paste("Visit", 1:5, sep="_", collapse=" ")
paste("To", "is going be the ", "we go to the store!", sep="day ")
# and paste0 can be even simpler see ?paste0 
paste0("Visit",1:5)

<<<<<<< HEAD
## ----Paste2--------------------------------------------------------------
=======
## ----Paste2, comment="", prompt=TRUE-------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
paste(1:5, letters[1:5], sep="_")
paste(6:10, 11:15, 2000:2005, sep="/")
paste(paste("x",1:5,sep=""),collapse="+")

<<<<<<< HEAD
## ----strsplit------------------------------------------------------------
=======
## ----strsplit, comment="", prompt=TRUE-----------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
x <- c("I really", "like writing", "R code")
y <- strsplit(x, split=" ")
y[[2]]
sapply(y, "[", 1) # on the fly
sapply(y, "[", 2) # on the fly

<<<<<<< HEAD
## ----merging-------------------------------------------------------------
=======
## ----merging, comment="", prompt=TRUE------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
base <- data.frame(id=1:10, Age= seq(55,60, length=10))
base[1:2,]
visits <- data.frame(id=rep(1:8, 3), visit= rep(1:3, 8),
                    Outcome= seq(10,50, length=24))
visits[1:2,]

<<<<<<< HEAD
## ----merging2------------------------------------------------------------
=======
## ----merging2, comment="", prompt=TRUE-----------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
merged.data <- merge(base, visits, by="id")
merged.data[1:5,]
dim(merged.data)

<<<<<<< HEAD
## ----mergeall------------------------------------------------------------
=======
## ----mergeall, comment="", prompt=TRUE-----------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
all.data <- merge(base, visits, by="id", all=TRUE)
tail(all.data)
dim(all.data)

<<<<<<< HEAD
## ----date----------------------------------------------------------------
=======
## ----date, comment="", prompt=TRUE---------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
circ = read.csv("../data/Charm_City_Circulator_Ridership.csv",as.is=TRUE)
head(sort(circ$date))
circ$date <- as.Date(circ$date, "%m/%d/%Y") # creating a date for sorting
head(circ$date)
head(sort(circ$date))

<<<<<<< HEAD
## ----longwide, echo=FALSE------------------------------------------------
wide <- data.frame(id=1, visit1="Good", visit2="Good", visit3 = "Bad")
long <- data.frame(id=rep(1, 3), visit=c(1, 2, 3), Outcome=c("Good", "Good", "Bad"))

## ----showlong, echo=TRUE-------------------------------------------------
head(wide)
head(long)

## ----reshape-------------------------------------------------------------
head(Indometh) # this is long

## ----reshape2------------------------------------------------------------
=======
## ----longwide, comment="", prompt=TRUE, echo=FALSE-----------------------
wide <- data.frame(id=1, visit1="Good", visit2="Good", visit3 = "Bad")
long <- data.frame(id=rep(1, 3), visit=c(1, 2, 3), Outcome=c("Good", "Good", "Bad"))

## ----showlong, comment="", prompt=TRUE, echo=TRUE------------------------
head(wide)
head(long)

## ----reshape, comment="", prompt=TRUE------------------------------------
head(Indometh) # this is long

## ----reshape2, comment="", prompt=TRUE-----------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
wide <- reshape(Indometh, v.names = "conc", idvar = "Subject",
                timevar = "time", direction = "wide")
head(wide)

<<<<<<< HEAD
## ----reshape3------------------------------------------------------------
dim(Indometh)
wide

## ----rewide--------------------------------------------------------------
reshape(wide, direction = "long")[1:10,]

## ----xlsx,echo=FALSE, results='hide'-------------------------------------
library(xlsx,verbose=FALSE)

## ----TB------------------------------------------------------------------
=======
## ----reshape3, comment="", prompt=TRUE-----------------------------------
dim(Indometh)
wide

## ----rewide, comment="", prompt=TRUE-------------------------------------
reshape(wide, direction = "long")[1:10,]

## ----xlsx, comment="", prompt=TRUE,echo=FALSE, results='hide'------------
library(xlsx,verbose=FALSE)

## ----TB, comment="", prompt=TRUE, cache=TRUE-----------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
TB <- read.xlsx(file="../data/indicator_estimatedincidencealltbper100000.xlsx",
                sheetName="Data")
head(TB, 1)
TB$NA. <- NULL
head(TB, 1)

<<<<<<< HEAD
## ----TB.hd---------------------------------------------------------------
=======
## ----TB.hd, comment="", prompt=TRUE, cache=FALSE-------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
colnames(TB) <- c("Country", paste("Year", 
                          1990:2007, sep="."))
head(TB,1)

<<<<<<< HEAD
## ----TB.long-------------------------------------------------------------
=======
## ----TB.long, comment="", prompt=TRUE------------------------------------
>>>>>>> d7ffaa7cd7a8e656f9f841e507370951b00f5028
TB.long <- reshape(TB, idvar="Country", 
            v.names="Cases", times=1990:2007, 
                   direction="long", timevar="Year", 
                   varying = paste("Year", 1990:2007, sep="."))
head(TB.long, 4)
rownames(TB.long) <- NULL
head(TB.long, 4)

