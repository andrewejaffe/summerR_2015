### Module 12 - lab
### Date: June 19th, 2015
### Author: Leonardo Collado-Torres


## ******************************* Part 1 *******************************

## Install the following packages:
# plyr
# rmarkdown
# devtools
install.packages(c("plyr", "rmarkdown", "devtools"))

## Download the "illussion" R Markdown file from
## http://www.aejaffe.com/summerR_2015/labs/illusion.Rmd

# 1. Open the file "illusion.Rmd" with RStudio and render it to a Word document.
#    Then open the resulting "illusion.docx" file with Word (if it didn't do so
#    automatically).

## It should be identical to the "illusion" Word document that is available at
## http://www.aejaffe.com/summerR_2015/labs/illusion.docx

# 2. Close the Word file illusion.docx then in illusion.Rmd change the title
#    and enter your name as the author. Render the file again and check that
#    the title and author information indeed changed.

# 3. Complete the TODO sections of the "illusion.Rmd" file and render a final
#    Word document. By doing so, you will learn how to hide code from the output
#    which is useful if you are preparing a document for an audience that does
#    not need the code. For homeworks and for audiences that know R, it's best
#    to include the code in the document. You will also learn how to include
#    links, choosing chunk names, changing section names, improving the
#    reproducibility of your work, and inserting results from R in your document
#    sentences.

# 4. Using your final version "illusion.Rmd" from step 3, use RStudio to render
#    a HTML version of the document. Then click on "publish" and follow the
#    instructions to create a public version of your document. Send the link
#    to your friend/boss/fellow R enthusiast about the cool thing you just did!
#    Or if you use twitter, tweet the link mentioning @andrewejaffe :-)

## ******************************* Part 2 *******************************

## Install the following packages:
# corrplot
# AER
# ggplot2
install.packages(c("corrplot", "AER", "ggplot2"))

## If you skipped part 1, then also install:
# rmarkdown
# devtools
install.packages(c("rmarkdown", "devtools"))

## Download the module12_lab_part2.Rmd file from
## http://www.aejaffe.com/summerR_2015/labs/module12_lab_part2.Rmd

# 5. Open the file "module12_lab_part2.Rmd" in RStudio and render it into a
#    HTML document. This should be very similar to 
#    http://www.aejaffe.com/summerR_2015/labs/module12_lab_part2.html. Compare
#    your R Markdown version and the resulting HTML.

# 6. Open http://cran.r-project.org/web/packages/knitrBootstrap/vignettes/two-D.html
#    and check how the correlation plot was made. Next, edit 
#    "module12_lab_part2.Rmd" to make the correlation plot and follow the hints
#    to calculate the range of correlations excluding the diagonal elements
#    (those are always 1). Edit the text describing the correlation plot to
#    include the required numbers. Do not enter the numbers manually, instead
#    use inline R code. Remember that the syntax is
#    `r someRCode`
#    Render your HTML document again to check that the plot is included and
#    the numbers are printed in the HTML.

# 7. Load the AER package and check the description of the "CASchools" data set.
library('AER')
?CASchools
#    Then open http://jeromyanglim.blogspot.com/2012/05/example-reproducile-report-using-r.html
#    and check how the code for making the plot under "Q. 4 what is the 
#    relationship between district level maths and reading scores?"
#    Edit "module12_lab_part2.Rmd" to make the plot and follow the hints to
#    add a linear regression line in orange with no spread.
#    Render your HTML document again and check that the plot is included.

# 8. Continue editing "module12_lab_part2.Rmd" to calculate the slope of the 
#    read vs math relationship, the 95% confidence interval of the slope, and 
#    its P-value. Use the hints.
#    Next, edit "module12_lab_part2.Rmd" so these numbers are included in the
#    text automatically using inline R code. That is, don't copy paste numbers!
#    Render your HTML document again and check that the numbers are properly
#    included. 

#    Publish it to Rpubs! Share with your friends/boss/fellow R enthusiats, etc.
#    Yay, you are done!


#    Want more? Edit the "module12_lab_part2.Rmd" to try different themes such 
#    as "spacelab". Check http://rmarkdown.rstudio.com/html_document_format.html#appearance-and-style
#    for details.

#    Still want more? Take a look at
#    https://github.com/andrewejaffe/summerR_2015/tree/gh-pages/modules
#    and look at the files ending in Rmd as well as the "renderModules.R" file.
#    That is how we created the presentations and pdf files.
