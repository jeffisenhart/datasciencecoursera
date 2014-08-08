
Code Book
=====================

**Human Activity Recognition Using Smartphones Dataset**


##File
run_analysis.R

##Author 
Jeff isenhart

Description of run_analysis.R processing:

**Requirements/Assumptions**

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
> Note: Assume this implies columns containing -mean() and -std()

Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and 
each subject. 

**Process Prerequisites**

     1) data.table is installed in the current environment
     2) Data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
     is extracted and the directory "UCI HAR Dataset" is in the working directory
     
**Process**     

     loads data.table library
     
     loads  UCI HAR Dataset/test/X_test.txt
     loads  UCI HAR Dataset/test/y_test.txt
     loads  UCI HAR Dataset/test/subject_test.txt
     
     loads  UCI HAR Dataset/train/X_train.txt
     loads  UCI HAR Dataset/train/y_train.txt
     loads  UCI HAR Dataset/train/subject_train.txt
     
     column merges y_test.txt, subject_test.txt and X_text.txt together
     column merges y_train.txt, subject_train.txt and X_train.txt together
     
     row merges the two columns
     
     loads  UCI HAR Dataset/features.txt to create columns
     add colums "Activity" and "Subject" in the first to positions of the columns respectively
     iterate over columns to keep "Activity", "Subject", and any column containing -mean() or -std()
     
     > Note: Assume this implies columns containing -mean() and -std()
     
     the outcome of column iteration becomes the datasets column names
     loads  UCI HAR Dataset/activity_labels.txt to replace activity values with labels
     format the columns (other than Activity and Subject columns) to make them easier to read and 
     understand
     write the dataset to a file called theDataSet.txt
     aggregate data - take the mean of all columns (except Activity and Subject) and group by 
     Activity and Subject
     write this data set to a file called theSummarizedDataSet.txt
     

     
 **theDataSet.txt**
 
 
 	10300 observations of  68 variables
 	
 	Columns
 		Activity
		Subject
		TimeBodyAcceleration_Mean_X
		TimeBodyAcceleration_Mean_Y
		TimeBodyAcceleration_Mean_Z
		TimeBodyAcceleration_StandardDeviation_X
		TimeBodyAcceleration_StandardDeviation_Y
		TimeBodyAcceleration_StandardDeviation_Z
		TimeGravityAcceleration_Mean_X
		TimeGravityAcceleration_Mean_Y
		TimeGravityAcceleration_Mean_Z
		TimeGravityAcceleration_StandardDeviation_X
		TimeGravityAcceleration_StandardDeviation_Y
		TimeGravityAcceleration_StandardDeviation_Z
		TimeBodyAccelerationJerk_Mean_X
		TimeBodyAccelerationJerk_Mean_Y
		TimeBodyAccelerationJerk_Mean_Z
		TimeBodyAccelerationJerk_StandardDeviation_X
		TimeBodyAccelerationJerk_StandardDeviation_Y
		TimeBodyAccelerationJerk_StandardDeviation_Z
		TimeBodyGyroscope_Mean_X
		TimeBodyGyroscope_Mean_Y
		TimeBodyGyroscope_Mean_Z
		TimeBodyGyroscope_StandardDeviation_X
		TimeBodyGyroscope_StandardDeviation_Y
		TimeBodyGyroscope_StandardDeviation_Z
		TimeBodyGyroscopeJerk_Mean_X
		TimeBodyGyroscopeJerk_Mean_Y
		TimeBodyGyroscopeJerk_Mean_Z
		TimeBodyGyroscopeJerk_StandardDeviation_X
		TimeBodyGyroscopeJerk_StandardDeviation_Y
		TimeBodyGyroscopeJerk_StandardDeviation_Z
		TimeBodyAccelerationMagnitude_Mean
		TimeBodyAccelerationMagnitude_StandardDeviation
		TimeGravityAccelerationMagnitude_Mean
		TimeGravityAccelerationMagnitude_StandardDeviation
		TimeBodyAccelerationJerkMagnitude_Mean
		TimeBodyAccelerationJerkMagnitude_StandardDeviation
		TimeBodyGyroscopeMagnitude_Mean
		TimeBodyGyroscopeMagnitude_StandardDeviation
		TimeBodyGyroscopeJerkMagnitude_Mean
		TimeBodyGyroscopeJerkMagnitude_StandardDeviation
		fBodyAcceleration_Mean_X
		fBodyAcceleration_Mean_Y
		fBodyAcceleration_Mean_Z
		fBodyAcceleration_StandardDeviation_X
		fBodyAcceleration_StandardDeviation_Y
		fBodyAcceleration_StandardDeviation_Z
		fBodyAccelerationJerk_Mean_X
		fBodyAccelerationJerk_Mean_Y
		fBodyAccelerationJerk_Mean_Z
		fBodyAccelerationJerk_StandardDeviation_X
		fBodyAccelerationJerk_StandardDeviation_Y
		fBodyAccelerationJerk_StandardDeviation_Z
		fBodyGyroscope_Mean_X
		fBodyGyroscope_Mean_Y
		fBodyGyroscope_Mean_Z
		fBodyGyroscope_StandardDeviation_X
		fBodyGyroscope_StandardDeviation_Y
		fBodyGyroscope_StandardDeviation_Z
		fBodyAccelerationMagnitude_Mean
		fBodyAccelerationMagnitude_StandardDeviation
		fBodyBodyAccelerationJerkMagnitude_Mean
		fBodyBodyAccelerationJerkMagnitude_StandardDeviation
		fBodyBodyGyroscopeMagnitude_Mean
		fBodyBodyGyroscopeMagnitude_StandardDeviation
		fBodyBodyGyroscopeJerkMagnitude_Mean
		fBodyBodyGyroscopeJerkMagnitude_StandardDeviation
		

**theSummarizedDataSet.txt**
 
     180 observations of  68 variables
     
     Columns
     	Activity
		Subject
		TimeBodyAcceleration_Mean_X
		TimeBodyAcceleration_Mean_Y
		TimeBodyAcceleration_Mean_Z
		TimeBodyAcceleration_StandardDeviation_X
		TimeBodyAcceleration_StandardDeviation_Y
		TimeBodyAcceleration_StandardDeviation_Z
		TimeGravityAcceleration_Mean_X
		TimeGravityAcceleration_Mean_Y
		TimeGravityAcceleration_Mean_Z
		TimeGravityAcceleration_StandardDeviation_X
		TimeGravityAcceleration_StandardDeviation_Y
		TimeGravityAcceleration_StandardDeviation_Z
		TimeBodyAccelerationJerk_Mean_X
		TimeBodyAccelerationJerk_Mean_Y
		TimeBodyAccelerationJerk_Mean_Z
		TimeBodyAccelerationJerk_StandardDeviation_X
		TimeBodyAccelerationJerk_StandardDeviation_Y
		TimeBodyAccelerationJerk_StandardDeviation_Z
		TimeBodyGyroscope_Mean_X
		TimeBodyGyroscope_Mean_Y
		TimeBodyGyroscope_Mean_Z
		TimeBodyGyroscope_StandardDeviation_X
		TimeBodyGyroscope_StandardDeviation_Y
		TimeBodyGyroscope_StandardDeviation_Z
		TimeBodyGyroscopeJerk_Mean_X
		TimeBodyGyroscopeJerk_Mean_Y
		TimeBodyGyroscopeJerk_Mean_Z
		TimeBodyGyroscopeJerk_StandardDeviation_X
		TimeBodyGyroscopeJerk_StandardDeviation_Y
		TimeBodyGyroscopeJerk_StandardDeviation_Z
		TimeBodyAccelerationMagnitude_Mean
		TimeBodyAccelerationMagnitude_StandardDeviation
		TimeGravityAccelerationMagnitude_Mean
		TimeGravityAccelerationMagnitude_StandardDeviation
		TimeBodyAccelerationJerkMagnitude_Mean
		TimeBodyAccelerationJerkMagnitude_StandardDeviation
		TimeBodyGyroscopeMagnitude_Mean
		TimeBodyGyroscopeMagnitude_StandardDeviation
		TimeBodyGyroscopeJerkMagnitude_Mean
		TimeBodyGyroscopeJerkMagnitude_StandardDeviation
		fBodyAcceleration_Mean_X
		fBodyAcceleration_Mean_Y
		fBodyAcceleration_Mean_Z
		fBodyAcceleration_StandardDeviation_X
		fBodyAcceleration_StandardDeviation_Y
		fBodyAcceleration_StandardDeviation_Z
		fBodyAccelerationJerk_Mean_X
		fBodyAccelerationJerk_Mean_Y
		fBodyAccelerationJerk_Mean_Z
		fBodyAccelerationJerk_StandardDeviation_X
		fBodyAccelerationJerk_StandardDeviation_Y
		fBodyAccelerationJerk_StandardDeviation_Z
		fBodyGyroscope_Mean_X
		fBodyGyroscope_Mean_Y
		fBodyGyroscope_Mean_Z
		fBodyGyroscope_StandardDeviation_X
		fBodyGyroscope_StandardDeviation_Y
		fBodyGyroscope_StandardDeviation_Z
		fBodyAccelerationMagnitude_Mean
		fBodyAccelerationMagnitude_StandardDeviation
		fBodyBodyAccelerationJerkMagnitude_Mean
		fBodyBodyAccelerationJerkMagnitude_StandardDeviation
		fBodyBodyGyroscopeMagnitude_Mean
		fBodyBodyGyroscopeMagnitude_StandardDeviation
		fBodyBodyGyroscopeJerkMagnitude_Mean
		fBodyBodyGyroscopeJerkMagnitude_StandardDeviation
     
     