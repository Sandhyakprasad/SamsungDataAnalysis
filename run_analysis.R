#1.Merges the training and the test sets to create one data set.
#Combine data (X_test.txt & X_train.txt),(y_test.txt & y_train.txt),
#(subject_test.txt & subject_train.txt)

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xTrainTest <- rbind(xTrain,xTest)

yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
yTrainTest <- rbind(yTrain,yTest)

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjectTrainTest <-rbind(subjectTrain,subjectTest)

#cbind Subject,Activity,Train & Test Data to get the merged data named allData

subYData <- cbind(subjectTrainTest,yTrainTest)
allData <- cbind(subYData,xTrainTest)

#4.Rename the column names with Readable and Descriptive names
# Variable names changed to lowercase,removed parantheses,hyphen,commas in allData

features <- read.table("UCI HAR Dataset/features.txt")

pattern <- "\\(|\\)|-"
features[,2] <- gsub(pattern,"",features[,2])
features[,2] <- gsub(",","to",features[,2])
features[,2] <- tolower(features[,2])
names(allData) <- c("subject","activity",features[,2])

#3.Uses descriptive activity names to name the activities in the data set(allData)
#Replace the numeric value to the name of the corresponding Activity from activity_labels.txt

gsr <- function(Source, Search, Replace)
{
        changed <- as.character(Source)
        
        for (i in 1:length(Search))
        {
                changed <- replace(changed, changed == Search[i], Replace[i])
        }
        
        cat("\n")
        
        changed
}
allData$activity <- gsr(allData$activity,c("1", "2", "3","4","5","6"),
                           c("Walking", "Walking_Upstairs", "Walking_Downstairs",
                             "Sitting","Standing","Laying"))

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#Creating a dataset named meanstdData using variables that represent only 
# a measure of mean or standard deviation only"

meanStdData<- subset(allData,select =c(subject,activity,grep("mean|std",names(allData))))

#5.Creating 2nd,independent tidy data set with the 
# average of each variable for each activity and each subject. 
#Calculate the means (Grouping by Subject and Activity) and creating a Dataset named allMeans

subjectId  <- sort(unique(meanStdData$subject))
activityName <-unique(meanStdData$activity)

colVal <- ncol(meanStdData)
allMeans<- data.frame(matrix(nrow=0, ncol=colVal))
newrow<- data.frame(matrix(nrow=0, ncol=colVal))

for (i in 1:length(subjectId)){
        
        for (j in 1:length(activityName)){
                
                newrow <- subset(meanStdData,subject==subjectId[i] & activity==activityName[j])
                meanValues <- data.frame(subjectId[i],activityName[j],
                                         matrix(colMeans(newrow[3:colVal]),nrow=1))
                allMeans <- rbind(allMeans,meanValues)
        }
}
names(allMeans) <- colnames(meanStdData)




