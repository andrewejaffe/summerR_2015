
#############################
# Mapping Module - Lab
# 6/19/2015
#############################

# Part A: Setting up your base map
# Data available from 'rworldmap' and 'rworldxtra' packages
# Install these packages to get started

install.packages("rworldmap")
install.packages("rworldxtra")
library(rworldmap)
library(rworldxtra)

setwd("C:/Users/Shaun/SkyDrive/JHSPH/R Class/Mapping Module")


# 1. Create an object containing all of the map data need for the world in high resolution.
#    A. How many distinct countries or territories does this contain? 

worldmap <- getMap(resolution = "high")

length(worldmap$ADMIN)

#    B. Which country has the most territories, and how many? 
#       (Hint: Look for a variable that might indicate "territory")

table(worldmap$TERR_)


# 2. Plot the world map
#    A. Plot the world so the land is green and the water is blue. Set the margins to 0.

par(mar=c(0,0,0,0))
plot(worldmap, col="green", bg="blue")

#    B. Plot the world so countries are different colors
#       (Hint: Use the variable with "color" in the name)

plot(worldmap, col=worldmap$MAP_COLOR, bg="gray")


# 3. Subset your data to only include Asia. How many countries are in you data now?

asia <- worldmap[which(worldmap$REGION=="Asia"),]

length(asia$ADMIN)


# 4. Plot Asia with different colors for the countries.

plot(asia, col=asia$MAP_COLOR, bg="lightblue")



#########################################################
# PART B: Plotting data on your maps
# Data available from http://data.worldbank.org/indicator/SP.DYN.CBRT.IN/countries


# 5. Load the Health Care Expenditure data.

world.healthcare <- read.csv("world.healthcare.csv", header=TRUE)
row.names(world.healthcare) <- world.healthcare[,1]


# 6. Subset the Expenditure data to only include countries in your spatial object for asia.
#       To do this correctly, you need to convert the matching variables in the spatial object to 
#       'character' format, from 'factor'. 
#   Hint 1: the %in% operator can help you subset.
#   Hint 2: Matching on country code is often easier than country name (less misspelling).

asia$ADMIN <- as.character(asia$ADMIN)
asia$ADM0_A3 <- as.character(asia$ADM0_A3)

asia.healthcare <- world.healthcare[as.character(world.healthcare$CountryCode) %in% asia$ADM0_A3,]
asia.healthcare$CountryCode <- as.character(asia.healthcare$CountryCode)


# 7. Check matching.
#       A. How many countries are not matched in the spatial object?

asia$ADMIN[which(!(asia$ADM0_A3 %in% asia.healthcare$CountryCode))]

#       B. How many countries are not matched in the health care expenditures data?
asia.healthcare$CountryName[which(!(asia.healthcare$CountryCode %in% asia$ADM0_A3))]


# 8. Merge the health care expenditure data for 2013 into the spatial data object. 
#     Hint 1: Use "merge")
#     Hint 2: Create a new data.frame with only country codes and health care expenditure for 2013, 
#           and use that to merge with the spatial data.

hc2013 <- asia.healthcare[,c("CountryCode", "X2013")]

asia <- merge(asia, hc2013, by.x="ADM0_A3", by.y="CountryCode", all.x=TRUE)
asia <- asia[which(!is.na(asia$X2013)),]


# 9. Set up intervals to map the expenditures to countries by color. 
#       A. Create an interval variable that allows you to distiguish outliers. 
#           (Hint: make sure you have "classInt" package loaded)

library(classInt)

brks<-classIntervals(asia$X2013, n=8, style="quantile")
brks<- brks$brks

#       B. Create a set of colors for these intervals using the RColorBrewer package

library(RColorBrewer)
colors <- brewer.pal(8, "RdYlBu")


# 10. Plot the map
#       A. Plot it with colors for health care expenditure.
plot(asia, col=colors[findInterval(asia$X2013, brks, all.inside=TRUE)], axes=F, bg="lightgray")

#       B. Add a title
title("Health Care Expenditure by Country, Asia 2013")

#       C. Add a legend
legend("bottomleft", legend=leglabs(round(brks)), fill=colors, bty="n", cex=.75)



