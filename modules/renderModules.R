library('rmarkdown')
library('knitr')
files <- dir(pattern = '\\.Rmd')


renderFile <- function(file) {
    ## Extract R code
    knit(file, tangle = TRUE)
    
    ## Make presentation
    render(file, output_format = 'ioslides_presentation')
    
    ## Make pdf version
    render(file,  output_format = 'pdf_document')
}

## Render all Rmd files in this directory
for(file in files) {
    renderFile(file)
}

## Render a specific module
# renderFile('module9.Rmd')
