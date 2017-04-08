library(dplyr)

activtyLabelFilePath <- "~/data/UCI HAR Dataset/activity_labels.txt"
featureFilePath <- "~/data/UCI HAR Dataset/features.txt"
testXFilePath <- "~/data/UCI HAR Dataset/test/X_test.txt"
testYFilePath <- "~/data/UCI HAR Dataset/test/Y_test.txt"

trainXFilePath <- "~/data/UCI HAR Dataset/train/X_train.txt"
trainYFilePath <- "~/data/UCI HAR Dataset/train/Y_train.txt"

getActivities <- function() {
  activities <- read.csv(activtyLabelFilePath,header = FALSE, sep = " ")
  colnames(activities) <- c("id", "activity")
  return(activities)  
}

getFeatures <- function() {
  features <- read.csv(featureFilePath,header = FALSE, sep = " ")
  colnames(features) <- c("id", "feature")
  return(features)  
}

getTestData <- function() {
  textXtests <- read.table(testXFilePath)
  colnames(textXtests) <- getFeatures()[,2]
  
  testYdata <- read.table(testYFilePath)
  colnames(testYdata) <- c("id")
  
  data.frame(c(right_join(testYdata,getActivities(), by = "id"),textXtests),stringsAsFactors=FALSE)
}

getTrainingData <- function() {
  trainXtable <- read.table(trainXFilePath)
  colnames(trainXtable) <- getFeatures()[,2]
  
  trainYdata <- read.table(trainYFilePath)
  colnames(trainYdata) <- c("id")
  
  data.frame(c(right_join(trainYdata,getActivities(), by = "id"),trainXtable),stringsAsFactors=FALSE)
}

allData <- rbind.data.frame(getTestData(),getTrainingData(),stringsAsFactors = FALSE)
