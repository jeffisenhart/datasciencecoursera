
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
     add columns "activity" and "subject" in the first to positions of the columns respectively
     iterate over columns to keep "activity", "subject", and any column containing -mean() or -std()
     
     > Note: Assume this implies columns containing -mean() and -std()
     
     the outcome of column iteration becomes the datasets column names
     loads  UCI HAR Dataset/activity_labels.txt to replace activity values with labels
     format the columns (other than Activity and Subject columns) to make them easier to read and 
     understand
     write the dataset to a file called theDataSet.txt
     aggregate data - take the mean of all columns (except activity and S\subject) and group by 
     activity and subject
     prefix data columns with 'meanof' to indicate their aggregation
     write this data set to a file called theSummarizedDataSet.txt
     
##Data

Note: 

>The study was completed by a third party and has more details on each variable in 

>UCI HAR Dataset/features_info.txt
     
**theSummarizedDataSet.txt**
 
     180 observations of 68 variables
     
     Columns
		activity
		subject
		meanoftimebodyaccelerationmeanx
		meanoftimebodyaccelerationmeany
		meanoftimebodyaccelerationmeanz
		meanoftimebodyaccelerationstandarddeviationx
		meanoftimebodyaccelerationstandarddeviationy
		meanoftimebodyaccelerationstandarddeviationz
		meanoftimegravityaccelerationmeanx
		meanoftimegravityaccelerationmeany
		meanoftimegravityaccelerationmeanz
		meanoftimegravityaccelerationstandarddeviationx
		meanoftimegravityaccelerationstandarddeviationy
		meanoftimegravityaccelerationstandarddeviationz
		meanoftimebodyaccelerationjerkmeanx
		meanoftimebodyaccelerationjerkmeany
		meanoftimebodyaccelerationjerkmeanz
		meanoftimebodyaccelerationjerkstandarddeviationx
		meanoftimebodyaccelerationjerkstandarddeviationy
		meanoftimebodyaccelerationjerkstandarddeviationz
		meanoftimebodygyroscopemeanx
		meanoftimebodygyroscopemeany
		meanoftimebodygyroscopemeanz
		meanoftimebodygyroscopestandarddeviationx
		meanoftimebodygyroscopestandarddeviationy
		meanoftimebodygyroscopestandarddeviationz
		meanoftimebodygyroscopejerkmeanx
		meanoftimebodygyroscopejerkmeany
		meanoftimebodygyroscopejerkmeanz
		meanoftimebodygyroscopejerkstandarddeviationx
		meanoftimebodygyroscopejerkstandarddeviationy
		meanoftimebodygyroscopejerkstandarddeviationz
		meanoftimebodyaccelerationmagnitudemean
		meanoftimebodyaccelerationmagnitudestandarddeviation
		meanoftimegravityaccelerationmagnitudemean
		meanoftimegravityaccelerationmagnitudestandarddeviation
		meanoftimebodyaccelerationjerkmagnitudemean
		meanoftimebodyaccelerationjerkmagnitudestandarddeviation
		meanoftimebodygyroscopemagnitudemean
		meanoftimebodygyroscopemagnitudestandarddeviation
		meanoftimebodygyroscopejerkmagnitudemean
		meanoftimebodygyroscopejerkmagnitudestandarddeviation
		meanoffrequencydomainbodyaccelerationmeanx
		meanoffrequencydomainbodyaccelerationmeany
		meanoffrequencydomainbodyaccelerationmeanz
		meanoffrequencydomainbodyaccelerationstandarddeviationx
		meanoffrequencydomainbodyaccelerationstandarddeviationy
		meanoffrequencydomainbodyaccelerationstandarddeviationz
		meanoffrequencydomainbodyaccelerationjerkmeanx
		meanoffrequencydomainbodyaccelerationjerkmeany
		meanoffrequencydomainbodyaccelerationjerkmeanz
		meanoffrequencydomainbodyaccelerationjerkstandarddeviationx
		meanoffrequencydomainbodyaccelerationjerkstandarddeviationy
		meanoffrequencydomainbodyaccelerationjerkstandarddeviationz
		meanoffrequencydomainbodygyroscopemeanx
		meanoffrequencydomainbodygyroscopemeany
		meanoffrequencydomainbodygyroscopemeanz
		meanoffrequencydomainbodygyroscopestandarddeviationx
		meanoffrequencydomainbodygyroscopestandarddeviationy
		meanoffrequencydomainbodygyroscopestandarddeviationz
		meanoffrequencydomainbodyaccelerationmagnitudemean
		meanoffrequencydomainbodyaccelerationmagnitudestandarddeviation
		meanoffrequencydomainbodybodyaccelerationjerkmagnitudemean
		meanoffrequencydomainbodybodyaccelerationjerkmagnitudestandarddeviation
		meanoffrequencydomainbodybodygyroscopemagnitudemean
		meanoffrequencydomainbodybodygyroscopemagnitudestandarddeviation
		meanoffrequencydomainbodybodygyroscopejerkmagnitudemean
		meanoffrequencydomainbodybodygyroscopejerkmagnitudestandarddeviation
		     
 **theDataSet.txt**
   
 	10299 observations of 68 variables
 	
 	Columns
		activity
		subject
		timebodyaccelerationmeanx
		timebodyaccelerationmeany
		timebodyaccelerationmeanz
		timebodyaccelerationstandarddeviationx
		timebodyaccelerationstandarddeviationy
		timebodyaccelerationstandarddeviationz
		timegravityaccelerationmeanx
		timegravityaccelerationmeany
		timegravityaccelerationmeanz
		timegravityaccelerationstandarddeviationx
		timegravityaccelerationstandarddeviationy
		timegravityaccelerationstandarddeviationz
		timebodyaccelerationjerkmeanx
		timebodyaccelerationjerkmeany
		timebodyaccelerationjerkmeanz
		timebodyaccelerationjerkstandarddeviationx
		timebodyaccelerationjerkstandarddeviationy
		timebodyaccelerationjerkstandarddeviationz
		timebodygyroscopemeanx
		timebodygyroscopemeany
		timebodygyroscopemeanz
		timebodygyroscopestandarddeviationx
		timebodygyroscopestandarddeviationy
		timebodygyroscopestandarddeviationz
		timebodygyroscopejerkmeanx
		timebodygyroscopejerkmeany
		timebodygyroscopejerkmeanz
		timebodygyroscopejerkstandarddeviationx
		timebodygyroscopejerkstandarddeviationy
		timebodygyroscopejerkstandarddeviationz
		timebodyaccelerationmagnitudemean
		timebodyaccelerationmagnitudestandarddeviation
		timegravityaccelerationmagnitudemean
		timegravityaccelerationmagnitudestandarddeviation
		timebodyaccelerationjerkmagnitudemean
		timebodyaccelerationjerkmagnitudestandarddeviation
		timebodygyroscopemagnitudemean
		timebodygyroscopemagnitudestandarddeviation
		timebodygyroscopejerkmagnitudemean
		timebodygyroscopejerkmagnitudestandarddeviation
		frequencydomainbodyaccelerationmeanx
		frequencydomainbodyaccelerationmeany
		frequencydomainbodyaccelerationmeanz
		frequencydomainbodyaccelerationstandarddeviationx
		frequencydomainbodyaccelerationstandarddeviationy
		frequencydomainbodyaccelerationstandarddeviationz
		frequencydomainbodyaccelerationjerkmeanx
		frequencydomainbodyaccelerationjerkmeany
		frequencydomainbodyaccelerationjerkmeanz
		frequencydomainbodyaccelerationjerkstandarddeviationx
		frequencydomainbodyaccelerationjerkstandarddeviationy
		frequencydomainbodyaccelerationjerkstandarddeviationz
		frequencydomainbodygyroscopemeanx
		frequencydomainbodygyroscopemeany
		frequencydomainbodygyroscopemeanz
		frequencydomainbodygyroscopestandarddeviationx
		frequencydomainbodygyroscopestandarddeviationy
		frequencydomainbodygyroscopestandarddeviationz
		frequencydomainbodyaccelerationmagnitudemean
		frequencydomainbodyaccelerationmagnitudestandarddeviation
		frequencydomainbodybodyaccelerationjerkmagnitudemean
		frequencydomainbodybodyaccelerationjerkmagnitudestandarddeviation
		frequencydomainbodybodygyroscopemagnitudemean
		frequencydomainbodybodygyroscopemagnitudestandarddeviation
		frequencydomainbodybodygyroscopejerkmagnitudemean
		frequencydomainbodybodygyroscopejerkmagnitudestandarddeviation


		     
		     