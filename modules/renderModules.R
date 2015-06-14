library('rmarkdown')
library('knitr')
files <- dir(pattern = '\\.Rmd')
for(file in files) {
    ## Extract R code
    knit(file, tangle = TRUE)
    
    ## Make presentation
    render(file, output_format = 'ioslides_presentation')
    
    ## Make pdf version
    render(file,  output_format = 'pdf_document')
}
