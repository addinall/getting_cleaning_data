## CAPTAIN SLOG
## vim: set expandtab tabstop=4 shiftwidth=4 autoindent smartindent:
## File         : week1.R
## System       : Johns Hopkins Getting and Cleaning Data
## Date         : December 2015
## Author       : Mark Addinall
## Synopsis     : This file is part of the course work
##                assignments for the Johns Hopkins
##                series of Data Science units.
##                This unit is Getting and cleaning Data 
##                R routines for the first week's work


set_directory(directory <- function(directory = './data') {

    setwd(sirectory)
}


get_http_file <- function(url = '', target = '') {

    download.file(url, destfile = target)

}



get_https_file <- function(url = '', target = '') {

    download.file(url, destfile = target, method = 'curl')

}


read_flat_file <- function(filename, sepi = '', headeri = TRUE, quotei = '') {

    fdata <- read.table(filename, sep = sepi, header = headeri, quote = quotei )
}



read_xl_file <- function(filename) {

}


# library(xlsx)

# dt <- read.xlsx(filename, sheetIndex = 1, colIndex = n, rowIndex = n)

# XLConnect is better



# library(XML)

# doc <- xmlTreeParse(fileURL, useInternal = TRUE)
# rootNode <- xmlRoot(doc)
# xmlName(rootNode)

# names(rootNode)

# rootNode[[1]]

# rootNode[[1]][[1]]

# xlmsApply(rootNode, xmlValue)

# XPath

# xpathSApply(rootNode, "//tag", xmlValue)

# doc <- htmlTreeParse(fileURL, useInternal = TRUE)
# stuff <- xpathSApply(doc, "//elelment[@class='class_id']", xmlValue)




# JSON

# library(jsonlite)

# jsonData <- fromJSON(url)

# names(jsonData)

# names(jsonData$tag)

# names(jsonData$tag$another_tag ...)

# R data table to JSON

# myJSON <- toJSON(dt, pretty = TRUE)

# dt <- fromJSON(stuff)

# data table package

#  library(data.table)

# tables()

dt[2,]
dt[dt$y == 'a']

dt[c(2.3)]

dt[,list(mean(x),sum(z))]

system.time(function(arg))





