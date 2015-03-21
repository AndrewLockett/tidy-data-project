#Tidy Data Project
Coursera 'Getting &amp; Cleaning Data' Project - Tidy Data 

##This repo contains the following:
- Readme.md - this file describing the process to create the tidy data set (see below)
- Codebook.md - describing the HAR_tidy.txt data set
- run_analysis.R - the R script used to create the tidy data set

##Process used to create tidy data:
- read in source data zip file from url
- read in the test data set (& join subjects / activities)
- read in the train data set (& join subjects / activities)
- union test + train data sets together
- add activity descriptions. This creates a HAR_full data set of 564 columns and 10,299 rows)
- extract only the mean / standard deviation variables + the activity/subject (81 columns)
- rename variables to remove () & - characters (to by syntactically valid in R). This creates as HAR_part data set of 81 columns and 10,299 rows)
- create a summarised table with one observation per activity & subject combination, with the mean of each of the variables. This creates the HAR_tidy data set for submission with 81 columns and 180 rows.
- provide cross-tab tables showing counts for HAR_part and HAR_tidy
- output the HAR_tidy data set to a txt file. This HAR_tidy.txt file is the one submitted to Coursera.

##Code to read the tidy data set:
Place the HAR_tidy.txt file in your working directory.

df_submitted <- read.table("HAR_tidy.txt", header=TRUE, sep=" ")
