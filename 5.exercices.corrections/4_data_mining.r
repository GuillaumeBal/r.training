rm(list = ls())

getwd()
wd <-  'C:/Users/gbal/Desktop/r.training/5.exercices.corrections'
setwd(wd)

## example relative path for data: "../2.data/2.salmon/salmon.data.raw.txt"
# loading files =========================================================================

# from folder
salmon.data <- read.table(file = 'salmon.data.raw.txt',
                          header = TRUE,
                          sep = ',', 
                          dec = '.')

# from the web
web.address <- 'https://github.com/GuillaumeBal/r.training/blob/master/2.data/2.salmon/salmon.data.raw.txt'
salmon.data <- read.table(file = web.address,
                          header = TRUE,
                          sep = ',', 
                          dec = '.')

# load excel from folder
#install.packages('openxlsx')
require(openxlsx)
#library(openxlsx)
#salmon <- read.xlsx('salmon.data.raw.xlsx')

head(salmon.data)
dim(salmon.data)

write.table(salmon.data, 
            file = 'salmon.g.txt',
            sep = ',',
            dec = '.', 
            row.names = FALSE)
