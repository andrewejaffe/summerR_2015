####################
# Module 7 - Lab
# 6/17/2015
####################

## Part A

# Bike Lanes Dataset: BikeBaltimore is the Department of Transportation's bike program.
# https://data.baltimorecity.gov/Transportation/Bike-Lanes/xzfj-gyms
# Download as a CSV (like the Monuments dataset) in your current working directory

bike = read.csv("../data/Bike_Lanes.csv",as.is=TRUE,
                  na.strings=" ")

# 1. Using tapply():
# 	(a) Which project category has the longest average bike lane?
tab=tapply(bike$length,bike$project,
            mean,na.rm=TRUE)
tab[which.max(tab)]

#	(b) What was the average bike lane length per year that they were installed?
bike$dateInstalled[bike$dateInstalled == "0"] = NA
tapply(bike$length,bike$dateInstalled,
       mean,na.rm=TRUE)

# 2. (a) Numerically [hint: `quantile()`] and (b) graphically [hint: `hist()` or `plot(density())`]
#	describe the distribution of bike "lane" lengths.
quantile(bike$length)

hist(bike$length)
hist(bike$length,breaks=100)

hist(log2(bike$length),breaks=100)

# 3. Then describe as above, after stratifying by
# i) type then ii) number of lanes
boxplot(bike$length~bike$type)
boxplot(bike$length~bike$type,las=3)
levels(factor(bike$type)) # this is the order of boxes
boxplot(bike$length~bike$numLanes)

tapply(bike$length,bike$type, 
       quantile,na.rm=TRUE)
tapply(bike$length,bike$numLanes, 
       quantile,na.rm=TRUE)

## Part B

# Download the CSV: http://biostat.jhsph.edu/~ajaffe/files/indicatordeadkids35.csv
# Via: http://www.gapminder.org/data/
# Definition of indicator: How many children the average couple had that die before the age 35.

kids = read.csv("http://www.aejaffe.com/summerR_2015/data/indicatordeadkids35.csv",
                 as.is=TRUE,row.names=1)

# 4. Plot the distribution of average country's
#  count across all year.
rowMeans(kids,na.rm=TRUE)
hist(rowMeans(kids,na.rm=TRUE))

# 5.(a) How many entries are less than 1?
(kids < 1)[1:5,1:5]
nrow(kids)*ncol(kids)
mean(is.na(kids))

sum(kids < 1,na.rm=TRUE)
mean(kids < 1,na.rm=TRUE)

#	(b) Which array indices do they correspond to?
#   [hint: `arr.ind` argument in `which()`]
head(which(kids<1))
head(which(kids<1,arr.ind=TRUE))
ind =which(kids<1,arr.ind=TRUE) 

# 6. Plot the count for each country across year in a line plot [hint: `matplot()`]
matplot(kids,type="l")
