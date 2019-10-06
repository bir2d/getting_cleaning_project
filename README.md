# Getting and Cleaning Data Course Project


The file run_analysis.R load  data source, merge and transform the raw data  to create a tidy data set, load diferents source of working directory and proces them


The process to create a tidy data:
#STEP 1: Merges the training and the test sets to create one data set.

-Training and test features data is loaded
-Training and test subject data is loaded
-Training and test features data is loaded
-joins training and testing data in a single data set

#STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.


-the names of the feature columns are loaded and assigned to the data set names
-create a sub set with only filter names (mean or str columns)

#STEP 3: Uses descriptive activity names to name the activities in the data set.
-load activity names
-create a factor to descriptive activity

#STEP 4: Uses descriptive activity names to name the activities in the data set.

#STEP 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
-join activity, subject and features to calculate the average
-calculate average for each activity and each subject
-remove columns non-aggregated sub and act columns
-rename grouping columns
-create file with final data
