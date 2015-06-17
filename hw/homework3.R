## 140.886: Intro to R
## Homework 3
## Assigned Date: 6/17/2015
## Due Date: 6/19/2015

## Name:


# Instructions: 
# 1)	Get the dataset: http://www.aejaffe.com/summerR_2015/data/kaggleCarAuction.zip
# 2)	Read the "dictionary": http://www.aejaffe.com/summerR_2015/data/Carvana_Data_Dictionary.txt
# This is a dataset from the "Kaggle" website, which hosts competitions for prediction and machine learning. 
# More details on this dataset are here: 
# http://www.kaggle.com/c/DontGetKicked/details/Background

library(stringr)
df = read.delim('http://www.aejaffe.com/summerR_2015/data/Carvana_Data_Dictionary.txt', 
                sep="\t", row.names= NULL, as.is = TRUE)

#### Trailing white space deletion
df$row.names = str_trim(df$row.names)
df$Field.Name = str_trim(df$Field.Name)
df$X = str_trim(df$X)
df$X.1 = str_trim(df$X.1)
df$X.2 = str_trim(df$X.2)
df$Definition = str_trim(df$Definition)

df$Definition = paste(df$Field.Name, df$X, df$X.1, df$X.2, df$Definition)
df$Definition = str_trim(df$Definition)
df$Field.Name = df$row.names
df$row.names = df$X = df$X.1 = df$X.2 = NULL

### OR 
df = read.delim('http://www.aejaffe.com/summerR_2015/data/Carvana_Data_Dictionary2.txt', 
                sep="\t", row.names= NULL, as.is = TRUE)

# Questions
# 1)	Read in the dataset itself, naming the R object "cars" into R (as separate objects). 
### Save them together in an ".rda" file so you can access the data offline. 

# 2)	How many cars are in the dataset? How many variables are recorded for each car?

# 3)	What is the range of the manufacturer's years of the vehicles? How many cars were from before 2004, and what percent/proportion of the cars are these older models?

# 4)	Drop any vehicles that cost less than $1000 - how many vehicles were removed, and how much were they? The rest of the questions expect answers based on this reduced dataset.

# 5)	How many different vehicle a) manufacturers/makes b) models and c) sizes are there?

# 6)	Which vehicle a) make, b) model and c) color had the highest average acquisition cost paid for the vehicle at time of purchase, and what was this cost?

# 7)	Which vehicle a) make, b) model and c) color had the highest variability in acquisition cost paid for the vehicle at time of purchase?

# 8)	Display the relationship between acquisition cost and mileage, and describe this relationship

# 9)	Which variables of cost, odometer reading, and/or warranty (if any) visually appear to associate with a car being a "lemon"/bad purchase?

# 10)	 How many vehicles:
	# a.	Were red and have fewer than 50,000 miles?

	# b.	Are made by GMC and were purchased in Florida? 

	# c.	Are green or white?

	# d.	Are made by Mazda or Nissan and are black or silver? 

	# e.	Are automatic, blue, Pontiac cars with under 60,000 miles? 

	