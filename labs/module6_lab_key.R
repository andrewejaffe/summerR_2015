####################
# Module 6 - Lab
# 6/17/2015
####################

## Part A

# Bike Lanes Dataset: BikeBaltimore is the Department of Transportation's bike program. 
# https://data.baltimorecity.gov/Transportation/Bike-Lanes/xzfj-gyms
# 	Download as a CSV (like the Monuments dataset) in your current working directory

bike = read.csv("data/Bike_Lanes.csv",as.is=TRUE,na.strings=" ")

# 1. How many bike "lanes" are currently in Baltimore?
nrow(bike)

# 2. How many (a) feet and (b) miles of bike "lanes" are currently in Baltimore?
sum(bike$length)
sum(bike$length)/5280
sum(bike$length/5280)

# 3. How many types of bike lanes are there? 
# Which type has (a) the most number of and (b) longest average bike lane length?
length(unique(bike$type))
tab=table(bike$type)
tab[which.max(tab)]

tab = tapply(bike$length, bike$type ,mean)
tab[which.max(tab)]

# 4. How many different projects do the "bike" lanes fall into? 
# Which project category has the longest average bike lane? 
length(unique(bike$project))
tab = tapply(bike$length,bike$project,mean,na.rm=TRUE)
tab[which.max(tab)]

## Part B

# Download the CSV: http://biostat.jhsph.edu/~ajaffe/files/indicatordeadkids35.csv
# Via: http://www.gapminder.org/data/
# Definition of indicator: How many children the average couple had that die before the age 35.

death = read.csv("http://www.aejaffe.com/summerR_2015/data/indicatordeadkids35.csv",
                  as.is=TRUE,row.names=1)
death2 = read.csv("http://www.aejaffe.com/summerR_2015/data/indicatordeadkids35.csv",
                 as.is=TRUE)
rownames(death2) = death2$X
death2$X=NULL
rownames(death2)

# 5. How many countries have data in any year?
dim(death)
!is.na(death)[1:5,1:5]
table(rowSums(!is.na(death)))

# 6. When did measurements in the US start?
death["United States",]
# death[death$X=="United States",]
!is.na(death["United States",])
allIndex=  which(!is.na(death["United States",]))
allIndex[1]
i= which(!is.na(death["United States",]))[1]
colnames(death)[i]

## one line version
colnames(death)[which(!is.na(death["United States",]))[1]]

# 7. How many countries, and which, had data the first year of measuring?
!is.na(death[,1])
which(!is.na(death[,1]))
rownames(death)[which(!is.na(death[,1]))]

