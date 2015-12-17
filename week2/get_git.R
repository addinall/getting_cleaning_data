## CAPTAIN SLOG
## vim: set expandtab tabstop=4 shiftwidth=4 autoindent:
## File         : get_git.R
## System       : Johns Hopkins Getting and Cleaning Data
## Date         : December 2015
## Author       : Mark Addinall
## Synopsis     : This file is part of the course work
##                assignments for the Johns Hopkins
##                series of Data Science units.
##                This unit is Getting and cleaning Data 
##
##		  	        This program uses a github application account
##		            we have set up so that we may interrogate the
##                  repos belonging to our instructer and fetch the
##                  created at date for his data sharing repo.
##
##                  How to do this is not well documented.
##
##                  When registering the repo I found it worked
##                  if I set the main HOME page to HIS repo area,
##                  and the CALLBACK to http://localhost:1410
##
##                  Don't ask why, I don't understand it either.  
##                  I gleemed it from a GOOGLE search and it worked.
##                  Mucking around with the return data is harder than
##                  my recent foray into Python.  The only way I
##                  could figure out how to do this was a brute force
##                  search through the data structure returned


library(httr)
require(httpuv)
require(jsonlite)


# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/

oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#

myapp <- oauth_app("github",
  key = "5a82776baefa26ba7fb3",
  secret = "202cc15123f160c7512ab37e771c810e627cb580")

# 3. Get OAuth credentials

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API

gtoken <- config(token = github_token)                                  # this is voodoo
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)         # get ALL his repos.  I never figured
                                                                        # out a way to just fetch one
stop_for_status(req)                                                    # let go of the API

data <-content(req)                                                     # into a list of lists
N <- length(data)                                                       # how big is it?
for (i in 1:N) {                                                        # so look through it
    print( c(data[[i]]$name, data[[i]]$created_at))                     # as it happens, the one we want
                                                                        # is at 8.  Not very satisfactory.
                                                                        # I got the answer, but it aint
                                                                        # pretty.
}





