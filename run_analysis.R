
# This program creates two data frames:
# dataFinal is the fully extracted, cleaned, and labeled data for steps 1-4 of the project
# dataSummary is the summarized data for step 5

# change working directory (if needed)
# setwd("coursera\\getting_and_cleaning_data\\project\\UCI\ HAR\ Dataset\\")

# load, extract, combine, name, and sort feature descriptions
rawFeatures <- read.table("features.txt")
meanFeatures <- rawFeatures[grep("mean()", rawFeatures$V2, fixed=TRUE),]
stdFeatures <- rawFeatures[grep("std()", rawFeatures$V2, fixed=TRUE),]
features <- rbind(meanFeatures, stdFeatures)
colnames(features) <- c("featureId", "featureName")
features <- features[order(features$featureId),]

# load activities
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("activityId", "activityName")

# load raw training set
rawTrainSubject <- read.table("train\\subject_train.txt")
rawTrainActivity <- read.table("train\\y_train.txt")
rawTrainFeatures <- read.table("train\\X_train.txt")

# load raw test set
rawTestSubject <- read.table("test\\subject_test.txt")
rawTestActivity <- read.table("test\\y_test.txt")
rawTestFeatures <- read.table("test\\X_test.txt")

# combine raw sets
rawCombSubject <- rbind(rawTrainSubject, rawTestSubject)
rawCombActivity <- rbind(rawTrainActivity, rawTestActivity)
rawCombFeatures <- rbind(rawTrainFeatures, rawTestFeatures)

# merge raw data, including only desired features
dataFinal <- data.frame(
  rawCombSubject,
  rawCombActivity,
  rawCombFeatures[,features$featureId]
)

# add column names and factors
colnames(dataFinal) <- c(c("subject", "activity"), as.character(features$featureName))
dataFinal$subject <- factor(dataFinal$subject)
dataFinal$activity <- factor(dataFinal$activity, labels=activities$activityName)

# dataFinal is finished

# create summary: mean of each measure for each subject/activity
library(reshape2)
dataMelted <- melt(dataFinal, id=c("subject", "activity"), measure.vars=features$featureName)
dataSummary <- aggregate(dataMelted,
                         by=list(dataMelted$subject, dataMelted$activity, dataMelted$variable),
                         FUN="mean")
dataSummary <- dataSummary[,c(1,2,3,7)]
colnames(dataSummary) <- c("subject", "activity", "variable", "mean")

# dataSummary is finished

# write summary data to a file
write.table(dataSummary, file="dataSummary.txt", row.name=FALSE)

