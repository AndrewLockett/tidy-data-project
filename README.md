#Tidy Data Project
Coursera 'Getting & Cleaning Data' Project - Tidy Data 

##This repo contains the following:

- README.md - this file
- CodeBook.md - more detail on the HAR_tidy.txt data set
- run_analysis.R - the R script used to create the tidy data set

##run_analysis.R script:
The run_analysis.R script should be saved to and run from the working directory. It carries out the following process (for full details see the CodeBook):

- downloads the original source data zip file
- performs the data cleaning as documented in the CodeBook
- outputs the HAR_tidy.txt data file described in the CodeBook.

##Code to read the tidy data set:
Place the HAR_tidy.txt file in your working directory. Then run following script.

df_submitted <- read.table("HAR_tidy.txt", header=TRUE, sep=" ")
