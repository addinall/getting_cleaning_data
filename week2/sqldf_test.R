## CAPTAIN SLOG
## vim: set expandtab tabstop=4 shiftwidth=4 autoindent smartindent:
## File         : sqldf_test.R 
## System       : Getting and Cleaning Data
## Date         : May 19 2015
## Author       : Mark Addinall
## Synopsis     : Johns Hopkins University Data Science Specialisation
##               
##              
##             
## 		The sqldf package allows for execution of SQL commands on R data frames. 
##      We will use the sqldf package to practice the queries we might send with the 
##      dbSendQuery command in RMySQL. Download the American Community Survey data and 
##      load it into an R object called acs
##
##      Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
##      sqldf("select pwgtp1 from acs")
##      sqldf("select * from acs where AGEP < 50 and pwgtp1")
##      sqldf("select * from acs")
##      sqldf("select pwgtp1 from acs where AGEP < 50")


acs <- read.csv("../data/ss06pid.csv", stringsAsFactors = FALSE)


qldf("select pwgtp1 from acs where AGEP < 50")

# testing this assumption
#z> sqldf("select AGEP, pwgtp1 from acs where AGEP < 50 limit 10")
#    AGEP pwgtp1
# 1    43     87
# 2    42     88
# 3    16     94
# 4    14     91
# 5    29    539
# 6    40    192
# 7    15    153
# 8    28    232
# 9    30    205
# 10    4    226
# > 



