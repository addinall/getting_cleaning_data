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
##              From the data set in step 4, creates a second, independent tidy data set with the 
##              average of each variable for each activity and each subject.

library(dpyml)

#---------------------------------
error <- function(error_message) {

    # application wide error logger
    # close application

}

#-----------------
success(message) {

    # happy logger and close application

}

#-----------------------------------------
file_exists <- function(filename = NULL) {
    
    # Check to see if the merged file exists.  If it does
    # we can save some processing in the system.  During
    # development, the merge file will be deleted by hand
    # as data cleansing errors are found.
    # we also use this function to test for the existance
    # of the sample data to work with.  If we error, then
    # the data hasn't been fetched, been deleted accidently,
    # or the working dir is not set correctly.


    return FALSE;
}


#---------------------------------
load_training_file <- function() {

    if file_exists("training.csv") {
        # get it into memory
    } else {
        error("No training data to work with. Check directories and permissions.")
    }
}


#-----------------------------
load_test_file <- function() {

    if file_exists("test.csv") {
        # get it into memory
    } else {
        error("No test data to work with. Check directories and permissions.")
    }
}


#----------------------------
merge_datasets <- function {

    # take the test and training datasets and merge them into one new dataset.

}


#--------------------------------
rename_activities <- function() {

    # give the newly merged data set some descriptive activity names


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

if ! file_exists(tidy.rdata) %>%
    load_training_file() %>%
        load_test_file() %>%
            merge_datasets() %>%
                rename_activities() %>%
                rename_variables() %>%
                    create_tidy_data() %>%
                        success("Data set created at ")

    # if we got here then the tidy data set is already in place,

    success("Tidy data already exists at ")

# --------------- EOF -----------------------------------
