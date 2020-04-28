# assignment
This repository contains the files required by Getting and Cleaning Data Course Project  
  
There are 3 R scripts in the repository.
* getdata.R
* correct_name.R
* run_analysis.R  

### getdata.R
getdata.R downloads and unzip the data for the project from the web. Run this R scrip first if the dataset has not already been downloaded.  

### correct_name.R
correct_name.R stores a function "correct_name" that parses the feature variable names to get them ready for tidying up. For variables that are measured in 3-axial X, Y and Z with original name like "tBodyAcc-mean()-X", correct_name will change the name to "tBodyAccX-mean()". For variables that are not measured in 3-axial like "tBodyAccMag-mean()", correct_name will return the origninal name.  

The name changes are needed to prepare for the separate step in tidying the data. This R script is automatically sourced in run_analysis.R. 

### run_analysis.R  
run_analysis.R does the following.
1. Create a dataframe test_data that contains the test subjects, activity names and the 561 feature vector as columns
2. Create a dataframe train_data that contains the train subjects, activity names and the 561 feature vector as columns
3. Merge the test_data and train_data sets to create one dataset full_data
4. Extract only the measurements on the mean and standard deviation for each measurement
5. From the data set in step 4, creates a second, independent tidy_data with the average of each variable for each activity and each subject.





