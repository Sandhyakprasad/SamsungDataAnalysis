This code book describes the variables, the data, and the transformations that was performed to clean up the data and obtain the tidy dataset.
## Data for the Project

The [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project was provided by Coursera.The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.  
 
## Data Transformations 

1.The training**X\_train.txt** and test (**X\_test.txt**) datasets for X is combined using rbind.

2.The training**y\_train.txt** and test (**y\_test.txt**) datasets for X is combined using rbind.

3.The training**subject\_train.txt** and test (**subject\_test.txt**) datasets for X is combined using rbind.

4.Now all these above datasets are combined using cbind to obtain the merged data set **allData** with 10299 observations with 563 variables.

5.The variables names need to be changed to descriptive and readable names.The variable names was obtained from the file **features.txt**.The description regarding the variables is obtained from the file **features_info.txt**. Renamed the column names of **allData**.Variable names changed to lowercase,removed parantheses,hyphen,commas.

6.The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Time domain signals is denoted by prefix 't' to denote time.
The 'f' to indicate frequency domain signals.So **tBodyAcc-mean()-X** was renamed as **timebodyaccmeanx** ,**fBodyAcc-mean()-X** was renamed as **frequencybodyaccmeanx** and so on.

7.Replaced the numeric value to the name of the corresponding Activity in the activity column of **allData** with labels obtained from the file **activity_labels.txt**
```R   
    Numeric Value      Activity Name
             1            Walking
             2      Walking_Upstairs
             3      Walking_Downstairs
             4            Sitting
             5           Standing
             6             Laying
```
  
8.Created a dataset subset using variables that represent only a measure of mean or standard deviation only.The table obtained in this is **meanStddata**. This dataset has 10299 observations with 88 variables.

9.Created the required independent tidy data set with the average of each variable for each activity and each subject.The output table is **allMeans**.It gives a **tidy dataset** of all **averages** of the selected columns for Mean and Standard deviation which can be used for further Data Analysis.The tidy dataset obtained has 180 observations with 88 variables based on each subject and activity .The output obtained is in the table **allMeans**.

The averages for the following columns were calculated to obtain the tidy dataset **allMeans** for each subject and activity combination.
```
                                    
 [3] "timebodyaccmeanx"                              "timebodyaccmeany"                             
 [5] "timebodyaccmeanz"                              "timebodyaccstandarddeviationx"                
 [7] "timebodyaccstandarddeviationy"                 "timebodyaccstandarddeviationz"                
 [9] "timegravityaccmeanx"                           "timegravityaccmeany"                          
[11] "timegravityaccmeanz"                           "timegravityaccstandarddeviationx"             
[13] "timegravityaccstandarddeviationy"              "timegravityaccstandarddeviationz"             
[15] "timebodyaccjerkmeanx"                          "timebodyaccjerkmeany"                         
[17] "timebodyaccjerkmeanz"                          "timebodyaccjerkstandarddeviationx"            
[19] "timebodyaccjerkstandarddeviationy"             "timebodyaccjerkstandarddeviationz"            
[21] "timebodygyromeanx"                             "timebodygyromeany"                            
[23] "timebodygyromeanz"                             "timebodygyrostandarddeviationx"               
[25] "timebodygyrostandarddeviationy"                "timebodygyrostandarddeviationz"               
[27] "timebodygyrojerkmeanx"                         "timebodygyrojerkmeany"                        
[29] "timebodygyrojerkmeanz"                         "timebodygyrojerkstandarddeviationx"           
[31] "timebodygyrojerkstandarddeviationy"            "timebodygyrojerkstandarddeviationz"           
[33] "timebodyaccmagmean"                            "timebodyaccmagstandarddeviation"              
[35] "timegravityaccmagmean"                         "timegravityaccmagstandarddeviation"           
[37] "timebodyaccjerkmagmean"                        "timebodyaccjerkmagstandarddeviation"          
[39] "timebodygyromagmean"                           "timebodygyromagstandarddeviation"             
[41] "timebodygyrojerkmagmean"                       "timebodygyrojerkmagstandarddeviation"         
[43] "frequencybodyaccmeanx"                         "frequencybodyaccmeany"                        
[45] "frequencybodyaccmeanz"                         "frequencybodyaccstandarddeviationx"           
[47] "frequencybodyaccstandarddeviationy"            "frequencybodyaccstandarddeviationz"           
[49] "frequencybodyaccmeanfreqx"                     "frequencybodyaccmeanfreqy"                    
[51] "frequencybodyaccmeanfreqz"                     "frequencybodyaccjerkmeanx"                    
[53] "frequencybodyaccjerkmeany"                     "frequencybodyaccjerkmeanz"                    
[55] "frequencybodyaccjerkstandarddeviationx"        "frequencybodyaccjerkstandarddeviationy"       
[57] "frequencybodyaccjerkstandarddeviationz"        "frequencybodyaccjerkmeanfreqx"                
[59] "frequencybodyaccjerkmeanfreqy"                 "frequencybodyaccjerkmeanfreqz"                
[61] "frequencybodygyromeanx"                        "frequencybodygyromeany"                       
[63] "frequencybodygyromeanz"                        "frequencybodygyrostandarddeviationx"          
[65] "frequencybodygyrostandarddeviationy"           "frequencybodygyrostandarddeviationz"          
[67] "frequencybodygyromeanfreqx"                    "frequencybodygyromeanfreqy"                   
[69] "frequencybodygyromeanfreqz"                    "frequencybodyaccmagmean"                      
[71] "frequencybodyaccmagstandarddeviation"          "frequencybodyaccmagmeanfreq"                  
[73] "frequencybodybodyaccjerkmagmean"               "frequencybodybodyaccjerkmagstandarddeviation" 
[75] "frequencybodybodyaccjerkmagmeanfreq"           "frequencybodybodygyromagmean"                 
[77] "frequencybodybodygyromagstandarddeviation"     "frequencybodybodygyromagmeanfreq"             
[79] "frequencybodybodygyrojerkmagmean"              "frequencybodybodygyrojerkmagstandarddeviation"
[81] "frequencybodybodygyrojerkmagmeanfreq"          "angletbodyaccmeantogravity"                   
[83] "angletbodyaccjerkmeantogravitymean"            "angletbodygyromeantogravitymean"              
[85] "angletbodygyrojerkmeantogravitymean"           "anglextogravitymean"                          
[87] "angleytogravitymean"                           "angleztogravitymean"
```


### Below is a small snippet of the output dataset **allMeans** . The first 12 rows with 5 columns are selected 
```
 subject           activity timebodyaccmeanx timebodyaccmeany timebodyaccmeanz
1        1           Standing        0.2789176     -0.016137590       -0.1106018
2        1            Sitting        0.2612376     -0.001308288       -0.1045442
3        1             Laying        0.2215982     -0.040513953       -0.1132036
4        1            Walking        0.2773308     -0.017383819       -0.1111481
5        1 Walking_Downstairs        0.2891883     -0.009918505       -0.1075662
6        1   Walking_Upstairs        0.2554617     -0.023953149       -0.0973020
7        2           Standing        0.2779115     -0.018420827       -0.1059085
8        2            Sitting        0.2770874     -0.015687994       -0.1092183
9        2             Laying        0.2813734     -0.018158740       -0.1072456
10       2            Walking        0.2764266     -0.018594920       -0.1055004
11       2 Walking_Downstairs        0.2776153     -0.022661416       -0.1168129
12       2   Walking_Upstairs        0.2471648     -0.021412113       -0.1525139
```

