#This script creates a tidy data set for the Coursera 'Getting & Cleaning Data' project
#The data set uses the 'Human Activity Recognition' HAR data set. See Readme & Codebook for further details

#set the working directory (wd) to this script's location

#01: DOWNLOAD FILE
#Download zip file containing the data into the wd (comment this out if already downloaded)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="HAR.zip", method="auto")
zipfile <- "HAR.zip"


#02: READING TEST DATA

#2a: read the column names from the features file and store as a vector
features <- read.table(unz(zipfile, "UCI HAR Dataset/features.txt"))
cNames <- as.character(features[,2])

#2b: read test data
#read in the test data (space separated txt file). 
#set column names (with check.names=FALSE so they don't get truncated)
test_x_file <- "UCI HAR Dataset/test/X_test.txt"
test_x <- read.table(unz(zipfile, test_x_file), sep="", 
                     col.names=cNames, check.names=FALSE)

#2c: read in the test data activities
test_y_file <- "UCI HAR Dataset/test/y_test.txt"
test_y <- read.table(unz(zipfile, test_y_file), sep="", col.names="act_code")

#2d: read in the test data subjects
test_s_file <- "UCI HAR Dataset/test/subject_test.txt"
test_s <- read.table(unz(zipfile, test_s_file), sep="", col.names="subject")

#2e: add columns together for subject, activity, x variables
test_final <- cbind(test_s, test_y, test_x)


#03: READING TRAIN DATA

#3b: read in the train data
train_x_file <- "UCI HAR Dataset/train/X_train.txt"
train_x <- read.table(unz(zipfile, train_x_file), sep="", 
                    col.names=cNames, check.names=FALSE)

#3c: read in the train data activities
train_y_file <- "UCI HAR Dataset/train/y_train.txt"
train_y <- read.table(unz(zipfile, train_y_file), sep="", col.names="act_code")

#3d: read in the train data subjects
train_s_file <- "UCI HAR Dataset/train/subject_train.txt"
train_s <- read.table(unz(zipfile, train_s_file), sep="", col.names="subject")

#3e: add columns together for subject, activity, x variables
train_final <- cbind(train_s, train_y, train_x)


#04: UNION TEST + TRAIN
#join the test + train frames together
#binds on common columns - they should have same structure
train_test <- rbind(test_final, train_final)


##05: CREATE FULL HAR DATA SET
#add the activity description to the combined test / train data set
act_labels_file <- "UCI HAR Dataset/activity_labels.txt"
act_labels <- read.table(unz(zipfile, act_labels_file), sep="", 
                         col.names=c("act_code", "activity"))

#creates the data set HAR_full (this has 81 columns and 10,299 rows)
HAR_full <- merge(act_labels, train_test, by.x="act_code", by.y="act_code")


#06: EXTRACT COLUMNS WITH MEAN & STD MEASURES
#46 columns contain 'mean' + 33 columns contain 'std'
#(not included are 7 additional 'angle' measurements with Mean in variable name)
#use following line of code to check
#grep("Mean", cNames2, value=TRUE, fixed=TRUE) 
#79 variable columns extracted (plus the activity & subject columns) = 81 columns

cNames2 <- names(HAR_full)

HAR_part <- HAR_full[, grep("activity|subject|mean|std", cNames2)]


#07: RENAME VARIABLE COLUMNS
#cleanup names of variables by removing the redundant () and converting - to .
#follows the syntactically valid naming convention used by make.names
names(HAR_part) <- make.names(gsub("\\(|\\)","",names(HAR_part)))


#08: CALCULATE VARIABLE MEANS By SUBJECT & ACTIVITY
library(dplyr) #loads dplyr package
#first group by activity, subject
HAR_part <- group_by(HAR_part, activity, subject)

#then create a summary of means for each variable (grouped by activity & subject)
#final tidy data set has 180 rows and 81 columns
HAR_tidy <- summarise_each(HAR_part, funs(mean))

#09: TABLE OF COUNTS
#shows the number of observations for each subject & activity
table(HAR_part$subject, HAR_part$activity, useNA="ifany")

#shows the final data set has 1 row per subject & activity combination
table(HAR_tidy$subject, HAR_tidy$activity, useNA="ifany")


#10: WRITE OUT TXT FILE FOR SUBMISSION
write.table(HAR_tidy,file="HAR_tidy.txt",row.names=FALSE)

#11: CODE TO READ FILE BACK INTO R
#read file into R (assuming file is in your working directory)
df_submitted <- read.table("HAR_tidy.txt", header=TRUE, sep=" ")