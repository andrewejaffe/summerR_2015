library('rmarkdown')
files <- dir(pattern = '\\.Rmd')
for(file in files) render(file, output_format = 'pdf_document')
