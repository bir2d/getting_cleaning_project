#################################################################################################
#STEP 1: Merges the training and the test sets to create one data set.###########################
#################################################################################################

#Training and test features data is loaded
features <- read.table("train/X_train.txt", header = FALSE)
features_test <- read.table("test/X_test.txt", header = FALSE)

#Training and test subject data is loaded
subject <- read.table("train/subject_train.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)

#Training and test features data is loaded
activity <- read.table("train/y_train.txt", header = FALSE)
activity_test <- read.table("test/y_test.txt", header = FALSE)

#joins training and testing data in a single data set
all_features <- rbind(features,features_test)
all_subject <- rbind(subject,subject_test)
all_activity <- rbind(activity,activity_test)
#################################################################################################
#STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.#
#################################################################################################

#the names of the feature columns are loaded and assigned to the data set names

features_names <- read.table("features.txt", head=FALSE)
names(all_features)<- features_names$V2

#filter names with mean or  mean and standard deviation
filter_names<-as.character( features_names$V2[grepl("mean\\(\\)|std\\(\\)",features_names$V2)])

#create a sub set with only filter names (mean or str columns)
all_features_filter_names<-all_features[,filter_names]


#################################################################################################
#STEP 3: Uses descriptive activity names to name the activities in the data set.#################
#################################################################################################

#load activity names
activity_names <- read.table("activity_labels.txt", head=FALSE)

#create a factor to descriptive activity
all_activity$V1 <- factor(all_activity$V1, levels = as.integer(activity_names$V1), labels = activity_names$V2)


#################################################################################################
#STEP 4: Uses descriptive activity names to name the activities in the data set.#################
#################################################################################################

names(all_activity)<- c("activity")
names(all_subject)<-c("subject")


#################################################################################################
#STEP 4: From the data set in step 4, create a second, independent tidy data set with the       #
#average of each variable for each activity and each subject.####################################
#################################################################################################

#join activity, subject and features to calculate the average
all_data<- cbind(cbind(all_activity,all_subject),all_features_filter_names)

#calculate average for each activity and each subject
tidy_data<-aggregate(all_data, by = list(all_data$subject, all_data$activity), FUN = mean)

#remove columns non-aggregated sub and act columns
tidy_data<- subset(tidy_data, select=-c(activity,subject))

#rename grouping columns
names(tidy_data)[2] <- "Activity"
names(tidy_data)[1] <- "Subject"

#print head of final data
head(tidy_data)



