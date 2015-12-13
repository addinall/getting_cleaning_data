## CAPTAIN SLOG
## vim: set expandtab tabstop=4 shiftwidth=4 autoindent smartindent:
## File         : swirl4.R
## System       : Johns Hopkins Getting and Cleaning Data
## Date         : December 2015
## Author       : Mark Addinall
## Synopsis     : This file is part of the course work
##                assignments for the Johns Hopkins
##                series of Data Science units.
##                This unit is Getting and cleaning Data 
##

# Read the code below, but don't change anything. As
# you read it, you can pronounce the %>% operator as
# the word 'then'.
#
# Type submit() when you think you understand
# everything here.

result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)
