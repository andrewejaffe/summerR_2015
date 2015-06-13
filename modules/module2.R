## ----code, comment="", prompt=TRUE---------------------------------------
print("I'm code")

## ----calcDemo, comment="", prompt=TRUE-----------------------------------
2+2
2*4
2^3

## ----calcDemo2, comment="", prompt=TRUE----------------------------------
2+(2*3)^2
(1+3)/2 + 45

## ----assign, comment="", prompt=TRUE-------------------------------------
x=2
x
x*4
x+2

## ---- echo = FALSE-------------------------------------------------------
Charm_City_Circulator_Ridership <- read.csv("http://www.aejaffe.com/summerR_2015/data/Charm_City_Circulator_Ridership.csv")

## ----df1,  comment="", prompt=TRUE---------------------------------------
head(Charm_City_Circulator_Ridership)

## ----assignClass, comment="", prompt=TRUE--------------------------------
class(x)
y = "hello world!"
print(y)
class(y)

## ----myName, comment="", prompt=TRUE-------------------------------------
name = "Andrew Jaffe"
name

## ----assign3a, comment="", prompt=TRUE-----------------------------------
x <- c(1,4,6,8)
x
class(x)

## ----myName2, comment="", prompt=TRUE------------------------------------
name2 = c("Andrew","Jaffe")
name2

## ----assign3b, comment="", prompt=TRUE-----------------------------------
length(x)
y
length(y)

## ----myName3, comment="", prompt=TRUE------------------------------------
length(name)
length(name2)

## ----assign4, comment="", prompt=TRUE------------------------------------
x + 2
x * 3
x + c(1,2,3,4)

## ----assign5, comment="", prompt=TRUE------------------------------------
y = x + c(1,2,3,4)
y 

## ----assign2, comment="", prompt=TRUE------------------------------------
str(x)
str(y)

## ----str_charm, comment="", prompt=TRUE----------------------------------
str(Charm_City_Circulator_Ridership)

