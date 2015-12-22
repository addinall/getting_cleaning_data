## CAPTAIN SLOG
## vim: set expandtab tabstop=4 shiftwidth=4 autoindent:
## File         : w5.R
## System       : Johns Hopkins Getting and Cleaning Data
## Date         : December 2015
## Author       : Mark Addinall
## Synopsis     : This file is part of the course work
##                assignments for the Johns Hopkins
##                series of Data Science units.
##                This unit is Getting and cleaning Data 
##                This file is just a dump of an R interactive
##                session working on quiz three.




> gdp <- data.table(read.csv("GDP.csv", skip = 4, nrows = 215))
Error: could not find function "data.table"
> library(data.table)
data.table 1.9.6  For help type ?data.table or https://github.com/Rdatatable/data.table/wiki
The fastest way to learn (by data.table authors): https://www.datacamp.com/courses/data-analysis-the-data-table-way

Attaching package: ‘data.table’

The following objects are masked from ‘package:dplyr’:

    between, last

> gdp <- data.table(read.csv("GDP.csv", skip = 4, nrows = 215))
> gdp <- gdp[X != ""]
> gdp <- gdp[,list(X, X.1, X.3, X.4)]
> gdp
       X X.1                      X.3          X.4
  1: USA   1            United States  16,244,600 
    2: CHN   2                    China   8,227,103 
    3: JPN   3                    Japan   5,959,718 
      4: DEU   4                  Germany   3,428,131 
      5: FRA   5                   France   2,612,878 
       ---                                              
       210: SOM  NA                  Somalia           ..
       211: MAF  NA St. Martin (French part)           ..
       212: TCA  NA Turks and Caicos Islands           ..
       213: VIR  NA    Virgin Islands (U.S.)           ..
       214: WBG  NA       West Bank and Gaza           ..
       > setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
							+ setnames(gdp, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp")
								   + )
							+ )
       + 
       + 
       > setnames(gdp, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))
       > edu <- data.table(read.csv("EDSTATS.csv"))
       > dt <- merge(gdp, edu, all = TRUE, by = c("CountryCode"))
       > sum(!is.na(unique(dt$rankingGDP)))
       [1] 189
       > dt[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y, 
						       +     rankingGDP, gdp)][13]
   CountryCode         Long.Name.x         Long.Name.y rankingGDP   gdp
   1:         KNA St. Kitts and Nevis St. Kitts and Nevis        178  767 
   > dt[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]
              Income.Group        V1
   1: High income: nonOECD  91.91304
   2:           Low income 133.72973
   3:  Lower middle income 107.70370
   4:  Upper middle income  92.13333
   5:    High income: OECD  32.96667
   6:                   NA 131.00000


