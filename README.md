## Goal Of this Project
   
   Prepare tidy data from data collected from the accelerometers from the Samsung Galaxy S smartphone.[Data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) used for this project was provided by Coursera.
   
## How to run this Script

1.Download the [Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip it to the working directory.

2.Download the **run_analysis.R** script to the working directory and run it on Rconsole/RStudio.

## The Script does the following

1.Merges the training and the test sets to create one data set.Files combined were the following **X\_test.txt and X\_train.txt, y\_test.txt & y\_train.txt, subject\_test.txt & subject\_train.txt**. The table obtained at this step is **alldata** 

2.Data for the coulmn names was obtained from the file **features.txt**.Renamed the column names of **allData** with Readable and Descriptive names .Variable names changed to lowercase,removed parantheses,hyphen,commas.

3.Replaced the numeric value to the name of the corresponding Activity in the activity column of **allData** with labels obtained from the file **activity_labels.txt**.

4.Created a dataset subset using variables that represent only a measure of mean or standard deviation only.The table obtained in this is **meanStddata**.

5.Created the required independent tidy data set with the average of each variable for each activity and each subject.The output table is **allMeans**.

## Output of the Script

It gives a tidy dataset of all averages of the selected columns for Mean and Standard deviation which can be used for further Data Analysis.The tidy dataset obtained has 180 observations with 88 variables based on each subject and activity .The output obtained is in the table **allMeans**.

