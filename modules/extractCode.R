library('knitr')
files <- dir(pattern = '\\.Rmd')
for(file in files) knit(file, tangle = TRUE)
