library(dplyr)
library(tidyr)

activtyLabelFilePath <- "~/data/UCI HAR Dataset/activity_labels.txt"
featureFilePath <- "~/data/UCI HAR Dataset/features.txt"
testXFilePath <- "~/data/UCI HAR Dataset/test/X_test.txt"
testYFilePath <- "~/data/UCI HAR Dataset/test/Y_test.txt"

trainXFilePath <- "~/data/UCI HAR Dataset/train/X_train.txt"
trainYFilePath <- "~/data/UCI HAR Dataset/train/Y_train.txt"

getActivities <- function() {
  activities <- read.csv(activtyLabelFilePath,header = FALSE, sep = " ")
  colnames(activities) <- c("activity_id", "activity")
  return(activities)  
}

getFeatures <- function() {
  features <- read.csv(featureFilePath,header = FALSE, sep = " ", stringsAsFactors = FALSE)
  colnames(features) <- c("id", "feature")
  features %>% separate(feature, c("signal","operation", "params"), "-", fill = "right", remove = FALSE)
  # return(features)
}

getTestData <- function() {
  textXtests <- read.table(testXFilePath)
  colnames(textXtests) <- getFeatures()[,2]
  
  testYdata <- read.table(testYFilePath)
  colnames(testYdata) <- c("activity_id")
  
  data.frame(c(right_join(testYdata,getActivities(), by = "activity_id"),textXtests),stringsAsFactors=FALSE)
}

getTrainingData <- function() {
  trainXtable <- read.table(trainXFilePath)
  colnames(trainXtable) <- getFeatures()[,2]
  
  trainYdata <- read.table(trainYFilePath)
  colnames(trainYdata) <- c("activity_id")
  
  data.frame(c(right_join(trainYdata,getActivities(), by = "activity_id"),trainXtable),stringsAsFactors=FALSE)
}

allData <- rbind.data.frame(getTestData(),getTrainingData(),stringsAsFactors = FALSE)
