### Module 8 - lab

## you will need data from:
##     https://data.baltimorecity.gov/browse?limitTo=datasets
## A. Baltimore_City_Employee_Salaries_FY2014
## B. Restaurants
## C. Monuments



# Salaries data:
Sal = read.csv("../data/Baltimore_City_Employee_Salaries_FY2014.csv",as.is=TRUE)

# 1. Make an object called health.sal using the salaries data set, 
#		with only agencies of those with "fire" (or any forms), if any, in the name
health.sal = Sal[grep("fire", Sal$JobTitle, ignore.case=TRUE),]

# 2. Make a data set called trans which contains only agencies that contain "TRANS".
trans = Sal[grep("trans", Sal$Agency, ignore.case=TRUE),]

# 3. What is/are the profession(s) of people who have "abra" in their name for Baltimore's Salaries?
Sal$JobTitle[grep("*abra*", Sal$name, ignore.case=TRUE)]

# 4. What is the distribution of annual salaries look like? What is the IQR?
Sal$AnnualSalary = as.numeric(gsub("$","",Sal$AnnualSalary,fixed=TRUE))
hist(Sal$AnnualSalary,breaks=50)
quantile(Sal$AnnualSalary,prob=c(0.25,0.75))

# 5. Convert HireDate to the `Date` class - plot Annual Salary vs Hire Date
Sal$HireDate = as.Date(Sal$HireDate, "%m/%d/%Y")
plot(AnnualSalary~HireDate, data=Sal)

# Monuments data:

# 6. How many monument names contain the phrase "Monument" in them?
mon = read.csv("../data/Monuments.csv", as.is=TRUE)
length(grep("monument",mon$name, ignore.case=TRUE))