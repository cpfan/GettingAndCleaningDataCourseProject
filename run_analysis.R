#Install Library
install.packages("plyr")
install.packages("reshape2")

#Load library
library("plyr")
library("reshape2")

#Load Column Name
featureListUrl <- "./data/UCI HAR Dataset/features.txt"
featureList <- read.table(featureListUrl)
names(featureList) <- cbind("id", "feature")
featureRequired <- grep("mean\\(|std\\(", featureList$feature)

#Load Acticity
activityLabelsUrl <- "./data/UCI HAR Dataset/activity_labels.txt"
activityLabels <- read.table(activityLabelsUrl)
names(activityLabels) <- cbind("id", "activity_label")

#Load Training and Test Data
trainDataXUrl <- "./data/UCI HAR Dataset/train/x_train.txt"
trainDataYUrl <- "./data/UCI HAR Dataset/train/y_train.txt"
trainDataSubjectUrl <- "./data/UCI HAR Dataset/train/subject_train.txt"

trainXData <- read.table(trainDataXUrl)
names(trainXData) <- featureList$feature
trainYData <- read.table(trainDataYUrl)
names(trainYData) <- "activity"
trainSubjectData <- read.table(trainDataSubjectUrl)
names(trainSubjectData) <- "subject"

trainDateRequired <- trainXData[,featureRequired]
trainData <- cbind(trainDateRequired, trainYData, trainSubjectData)
trainDataComplete <- merge(trainData, activityLabels, by.x = "activity", by.y = "id")

testDataXUrl <- "./data/UCI HAR Dataset/test/x_test.txt"
testDataYUrl <- "./data/UCI HAR Dataset/test/y_test.txt"
testDataSubjectUrl <- "./data/UCI HAR Dataset/test/subject_test.txt"

testXData <- read.table(testDataXUrl)
names(testXData) <- featureList$feature
testYData <- read.table(testDataYUrl)
names(testYData) <- "activity"
testSubjectData <- read.table(testDataSubjectUrl)
names(testSubjectData) <- "subject"

testDataRequired <- testXData[,featureRequired]
testData <- cbind(testDataRequired, testYData, testSubjectData)
testDataComplete <- merge(testData, activityLabels, by.x = "activity", by.y = "id")

mergedData <- merge(trainDataComplete, testDataComplete, all = TRUE)

meltedData <- melt(mergedData, id=c("activity_label", "subject"))
result <- dcast(meltedData, activity_label + subject ~ variable, mean)

resultUrl = "./data/tidyData.txt"
write.table(result, file = resultUrl, row.name = FALSE, sep = "\t")