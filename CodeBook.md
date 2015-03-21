#Codebook for Tidy Data Set

##Project Description:
This codebook describes the data cleaning process used for the Coursera 'Getting and Cleaning Data' course project. The task related to cleaning a set of data relating to 'Human Activity Recognition' gathered using Smartphone accelerometer and gyroscope sensors. In brief the process involved (see below for more detail):

- Downloading the data set from the UCI Machine Learning Repository
- Combining several data sets together
- Extracting only the mean & standard deviation measures of interest
- Tidying variable names and adding descriptive activity names
- From this creating a summarised data set (with one record per subject & activity)

##Original raw data:
The original data was sourced from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

See more information on this this data set at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


##Process used to create tidy data:
- read in source data zip file from url
- read in the test data set (& join subjects / activities)
- read in the train data set (& join subjects / activities)
- union test + train data sets together
- add activity descriptions. This creates the HAR_full data set of 564 columns and 10,299 rows)
- extract only the mean / standard deviation variables + the activity/subject (81 columns)
- rename variables to remove () & - characters (to by syntactically valid in R). This creates the HAR_part data set of 81 columns and 10,299 rows)
- create a summarised table with one observation per activity & subject combination, with the mean of each of the variables. This creates the HAR_tidy data set for submission with 81 columns and 180 rows.
- provide cross-tab tables showing counts for HAR_part and HAR_tidy
- output the HAR_tidy data set to a txt file. This HAR_tidy.txt file is the one submitted to Coursera.

##Code to read the tidy data set:
Place the HAR_tidy.txt file in your working directory, then run following line of code.

df_submitted <- read.table("HAR_tidy.txt", header=TRUE, sep=" ")


##Resulting data set:
The summarised tidy data set has the following dimensions:
- 81 columns (the activity and subject followed by 79 variable measures)
- 180 rows (one row for each of the 30 subjects and 6 activities)

##Description of measures:
The following is taken from the features_info.txt file available in the zipped data set.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##Variable Names:
- activity
- subject
- tBodyAcc.mean.X
- tBodyAcc.mean.Y
- tBodyAcc.mean.Z
- tBodyAcc.std.X
- tBodyAcc.std.Y
- tBodyAcc.std.Z
- tGravityAcc.mean.X
- tGravityAcc.mean.Y
- tGravityAcc.mean.Z
- tGravityAcc.std.X
- tGravityAcc.std.Y
- tGravityAcc.std.Z
- tBodyAccJerk.mean.X
- tBodyAccJerk.mean.Y
- tBodyAccJerk.mean.Z
- tBodyAccJerk.std.X
- tBodyAccJerk.std.Y
- tBodyAccJerk.std.Z
- tBodyGyro.mean.X
- tBodyGyro.mean.Y
- tBodyGyro.mean.Z
- tBodyGyro.std.X
- tBodyGyro.std.Y
- tBodyGyro.std.Z
- tBodyGyroJerk.mean.X
- tBodyGyroJerk.mean.Y
- tBodyGyroJerk.mean.Z
- tBodyGyroJerk.std.X
- tBodyGyroJerk.std.Y
- tBodyGyroJerk.std.Z
- tBodyAccMag.mean
- tBodyAccMag.std
- tGravityAccMag.mean
- tGravityAccMag.std
- tBodyAccJerkMag.mean
- tBodyAccJerkMag.std
- tBodyGyroMag.mean
- tBodyGyroMag.std
- tBodyGyroJerkMag.mean
- tBodyGyroJerkMag.std
- fBodyAcc.mean.X
- fBodyAcc.mean.Y
- fBodyAcc.mean.Z
- fBodyAcc.std.X
- fBodyAcc.std.Y
- fBodyAcc.std.Z
- fBodyAcc.meanFreq.X
- fBodyAcc.meanFreq.Y
- fBodyAcc.meanFreq.Z
- fBodyAccJerk.mean.X
- fBodyAccJerk.mean.Y
- fBodyAccJerk.mean.Z
- fBodyAccJerk.std.X
- fBodyAccJerk.std.Y
- fBodyAccJerk.std.Z
- fBodyAccJerk.meanFreq.X
- fBodyAccJerk.meanFreq.Y
- fBodyAccJerk.meanFreq.Z
- fBodyGyro.mean.X
- fBodyGyro.mean.Y
- fBodyGyro.mean.Z
- fBodyGyro.std.X
- fBodyGyro.std.Y
- fBodyGyro.std.Z
- fBodyGyro.meanFreq.X
- fBodyGyro.meanFreq.Y
- fBodyGyro.meanFreq.Z
- fBodyAccMag.mean
- fBodyAccMag.std
- fBodyAccMag.meanFreq
- fBodyBodyAccJerkMag.mean
- fBodyBodyAccJerkMag.std
- fBodyBodyAccJerkMag.meanFreq
- fBodyBodyGyroMag.mean
- fBodyBodyGyroMag.std
- fBodyBodyGyroMag.meanFreq
- fBodyBodyGyroJerkMag.mean
- fBodyBodyGyroJerkMag.std
- fBodyBodyGyroJerkMag.meanFreq