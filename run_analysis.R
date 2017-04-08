library(dplyr)

activtyLabelFilePath <- "~/data/UCI HAR Dataset/activity_labels.txt"
featureFilePath <- "~/data/UCI HAR Dataset/features.txt"
testXtestFilePath <- "~/data/UCI HAR Dataset/test/X_test.txt"
testYtestFilePath <- "~/data/UCI HAR Dataset/test/Y_test.txt"


activities <- read.csv(activtyLabelFilePath,header = FALSE, sep = " ")
colnames(activities) <- c("id", "activity")

features <- read.csv(featureFilePath,header = FALSE, sep = " ")
colnames(features) <- c("id", "feature")

textXtests <- read.table(testXtestFilePath)
colnames(textXtests) <- features[,2]

testYdata <- read.table(testYtestFilePath)
colnames(testYdata) <- c("id")

testData <- c(right_join(testYdata,activities),textXtests)