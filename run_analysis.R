
## Step #1. Merge the training and test datasets to create one combined dataset

trainXData <- read.table("train/X_train.txt")
trainYData <- read.table("train/y_train.txt")
trainSubjectData <- read.table("train/subject_train.txt")

testXData <- read.table("test/X_test.txt")
testYData <- read.table("test/y_test.txt")
testSubjectData <- read.table("test/subject_test.txt")

joinXData <- rbind(trainXData, testXData)
joinYData <- rbind(trainYData, testYData)
joinSubjectData <- rbind(trainSubjectData, testSubjectData)

## Step #2. Extract/Filter only the measurements on mean and standard deviation 
## for each measurement

featuresData <- read.table("features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", featuresData[, 2])
joinXData <- joinXData[, meanStdIndices]
names(joinXData) <- gsub("\\(\\)", "", featuresData[meanStdIndices, 2])
names(joinXData) <- gsub("mean", "Mean", names(joinXData))
names(joinXData) <- gsub("std", "Std", names(joinXData))
names(joinXData) <- gsub("-", "", names(joinXData))

## Step #3. Use descriptive activity names to name activities in dataset

activityData <- read.table("activity_labels.txt")
activityData[, 2] <- tolower(gsub("_", "", activityData[, 2]))
substr(activityData[2, 2], 8, 8) <- toupper(substr(activityData[2, 2], 8, 8))
substr(activityData[3, 2], 8, 8) <- toupper(substr(activityData[3, 2], 8, 8))
activityLabel <- activityData[joinYData[, 1], 2]
joinYData[, 1] <- activityLabel
names(joinYData) <- "activity"

## Step #4. Label dataset appropriately with descriptive activity

names(joinSubjectData) <- "subject"
cleanedData <- cbind(joinSubjectData, joinYData, joinXData)

## Step #5. Create a second independent tidy dataset with average of 
## each variable for each activity and each subject

subjectLength <- length(table(joinSubjectData))
activityLength <- dim(activityData)[1]
columnLength <- dim(cleanedData)[2]
resultData <- matrix(NA, nrow=subjectLength*activityLength, ncol=columnLength)
resultData <- as.data.frame(resultData)
colnames(resultData) <- colnames(cleanedData)
currow <- 1
for(i in 1:subjectLength) {
    for(j in 1:activityLength) {
		resultData[currow, 1] <- sort(unique(joinSubjectData)[, 1])[i]
		resultData[currow, 2] <- activityData[j, 2]
		val1 <- i == cleanedData$subject
		val2 <- activityData[j, 2] == cleanedData$activity
		resultData[currow, 3:columnLength] <- colMeans(cleanedData[val1&val2, 3:columnLength])
	currow <- currow + 1
	}
 }
 write.table(resultData, "final_tidy_data.txt")










































































