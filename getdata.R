## This R-script is used to download and unzip the data required for the assignment

## Download the data from the web and save it as "wearable.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "wearable.zip", method = "curl")

## Unzip "wearable.zip"
unzip("wearable.zip")