## Download and unzip the Samsung Data to a folder on the desktop

## Set the working directory in R to the folder that contains the top level folder of the data set 

## In this case the folder is "UCI HAR Dataset"

## Read the Activity Labels into a dataframe

Act_Labels <- read.table("activity_labels.txt");

##set colnames

colnames(Act_Labels)[1] <- "Activity";
colnames(Act_Labels)[2] <- "ActivityName";


## Read the Feautre names (Variables) into a dataframe - 561 of them

df_feat <- read.table("features.txt");

## Read the subject dataset for the test data set

subj_test <- read.table("./test/subject_test.txt");

## Read the subject dataset for the train data set

subj_train <- read.table("./train/subject_train.txt");

## Read the test data set of observations for 561 variables and 2947 observations

X_test <- read.table("./test/X_test.txt");

## read the activity labels corresponding to the test dataset

Y_test <- read.table("./test/Y_test.txt");

##Read the training data set from the train folder

X_train <- read.table("./train/X_train.txt");

## read the activity labels corresponding to the training dataset

Y_train <- read.table("./train/Y_train.txt");

## combine the data in sub_test, Y_test and X_test to create new dataset which has the subject, activity labels plus the 561 variables

test_ds <- cbind(subj_test, Y_test, X_test);

## rename the first column of the new dataset as 'Subject' and 2nd column as Activity

colnames(test_ds)[1] <- "Subject";
colnames(test_ds)[2] <- "Activity";

##combine the data in sub_train, X_train, Y_train to create new dataset which has the subject, activity labels plus the 561 variables

train_ds <- cbind(subj_train, Y_train, X_train);

## rename the first column of the new dataset as 'Subject' and 2nd column as Activity

colnames(train_ds)[1] <- "Subject";
colnames(train_ds)[2] <- "Activity";

## merge the test and train datasets and create a new dataset called full_ds

full_ds <- rbind(test_ds, train_ds);


## merge the Activity Labels into the full_ds dataset to get meaningful activity names

full_ds2 <- merge(Act_Labels, full_ds, by.x = "Activity", by.y = "Activity");

## now select only variables that contain mean and std in the variable name

meancols <- grep("mean", df_feat$V2);
stdcols <- grep("std", df_feat$V2);
selcols <- c(meancols, stdcols)
selcols <- selcols + 3;
selcols <- sort(selcols);

## create the final dataset with Activity Name, Subject and variables containing "std" and "mean"
full_ds3 <- full_ds2[, c(2:3,selcols)];

##remove () and comma from the feature names

df_feat2 <- lapply(df_feat, gsub, pattern="\\(", replacement="");
df_feat2 <- lapply(df_feat2, gsub, pattern="\\)", replacement="");
df_feat2 <- lapply(df_feat2, gsub, pattern="\\,", replacement="-");

df_feat3 <- df_feat2$V2;

df_feat3 <- df_feat3[selcols - 3];

## add meaningful names to the final dataset

colnames(full_ds3)[3:81] <- df_feat3;

## use the dplyr package to group and summarize

library(dplyr);

## create a final tidy dataset with average of each variable grouped by Activity and Subject

full_ds4 <- full_ds3 %>% group_by(ActivityName, Subject) %>% summarize_all(funs(mean));

## save tidy datset to file

write.table(full_ds4,file = "TidyDataProject.txt", row.name = FALSE);













