
Code Book
=====================

**Human Activity Recognition Using Smartphones Dataset**


##File
run_analysis.R

##Author 
Jeff isenhart

##Description of run_analysis.R processing:

**Requirements/Assumptions**

You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 

> Note: Assume this implies columns containing -mean() and -std()

* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and 
each subject. 

**Process Prerequisites**

* data.table is installed in the current environment
* Data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
is extracted and the directory "UCI HAR Dataset" is in the working directory
     
**run_analysis.R Process**     

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
     prefix data columns with MeanOf_ to indicate their aggregation
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
		FrequencyDomainBodyAcceleration_Mean_X
		FrequencyDomainBodyAcceleration_Mean_Y
		FrequencyDomainBodyAcceleration_Mean_Z
		FrequencyDomainBodyAcceleration_StandardDeviation_X
		FrequencyDomainBodyAcceleration_StandardDeviation_Y
		FrequencyDomainBodyAcceleration_StandardDeviation_Z
		FrequencyDomainBodyAccelerationJerk_Mean_X
		FrequencyDomainBodyAccelerationJerk_Mean_Y
		FrequencyDomainBodyAccelerationJerk_Mean_Z
		FrequencyDomainBodyAccelerationJerk_StandardDeviation_X
		FrequencyDomainBodyAccelerationJerk_StandardDeviation_Y
		FrequencyDomainBodyAccelerationJerk_StandardDeviation_Z
		FrequencyDomainBodyGyroscope_Mean_X
		FrequencyDomainBodyGyroscope_Mean_Y
		FrequencyDomainBodyGyroscope_Mean_Z
		FrequencyDomainBodyGyroscope_StandardDeviation_X
		FrequencyDomainBodyGyroscope_StandardDeviation_Y
		FrequencyDomainBodyGyroscope_StandardDeviation_Z
		FrequencyDomainBodyAccelerationMagnitude_Mean
		FrequencyDomainBodyAccelerationMagnitude_StandardDeviation
		FrequencyDomainBodyBodyAccelerationJerkMagnitude_Mean
		FrequencyDomainBodyBodyAccelerationJerkMagnitude_StandardDeviation
		FrequencyDomainBodyBodyGyroscopeMagnitude_Mean
		FrequencyDomainBodyBodyGyroscopeMagnitude_StandardDeviation
		FrequencyDomainBodyBodyGyroscopeJerkMagnitude_Mean
		FrequencyDomainBodyBodyGyroscopeJerkMagnitude_StandardDeviation
		

**theSummarizedDataSet.txt**
 
     180 observations of  68 variables
     
     Columns
     	Activities
		Subjects
		MeanOf_TimeBodyAcceleration_Mean_X
		MeanOf_TimeBodyAcceleration_Mean_Y
		MeanOf_TimeBodyAcceleration_Mean_Z
		MeanOf_TimeBodyAcceleration_StandardDeviation_X
		MeanOf_TimeBodyAcceleration_StandardDeviation_Y
		MeanOf_TimeBodyAcceleration_StandardDeviation_Z
		MeanOf_TimeGravityAcceleration_Mean_X
		MeanOf_TimeGravityAcceleration_Mean_Y
		MeanOf_TimeGravityAcceleration_Mean_Z
		MeanOf_TimeGravityAcceleration_StandardDeviation_X
		MeanOf_TimeGravityAcceleration_StandardDeviation_Y
		MeanOf_TimeGravityAcceleration_StandardDeviation_Z
		MeanOf_TimeBodyAccelerationJerk_Mean_X
		MeanOf_TimeBodyAccelerationJerk_Mean_Y
		MeanOf_TimeBodyAccelerationJerk_Mean_Z
		MeanOf_TimeBodyAccelerationJerk_StandardDeviation_X
		MeanOf_TimeBodyAccelerationJerk_StandardDeviation_Y
		MeanOf_TimeBodyAccelerationJerk_StandardDeviation_Z
		MeanOf_TimeBodyGyroscope_Mean_X
		MeanOf_TimeBodyGyroscope_Mean_Y
		MeanOf_TimeBodyGyroscope_Mean_Z
		MeanOf_TimeBodyGyroscope_StandardDeviation_X
		MeanOf_TimeBodyGyroscope_StandardDeviation_Y
		MeanOf_TimeBodyGyroscope_StandardDeviation_Z
		MeanOf_TimeBodyGyroscopeJerk_Mean_X
		MeanOf_TimeBodyGyroscopeJerk_Mean_Y
		MeanOf_TimeBodyGyroscopeJerk_Mean_Z
		MeanOf_TimeBodyGyroscopeJerk_StandardDeviation_X
		MeanOf_TimeBodyGyroscopeJerk_StandardDeviation_Y
		MeanOf_TimeBodyGyroscopeJerk_StandardDeviation_Z
		MeanOf_TimeBodyAccelerationMagnitude_Mean
		MeanOf_TimeBodyAccelerationMagnitude_StandardDeviation
		MeanOf_TimeGravityAccelerationMagnitude_Mean
		MeanOf_TimeGravityAccelerationMagnitude_StandardDeviation
		MeanOf_TimeBodyAccelerationJerkMagnitude_Mean
		MeanOf_TimeBodyAccelerationJerkMagnitude_StandardDeviation
		MeanOf_TimeBodyGyroscopeMagnitude_Mean
		MeanOf_TimeBodyGyroscopeMagnitude_StandardDeviation
		MeanOf_TimeBodyGyroscopeJerkMagnitude_Mean
		MeanOf_TimeBodyGyroscopeJerkMagnitude_StandardDeviation
		MeanOf_FrequencyDomainBodyAcceleration_Mean_X
		MeanOf_FrequencyDomainBodyAcceleration_Mean_Y
		MeanOf_FrequencyDomainBodyAcceleration_Mean_Z
		MeanOf_FrequencyDomainBodyAcceleration_StandardDeviation_X
		MeanOf_FrequencyDomainBodyAcceleration_StandardDeviation_Y
		MeanOf_FrequencyDomainBodyAcceleration_StandardDeviation_Z
		MeanOf_FrequencyDomainBodyAccelerationJerk_Mean_X
		MeanOf_FrequencyDomainBodyAccelerationJerk_Mean_Y
		MeanOf_FrequencyDomainBodyAccelerationJerk_Mean_Z
		MeanOf_FrequencyDomainBodyAccelerationJerk_StandardDeviation_X
		MeanOf_FrequencyDomainBodyAccelerationJerk_StandardDeviation_Y
		MeanOf_FrequencyDomainBodyAccelerationJerk_StandardDeviation_Z
		MeanOf_FrequencyDomainBodyGyroscope_Mean_X
		MeanOf_FrequencyDomainBodyGyroscope_Mean_Y
		MeanOf_FrequencyDomainBodyGyroscope_Mean_Z
		MeanOf_FrequencyDomainBodyGyroscope_StandardDeviation_X
		MeanOf_FrequencyDomainBodyGyroscope_StandardDeviation_Y
		MeanOf_FrequencyDomainBodyGyroscope_StandardDeviation_Z
		MeanOf_FrequencyDomainBodyAccelerationMagnitude_Mean
		MeanOf_FrequencyDomainBodyAccelerationMagnitude_StandardDeviation
		MeanOf_FrequencyDomainBodyBodyAccelerationJerkMagnitude_Mean
		MeanOf_FrequencyDomainBodyBodyAccelerationJerkMagnitude_StandardDeviation
		MeanOf_FrequencyDomainBodyBodyGyroscopeMagnitude_Mean
		MeanOf_FrequencyDomainBodyBodyGyroscopeMagnitude_StandardDeviation
		MeanOf_FrequencyDomainBodyBodyGyroscopeJerkMagnitude_Mean
		MeanOf_FrequencyDomainBodyBodyGyroscopeJerkMagnitude_StandardDeviation
     
     