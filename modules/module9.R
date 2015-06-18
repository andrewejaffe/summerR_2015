## ----table---------------------------------------------------------------
table(c(0, 1, 2, 3, NA, 3, 3, 2,2, 3), 
        useNA="ifany")
table(c(0, 1, 2, 3, 2, 3, 3, 2,2, 3), 
        useNA="always")
tab <- table(c(0, 1, 2, 3, 2, 3, 3, 2,2, 3), 
             c(0, 1, 2, 3, 2, 3, 3, 4, 4, 3), 
              useNA="always")
margin.table(tab, 2)

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
grep("Rawlings",Sal$Name)
grep("Rawlings",Sal$Name,value=TRUE)
Sal[grep("Rawlings",Sal$Name),]

## ----greppers------------------------------------------------------------
head(grep("Tajhgh",Sal$Name, value=TRUE))
grep("Jaffe",Sal$Name)
length(grep("Jaffe",Sal$Name))

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
Sal$AnnualSalary <- as.numeric(gsub(pattern="$", replacement="", 
                              Sal$AnnualSalary, fixed=TRUE))
Sal <- Sal[order(Sal$AnnualSalary,decreasing=TRUE), ] # use negative to sort descending
Sal[1:5, c("Name", "AnnualSalary", "JobTitle")]

## ----Paste---------------------------------------------------------------
paste("Visit", 1:5, sep="_")
paste("Visit", 1:5, sep="_", collapse=" ")
paste("To", "is going be the ", "we go to the store!", sep="day ")
# and paste0 can be even simpler see ?paste0 
paste0("Visit",1:5)

## ----Paste2--------------------------------------------------------------
paste(1:5, letters[1:5], sep="_")
paste(6:10, 11:15, 2000:2005, sep="/")
paste(paste("x",1:5,sep=""),collapse="+")

## ----strsplit------------------------------------------------------------
x <- c("I really", "like writing", "R code")
y <- strsplit(x, split=" ")
y[[2]]
sapply(y, "[", 1) # on the fly
sapply(y, "[", 2) # on the fly

## ----merging-------------------------------------------------------------
base <- data.frame(id=1:10, Age= seq(55,60, length=10))
base[1:2,]
visits <- data.frame(id=rep(1:8, 3), visit= rep(1:3, 8),
                    Outcome= seq(10,50, length=24))
visits[1:2,]

## ----merging2------------------------------------------------------------
merged.data <- merge(base, visits, by="id")
merged.data[1:5,]
dim(merged.data)

## ----mergeall------------------------------------------------------------
all.data <- merge(base, visits, by="id", all=TRUE)
tail(all.data)
dim(all.data)

## ----date----------------------------------------------------------------
circ = read.csv("../data/Charm_City_Circulator_Ridership.csv",as.is=TRUE)
head(sort(circ$date))
circ$date <- as.Date(circ$date, "%m/%d/%Y") # creating a date for sorting
head(circ$date)
head(sort(circ$date))

## ----longwide, echo=FALSE------------------------------------------------
wide <- data.frame(id=1, visit1="Good", visit2="Good", visit3 = "Bad")
long <- data.frame(id=rep(1, 3), visit=c(1, 2, 3), Outcome=c("Good", "Good", "Bad"))

## ----showlong, echo=TRUE-------------------------------------------------
head(wide)
head(long)

## ----reshape-------------------------------------------------------------
head(Indometh) # this is long

## ----reshape2------------------------------------------------------------
wide <- reshape(Indometh, v.names = "conc", idvar = "Subject",
                timevar = "time", direction = "wide")
head(wide)

## ----reshape3------------------------------------------------------------
dim(Indometh)
wide

## ----rewide--------------------------------------------------------------
reshape(wide, direction = "long")[1:10,]

## ----xlsx,echo=FALSE, results='hide'-------------------------------------
library(xlsx,verbose=FALSE)

## ----TB------------------------------------------------------------------
TB <- read.xlsx(file="../data/indicator_estimatedincidencealltbper100000.xlsx",
                sheetName="Data")
head(TB, 1)
TB$NA. <- NULL
head(TB, 1)

## ----TB.hd---------------------------------------------------------------
colnames(TB) <- c("Country", paste("Year", 
                          1990:2007, sep="."))
head(TB,1)

## ----TB.long-------------------------------------------------------------
TB.long <- reshape(TB, idvar="Country", 
            v.names="Cases", times=1990:2007, 
                   direction="long", timevar="Year", 
                   varying = paste("Year", 1990:2007, sep="."))
head(TB.long, 4)
rownames(TB.long) <- NULL
head(TB.long, 4)

