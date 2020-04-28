##

library(dplyr)
library(tidyr)
source("correct_name.R")

## Read and store the activity labels into a vector called activity_vector 
activity_df <- read.table("./UCI HAR Dataset/activity_labels.txt",
                          stringsAsFactors = FALSE)
activity_vector <- tolower(activity_df[,2])

## Read and store the feature names into a vector called feature_vector 
feature_df <- read.table("./UCI HAR Dataset/features.txt",
                          stringsAsFactors = FALSE)
feature_vector <- feature_df[,2]
    
## Read and store test subjects from subject_test.txt into a dataframe 
## called subject_test and change the column name to subject
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") %>%
    rename(subject = V1)

## Replace the integers from "y_test.txt" with the corresponding activity description and 
## store the result in a dataframe called activity_test
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt") %>%
    rename(activity = V1) %>%
    mutate(activity = activity_vector[activity])

## Read and store the test results from X_test.txt into a dataframe called results_test
results_test <- read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)
names(results_test) <- feature_vector

## Merge subject_test, activity_test and results_test into a single dataframe called test_data
test_data <- cbind(subject_test, activity_test, results_test)

## Read and store train subjects from subject_train.txt into a dataframe 
## called subject_train and change the column name to subject
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") %>%
    rename(subject = V1)

## Replace the integers from "y_train.txt" with the corresponding activity description and 
## store the result in a dataframe called activity_train
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt") %>%
    rename(activity = V1) %>%
    mutate(activity = activity_vector[activity])

## Read and store the train results from X_train.txt into a dataframe called results_train
results_train <- read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)
names(results_train) <- feature_vector

## Merge subject_train, activity_train and results_train into a single dataframe called train_data
train_data <- cbind(subject_train, activity_train, results_train)

## Merge the training and test sets into one data set
full_data <- rbind(train_data, test_data)

## Find the column indices of the means and standard deviations
wanted <- grep("mean\\(\\)|std\\(\\)", feature_vector)+2

## Extracts only the measurements on the mean and standard deviation from the combined data set
wanted_data <- full_data[, c(1:2, wanted)]
names_split <- strsplit(names(wanted_data[,3:ncol(wanted_data)]), "-")
names(wanted_data)[3:ncol(wanted_data)] <- sapply(names_split, correct_name)

## Create a tidy data set with the average of each feature for each activity and each subject
tidy_data <- group_by(wanted_data, subject, activity) %>%
    summarize_all(mean) %>%
    ungroup %>%
    gather("measure_variable", "result", -(subject:activity)) %>%
    separate(measure_variable, into = c("measure", "variable"), sep = "-") %>%
    spread(variable, result)


