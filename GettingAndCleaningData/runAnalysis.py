# -*- coding: utf-8 -*-
"""
Created on Sun Aug 10 10:17:27 2014

@author: Jeff Isenhart

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

# Output
# For step 4, writes a file in the current directory called theDataSet.txt
# For step 5, writes a file in the current directory called theSummarizedDataSet.txt

"""

import os.path
import csv
import operator
import re
import numpy
import scipy
import pandas

class RunAnalysis:
    def __init__(self,parentDirectory):
        self.parentDirectory = parentDirectory
    
    def __getRows(self, suffix):
        activityCols = []
        subjectCols = []
        dataCols = []
        allRows = []
        testTable = None
        testActivitiesColumn = None
        testSubjectsColumn = None
        with open(os.path.join(self.parentDirectory,suffix,"X_" + suffix + ".txt"), 'rb') as csvfile:
            testTable = csv.reader(csvfile,delimiter=" ",skipinitialspace=True)
            for row in testTable:
                dataCols.append(row)
                
        with open(os.path.join(self.parentDirectory,suffix,"y_" + suffix + ".txt"), 'rb') as csvfile:
            testActivitiesColumn = csv.reader(csvfile,delimiter=" ") 
            for row in testActivitiesColumn:
                activityCols.append(row)
            
        with open(os.path.join(self.parentDirectory,suffix,"subject_" + suffix + ".txt"), 'rb') as csvfile:
            testSubjectsColumn = csv.reader(csvfile,delimiter=" ") 
            for row in testSubjectsColumn:
                subjectCols.append(row)

        
        row_count = sum(1 for row in activityCols)
        
        for idx in range(0,row_count):
            newRow = numpy.concatenate((activityCols[idx],subjectCols[idx],dataCols[idx]))
            allRows.append(newRow)
        return allRows

    def __getMeasurmentNames(self):
        names = []
        names.append("Activity")
        names.append("Subject")
        with open(os.path.join(self.parentDirectory,"features.txt"), 'rb') as csvfile:
            testTable = csv.reader(csvfile,delimiter=" ")
            for row in testTable:
                names.append(row[1])
        row_count = sum(1 for row in names)
        #print "names row count: " + str(row_count)
        return names
        
    def run(self):
        measNames = self.__getMeasurmentNames()
        allRows = []
#        allRows.extend(measNames);
        allRows.extend(self.__getRows("test"))
        allRows.extend(self.__getRows("train"))

        
        df = pandas.DataFrame(data=allRows, columns=measNames,dtype=float);


        counter = 0;
        dropMe = []
        for field in measNames:
            if( counter > 1 ):
                if( not re.search("mean\\(\\)",field) and not re.search("std\\(\\)",field) ):
                    dropMe.append(field)
#                    df.drop(field,axis=1,inplace=True)
            counter = counter + 1
        df = df.drop(dropMe,axis=1)
        
        names = df.columns.tolist()
        newNames = []
        for original in names:
            field = original + ""
            field = re.sub("^t\\.*","Time",field)
            field = re.sub("^f\\.*","FrequencyDomain",field)
            
            field = re.sub("Gyro","Gyroscope",field)
            field = re.sub("Acc","Acceleration",field)
            field = re.sub("Mag","Magnitude",field)
            
            field = re.sub("mean()","Mean",field)
            field = re.sub("std()","StandardDeviation",field)
            field = re.sub("mad()","MediaAbsoluteDeviation",field)
            field = re.sub("max()","Maximum",field)
            field = re.sub("min()","Minimum",field)
            field = re.sub("sma()","SignalMagnitudeArea",field)
            field = re.sub("energy()","EnergyMeasure",field)
            field = re.sub("iqr()","InterquartileRange",field)
            field = re.sub("entropy()","SignalEntropy",field)
            field = re.sub("arCoeff()","AutorregresionCoefficients",field)
            field = re.sub("correlation()","CorrelationCoefficient",field)
            field = re.sub("maxInds()","MaxMagnitudeIndex",field)
            field = re.sub("meanFreq()","WeightedFrequencyAverage",field)
            field = re.sub("maxInds()","MaxMagnitudeIndex",field)
            field = re.sub("skewness()","SkewnessOfFrequencyDomain",field)
            field = re.sub("kurtosis()","KurtosisOfFrequencyDomain",field)
            field = re.sub("bandsEnergy()","EngeryOfFrequencyInterval",field)
            field = re.sub("angle()","Angle",field)
            
            field = re.sub(",","_",field)
            field = re.sub("-","_",field)
            newNames.append(field)

            
        df.columns=newNames
        df.to_csv("/Users/YoHOLLA4/Documents/theDataSet.csv")
        tidy = df.groupby(["Activity","Subject"])
        desc = tidy.mean()
        desc.to_csv("/Users/YoHOLLA4/Documents/theSummarizedDataSet.csv")
#        print desc
        
        
        
        
ra = RunAnalysis("/Users/YoHOLLA4/git/datasciencecoursera/GettingAndCleaningData/UCI HAR Dataset")
ra.run()            