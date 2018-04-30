# GettingAndCleaningData
Repo for submitting Course Project on preparing a Tidy dataset

Following are the steps to create the tidy dataset for the Course Project
--------------------------------------------------------------------------

## Download and unzip the Samsung Data to a folder on the desktop

## Set the working directory in R to the folder that contains the top level folder of the data set 

## In this case the folder is "UCI HAR Dataset"

## Read the Activity Labels into a dataframe

##set colnames to Activity and ActivityName

## Read the Feautre names (Variables) into a dataframe - 561 of them

## Read the subject dataset for the test data set

## Read the subject dataset for the train data set

## Read the test data set of observations for 561 variables and 2947 observations

## read the activity labels corresponding to the test dataset

##Read the training data set from the train folder

## read the activity labels corresponding to the training dataset

## combine the data in sub_test, Y_test and X_test to create new dataset which has the subject, activity labels plus the 561 variables

## rename the first column of the new dataset as 'Subject' and 2nd column as Activity

##combine the data in sub_train, X_train, Y_train to create new dataset which has the subject, activity labels plus the 561 variables

## rename the first column of the new dataset as 'Subject' and 2nd column as Activity

## merge the test and train datasets and create a new dataset called full_ds

## merge the Activity Labels into the full_ds dataset to get meaningful activity names

## now select only variables that contain mean and std in the variable name

## create the final dataset with Activity Name, Subject and variables containing "std" and "mean"

##remove () and comma from the feature names

## add meaningful names to the final dataset

## use the dplyr package to group and summarize

## create a final tidy dataset with average of each variable grouped by Activity and Subject

## save tidy datset to file
