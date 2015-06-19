## ----Install, eval=FALSE-------------------------------------------------
## ## If necessary
## install.packages(c("rworldmap", "rworldxtra", "RColorBrewer",
##     "maptools", "classInt"))
## 
## ## Load packages
## library('rworldmap')
## library('rworldxtra')
## library('RColorBrewer')
## library('maptools')
## library('classInt')

## ----loadLibs, echo=FALSE, message = FALSE-------------------------------
# setwd("C:/Users/Shaun/SkyDrive/JHSPH/R Class/Mapping Module")
library('rworldmap')
library('rworldxtra')
library('RColorBrewer')
library('maptools')

## ----getMap--------------------------------------------------------------
worldmap <- getMap(resolution = "high")
dim(worldmap)

## ----worldmapdetails-----------------------------------------------------
names(worldmap)

## ----worldPlot-----------------------------------------------------------
par(mar=c(0,0,0,0))     # Set 0 margins
plot(worldmap)          # Plot

## ----PlotEurope1---------------------------------------------------------
par(mar=c(0,0,0,0))     # Set 0 margins
plot(worldmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1) 

## ----tableWorldReg-------------------------------------------------------
t(t(table(worldmap$REGION)))

## ----tableWroldGEO3------------------------------------------------------
table(worldmap$GEO3)

## ----PlotEurope2, fig.height=3, fig.width=4------------------------------
par(mar=c(0,0,0,0))     # Set 0 margins
europe <- worldmap[which(worldmap$REGION=="Europe"),]               
plot(europe, col="lightgreen", bg="lightblue")

## ----PlotEurope3, fig.height=3, fig.width=4------------------------------
par(mar=c(0,0,0,0))  
europe <- worldmap[which(grepl("Europe", worldmap$GEO3) & 
                             as.character(worldmap$NAME) != "Russia"),]               
plot(europe, col="lightgreen", bg="lightblue")

## ----PlotEurope4, fig.height=3, fig.width=4------------------------------
par(mar=c(0,0,0,0)) 
plot(europe, col="lightgreen", bg="lightblue", 
     xlim = c(-25, 50), ylim = c(35, 71), asp = 1)

## ----AddPop--------------------------------------------------------------
world.pop <- read.csv("../data/world.population.csv",
                  header=TRUE)
row.names(world.pop) <- world.pop[,1]

## ----checkMatching-------------------------------------------------------
country.codes <- as.character(worldmap$ADM0_A3)
worldmap$ADMIN[which(!(country.codes %in%
    world.pop$CountryCode))]

## ----checkWestBank-------------------------------------------------------
grep("west bank", world.pop$CountryName, ignore.case=TRUE, value=TRUE)

## ----checkPopData--------------------------------------------------------
as.character(world.pop$CountryName)[
  which(!(world.pop$CountryCode %in% country.codes))]

## ----AddPop4-------------------------------------------------------------
Pop2013 <- world.pop[,c("CountryCode", "X2013")]
colnames(Pop2013)
colnames(Pop2013)[2] <- "Pop2013"

worldmap$ADM0_A3 <- as.character(worldmap$ADM0_A3)
worldmap <- merge(worldmap, Pop2013, 
  by.x="ADM0_A3", by.y="CountryCode", all.x=TRUE)

## ----OtherOptAdd, eval=FALSE---------------------------------------------
## joinCountryData2Map()

## ----SettingUpPopPlot, warnings=TRUE-------------------------------------
quantile(worldmap$Pop2013, na.rm=TRUE)
library(classInt)
brks <- classIntervals(worldmap$Pop2013[
    which(!is.na(worldmap$Pop2013))],
       n=10, style="quantile")
brks <- brks$brks
colors <- brewer.pal(length(brks), "RdYlBu")

## ----SettingUpPopPlot2---------------------------------------------------
pop_cuts <- c(100000, 500000, 1000000, 5000000, 25000000, 
              100000000, 500000000, 1000000000, 1500000000)
colors2 <- brewer.pal(length(pop_cuts) + 1, "RdYlBu")

## ----plotWorldMap--------------------------------------------------------
plot(worldmap, col=colors[findInterval(worldmap$Pop2013, 
      brks, all.inside=TRUE)], axes=FALSE, bg="lightgray")

## ----plotWorldMap2-------------------------------------------------------
plot(worldmap, col=colors2[findInterval(worldmap$Pop2013, 
      pop_cuts, all.inside=TRUE)], axes=FALSE, bg="lightgray")
title("Population by Country, World 2013") #add a title
legend("bottomleft", legend=leglabs(round(pop_cuts)), #add a legend
       fill=colors2, bty="n", cex=.6)

## ----extraCode, eval=FALSE, echo = FALSE---------------------------------
## 
## ################################################################################################
## # Birth Rates
## 
## birthrates <- read.csv("../data/birthrates.csv", header=TRUE)
## row.names(birthrates) <- birthrates[,1]
## 
## europe.birth <- birthrates[as.character(birthrates$CountryCode) %in% country.codes,]
## europe.birth$CountryCode <- as.character(europe.birth$CountryCode)
## 
## country.codes[which(!(country.codes %in% europe.birth$CountryCode))]
## europe$ADMIN[which(!(country.codes %in% europe.birth$CountryCode))]
## grep("taiwan", birthrates$CountryName, ignore.case=TRUE)
## 
## births.2013 <- europe.birth[,c("CountryCode", "X2013")]
## colnames(births.2013)[2] <- "BirthRate2013"
## 
## europe <- merge(europe, births.2013, by.x="ADM0_A3", by.y="CountryCode", all.x=TRUE)
## 
## quantile(europe$BirthRate2013, na.rm=TRUE)
## 
## 
## 
## brks <- classIntervals(europe$BirthRate2013, n=10, style="quantile")
## brks <- brks$brks
## 
## pop_cuts <- c(100000, 500000, 1000000, 5000000, 25000000, 100000000, 500000000, 1000000000, 1500000000)
## 
## colors <- brewer.pal(11, "RdYlBu")
## 
## #plot the map
## plot(europe, col=colors[findInterval(europe$BirthRate2013,
##       brks, all.inside=TRUE)], axes=FALSE, bg="lightgray")
## 
## #add a title
## title("Birth Rate by Country, europe 2013")
## 
## #add a legend
## legend("bottomleft", legend=leglabs(round(brks)),
##        fill=colors, bty="n", cex=.6)
## 

