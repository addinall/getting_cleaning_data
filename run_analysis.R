## CAPTAIN SLOG
## vim: set expandtab tabstop=4 shiftwidth=4 autoindent:
## File         : run_analysis.R
## System       : Getting and Cleaning Data final exam
## Date         : December 2015
## Author       : Mark Addinall
## Synopsis     : This file is part of the course work
##                assignments for the Johns Hopkins
##                series of Data Science units.
##                This unit is Getting and cleaning Data 
##
##              - Merges the training and the test sets to create one data set.
##              - Extracts only the measurements on the mean and standard deviation for each measurement. 
##              - Uses descriptive activity names to name the activities in the data set
##              - Appropriately labels the data set with descriptive variable names. 
##       
##              Just a note on naming conventions:  Yes I was paying attention during the
##              lectures "cleaning names and stuff" and I do agree that mixing camelCase
##              and other types of naming conventions is messy.  And I am not a big
##              fan of camelCase anyway.  However, I am one of thos that likes the underscore
##              character to break up distinct words as opposed to strining them all
##              together.  I thin if the approach is consistant, then it meets "tidy data"
##              constraints.



#---------------------------------
error <- function(error_message) {

    # application wide error logger
    # close application

    stop(error_message)

}


#----------------------------------
file_exists <- function(filename) {
    
    # Check to see if the merged file exists.  If it does
    # we can save some processing in the system.  During
    # development, the merge file will be deleted by hand
    # as data cleansing errors are found.
    # we also use this function to test for the existance
    # of the sample data to work with.  If we error, then
    # the data hasn't been fetched, been deleted accidently,
    # or the working dir is not set correctly.
    #
    # This function might seem like a duplicate of the R
    # intrinsic, however I was unsure if I needed to
    # expand error messages or try other processing.

    if (is.null(filename)) {
        error("Usage:  You must pass a filename into this function")
    }                           #  we are now dead

    if (file.exists(filename)) {
        return(TRUE);
    }

    return(FALSE);
}


#------------------------------
combine_datasets <- function() {

    # take the test and training datasets and merge them into one new dataset.
    # this has a number of steps.  the activities have been given consistant
    # name so we build two aggregates sets of data, one test, and one training as
    # our first step.

    table_training  <-  cbind(table_trainy, table_strain, table_trainx)
    table_testing   <-  cbind(table_testy,  table_stest,  table_testx)

    # now we have two tables the same shape, row bind them into one

    table_combined  <-  rbind(table_training, table_testing)

    # this table now contains a LOT of stuff we do not want.
    # as per the specification, we require means() and standard_deviations()
    # after reading a lot of the comments in the discussion forum, it
    # seems the general consencus is to grep the names.
    # not sure I like i very much.  If I get the time I will try and
    # think of something else.  However, it is getting VERY CLOSE to
    # Christmas Eve.}

    column_names    <- colnames(table_combined)
    
    #table_combined  <- filter(table_combined, grepl("activity"

    return(table_combined)

}



#--------------------------------
rename_activities <- function() {

    # give the newly merged data set some descriptive activity names
    # this not only helps the human reading this stuff,
    # it facilitates our merges.
    #
    # the data files in this project when raw are just a sea of numbers.
    # really difficult to figure out what they mean

    colnames(table_activity)    <<- c("activity_id", "activity_description")

    colnames(table_trainx)      <<- table_features[,2] 
    print(colnames(table_trainx)) 
    colnames(table_trainy)      <<- "activity_id"
    colnames(table_strain)      <<- "subject_id"

    colnames(table_testx)       <<- table_features[,2]
    colnames(table_testy)       <<- "activity_id"
    colnames(table_stest)       <<- "subject_id"

}

#-------------------------------
rename_variables <- function() {

    # give the newly merged data set some descritive variable names

}


#--------------------------------
create_tidy_data <- function() {

    # processing complete, write a tidy dataset to disk.

}


# ----------------- main --------------------


setwd("data/UCI")

if (! file_exists("tidy.rdata")) {

    # This part of the program assumes the likelyhood of all of these
    # datasets to have been downloaded prior to the code run.
    # It possibly should not, however since we are testing with
    # reasonable amounts of data, I don't want to bring all of
    # stuff down the network for every program execution.
    #
    # We will trap gross errors.
    #
    # Having this stuff in the main makes the scope of the
    # data.tables GLOBAL.  In R this saves a lot of faffing around
    # with scope / environment considerations.

    print("checking file integrity \n")

    if (!  (file_exists("features.txt")             &&
            file_exists("activity_labels.txt")      &&
            file_exists("train/X_train.txt")        &&
            file_exists("train/y_train.txt")        &&
            file_exists("train/subject_train.txt")  &&
            file_exists("test/X_test.txt")          &&
            file_exists("test/y_test.txt")          &&
            file_exists("test/subject_test.txt"))) {
        
        # one or more of the data file are missing
        # tell the customer to check the data/permissions

        error("one or more of the BASE datasets are unreadable.  Check data and permissions")

        # we are now dead
    }

    # load em up
    print("Loading tables .....")

    table_features  <- read.table("features.txt")
    table_activity  <- read.table("activity_labels.txt")

    table_trainx    <- read.table("train/X_train.txt")
    table_trainy    <- read.table("train/y_train.txt")
    table_strain    <- read.table("train/subject_train.txt")

    table_testx     <- read.table("test/X_test.txt")
    table_testy     <- read.table("test/y_test.txt")
    table_stest     <- read.table("test/subject_test.txt")

}

rename_activities()
new_table <- combine_datasets()
rename_variables()
create_tidy_data()
print("Data set created ")
head(new_table)


# --------------- EOF -----------------------------------
