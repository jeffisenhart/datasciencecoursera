# run_analysis
# Author: Jeff Isenhart

# Purpose: Given data from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# the objective is this program is:
#     1) Merges the training and the test sets to create one data set.
#     2) Extracts only the measurements on the mean and standard deviation for 
#     each measurement. Note: I interpret this to mean column names containing
#     -mean() or -std() from features.txt
#     3) Uses descriptive activity names to name the activities in the data set
#     4) Appropriately labels the data set with descriptive variable names. 
#     5) Creates a second, independent tidy data set with the average of each 
#     variable for each activity and each subject. 

# Prerequisites: 
#     1) data.table is installed in the current inviroment
#     2) Data from zip is extracted and directory "UCI HAR Dataset" is in
#     the working directory

# Output
# For step 4, writes a file in the current directory called theDataSet.txt
# For step 5, writes a file in the current directory called theSummarizedDataSet.txt

library(data.table)
run_analysis <- function(){
      
      
      # Loading test data
      testFrame <- read.table(file.path(".","UCI HAR Dataset", 
                                        "test", 
                                        "X_test.txt"), 
                              header=FALSE)
      testTable <- data.table(testFrame)
      rm(testFrame)
      testActivitiesColumn <- fread(file.path(".",
                                              "UCI HAR Dataset", 
                                              "test", 
                                              "y_test.txt"), 
                                    header=FALSE)
      testSubjectsColumn <- fread(file.path(".",
                                            "UCI HAR Dataset",
                                            "test", 
                                            "subject_test.txt"), 
                                  header=FALSE)
      
      # Load train data
      trainFrame <- read.table(file.path(".",
                                         "UCI HAR Dataset", 
                                         "train", 
                                         "X_train.txt"), 
                               header=FALSE)
      trainTable <- data.table(trainFrame)
      rm(trainFrame)
      trainActivitiesColumn <- fread(file.path(".",
                                               "UCI HAR Dataset", 
                                               "train", 
                                               "y_train.txt"), 
                                     header=FALSE)
      trainSubjectsColumn <- fread(file.path(".",
                                             "UCI HAR Dataset", 
                                             "train", 
                                             "subject_train.txt"),
                                   header=FALSE)
      
      testTable <- cbind( testActivitiesColumn, 
                          testSubjectsColumn,
                          testTable)
      
      trainTable <- cbind( trainActivitiesColumn, 
                           trainSubjectsColumn,
                           trainTable)
      
      mergedTable <- rbind(testTable,trainTable)
      rm(testTable)
      rm(trainTable)
      
      
      # OK, now all data is in one place, so, requirement #1 satisfied
      # Next, lets create a tidy file containing activity, subject, mean and sd
      # Fetch the measurement names
      
      measurementNames <- read.table(file.path(".",
                                               "UCI HAR Dataset", 
                                               "features.txt"),
                                     header=FALSE)
      
      
      
    
     
      # Lets set up some column names for our the tidy outcome
      originalMeasureNames <- as.vector(measurementNames[,2])
      tidyColumnNames <- c("Activity","Subject",originalMeasureNames)
      setnames(mergedTable,tidyColumnNames);
      for( colName in originalMeasureNames ){
            if( length(grep("-mean\\(\\)",colName)) <= 0 & 
                  length(grep("-std\\(\\)",colName)) <= 0 ){
                  # Lets dump this column 
                  mergedTable[,c(colName)] <- NULL
                  
            }
      }
      # Now step 2 is satisfied
      # Now lets tidy up the activity value
      activityTable <- read.table(file.path(".",
                                               "UCI HAR Dataset", 
                                               "activity_labels.txt"),
                                     header=FALSE)
      activityLookup <- c(1:nrow(activityTable))
      names(activityLookup) <- as.vector(activityTable[,2])
      len <- length(activityLookup)
      for( i in (c(1:len)) ){
            mergedTable$Activity[mergedTable$Activity==i] <- names(activityLookup)[i]
      }
      
      # Now lets scrub the column names to make them prettier
      tidyMeasureNames <- colnames(mergedTable)
      tidyMeasureNames <- gsub("^t\\.*","Time",tidyMeasureNames,fixed=F)
      tidyMeasureNames <- gsub("^f\\.*","FrequencyDomain",tidyMeasureNames,fixed=F)
      
      tidyMeasureNames <- gsub("Gyro","Gyroscope",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("Acc","Acceleration",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("Mag","Magnitude",tidyMeasureNames,fixed=T)

      tidyMeasureNames <- gsub("mean()","Mean",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("std()","StandardDeviation",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("mad()","MediaAbsoluteDeviation",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("max()","Maximum",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("min()","Minimum",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("sma()","SignalMagnitudeArea",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("energy()","EnergyMeasure",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("iqr()","InterquartileRange",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("entropy()","SignalEntropy",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("arCoeff()","AutorregresionCoefficients",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("correlation()","CorrelationCoefficient",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("maxInds()","MaxMagnitudeIndex",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("meanFreq()","WeightedFrequencyAverage",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("maxInds()","MaxMagnitudeIndex",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("skewness()","SkewnessOfFrequencyDomain",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("kurtosis()","KurtosisOfFrequencyDomain",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("bandsEnergy()","EngeryOfFrequencyInterval",tidyMeasureNames,fixed=T)
      tidyMeasureNames <- gsub("angle()","Angle",tidyMeasureNames,fixed=T)
      
      tidyMeasureNames <- gsub(",","_",tidyMeasureNames,fixed=F)
      tidyMeasureNames <- gsub("-","_",tidyMeasureNames,fixed=F)
      
      colnames(mergedTable) <- tidyMeasureNames
      # That was step three
      write.table(mergedTable,file.path(".","theDataSet.txt"), row.names=F)
      # Boom, that was step four
      # Now for the aggregation
      aggData <- mergedTable[,lapply(.SD,mean),by=list(Activity,Subject)]
      # Now lets edit the column names of the summarized table to reflect the
      # aggregation
      meanColNames <- paste("MeanOf",colnames(aggData),sep="_")
      meanColNames[1] <- "Activities"
      meanColNames[2] <- "Subject"
      colnames(aggData) <- meanColNames
      write.table(aggData,file.path(".","theSummarizedDataSet.txt"), row.names=F)
      # Step 5 complete, time for a tall cool drink ;)
}