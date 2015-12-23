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
##
##              The tidy data is somewhat tidier.  Unfortunately, statistically meaningless.
##              Without a statistical product description from a specification or a customer
##              I am at a bit of a loss what to put in the file.  So I stuck in a summary.



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
   
    # get a list of all the thingies that mention mean or standard deviation
    # no-one seems quite sure about what to include, and the specification
    # doesn't really say.


    boolean_filter  <- (grepl("activity",column_names)  | 
                        grepl("subject",column_names)   | 
                        grepl("mean",column_names)    | 
                        grepl("std",column_names));

    table_combined  <- table_combined[boolean_filter == TRUE]

    # this is the result.  looks like a load of bleh to me.

    # names(new_table)
    # [1] "activity_id"                     "subject_id"                     
    # [3] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
    # [5] "tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"               
    # [7] "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
    # [9] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"           
    # [11] "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
    # [13] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
    # [15] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
    # [17] "tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"           
    # [19] "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
    # [21] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"             
    # [23] "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
    # [25] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
    # [27] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
    # [29] "tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"          
    # [31] "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
    # [33] "tBodyAccMag-mean()"              "tBodyAccMag-std()"              
    # [35] "tGravityAccMag-mean()"           "tGravityAccMag-std()"           
    # [37] "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
    # [39] "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"             
    # [41] "tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"         
    # [43] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
    # [45] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"               
    # [47] "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
    # [49] "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
    # [51] "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
    # [53] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"          
    # [55] "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
    # [57] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"      
    # [59] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
    # [61] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
    # [63] "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"              
    # [65] "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"              
    # [67] "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
    # [69] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"             
    # [71] "fBodyAccMag-std()"               "fBodyAccMag-meanFreq()"         
    # [73] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
    # [75] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
    # [77] "fBodyBodyGyroMag-std()"          "fBodyBodyGyroMag-meanFreq()"    
    # [79] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
    # [81] "fBodyBodyGyroJerkMag-meanFreq()" "activity_description"           
 

    table_combined  <- merge(table_combined, table_activity, 
                             by = "activity_id", all.X = TRUE)
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
    colnames(table_trainy)      <<- "activity_id"
    colnames(table_strain)      <<- "subject_id"

    colnames(table_testx)       <<- table_features[,2]
    colnames(table_testy)       <<- "activity_id"
    colnames(table_stest)       <<- "subject_id"

}

#-------------------------------
rename_variables <- function() {

    # give the newly merged data set some descritive variable names

    column_names     <<- colnames(new_table)

    # This still has hundreds of entries.

    for (i in 1:length(column_names)) {
        column_names[i] <<-  gsub("\\()","",column_names[i])
        column_names[i] <<-  gsub("^(f)","Frequency",column_names[i])
        column_names[i] <<-  gsub("^(t)","Time",column_names[i])
    };

    colnames(new_table) <<- column_names;
}


#--------------------------------
create_tidy_data <- function() {

    # processing complete, write a tidyish dataset to disk.

    # now, I make no pretence at understanding what this summary
    # is about because I don't really understand the data and
    # what it is doing.  WTF is a FrequencyBodyBodyGyroJerkMag-mean?
    # I don't have a clue.  The spec is rather vague on what needs to
    # go in this tidy file.  It mentions the means and standard
    # deviations, the means of means I suppose would be more correct,
    # sp it SEEMS this function satisfies the specification requirements.
    # If is doesn't, apologies, I must have misunderstood the specification.


    tidy <- summary(new_table)
    write.table(tidy, 'tidy.txt', row.names=FALSE, sep='\t\t');

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

    print("checking file integrity .......")

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
    print("")
    print("Features   .....")
    table_features  <- read.table("features.txt")
    print("Activity Labels.....")
    table_activity  <- read.table("activity_labels.txt")
    print("Training Data X   .....")

    table_trainx    <- read.table("train/X_train.txt")
    print("Training Data Y   .....")
    table_trainy    <- read.table("train/y_train.txt")
    print("Training Subjects    .....")
    table_strain    <- read.table("train/subject_train.txt")
    print("Test Data X.....")

    table_testx     <- read.table("test/X_test.txt")
    print("Test Data Y.....")
    table_testy     <- read.table("test/y_test.txt")
    print("Test Subject Data.....")
    table_stest     <- read.table("test/subject_test.txt")
    print("Merging Test and Training Data   .....")

}

rename_activities()
new_table <- combine_datasets()
rename_variables()
create_tidy_data()
print("Data set created in ./data/UCI/tidy.txt   -  Remove this file to re-run this script.  Thank you.")


# --------------- EOF -----------------------------------
