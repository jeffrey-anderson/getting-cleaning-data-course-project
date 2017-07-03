library(dplyr)
library(tidyr)

# File Paths
activtyLabelFilePath <- "~/data/UCI HAR Dataset/activity_labels.txt"
featureFilePath <- "~/data/UCI HAR Dataset/features.txt"
testXFilePath <- "~/data/UCI HAR Dataset/test/X_test.txt"
testYFilePath <- "~/data/UCI HAR Dataset/test/Y_test.txt"
testSubjectFilePath <- "~/data/UCI HAR Dataset/test/subject_test.txt"

trainXFilePath <- "~/data/UCI HAR Dataset/train/X_train.txt"
trainYFilePath <- "~/data/UCI HAR Dataset/train/Y_train.txt"
trainSubjectFilePath <- "~/data/UCI HAR Dataset/train/subject_train.txt"


#' Get a data frame with activities
#' @param activityLabelFile the path to the activity labels 
#' @return A data frame representation of the \code{activityLabelFile} with two columns: \code{activity_id} and \code{activity}
#'
getActivityLabels <- function(activityLabelFile) {
  activities <- read.csv(activityLabelFile,header = FALSE, sep = " ")
  colnames(activities) <- c("activity_id", "activity")
  return(activities)
}


#' Get a data frame with features
#' @param featureFile the path to the list of features 
#' @return A data framehelp  representation of the \code{featureFile} with two columns: \code{activity_id} and \code{activity}
#'
getFeatures <- function(featureFile) {
  features <- read.csv(featureFile,header = FALSE, sep = " ", stringsAsFactors = FALSE)
  colnames(features) <- c("id", "feature")
  features %>% separate(feature, c("signal","operation", "params"), "-", fill = "right", remove = FALSE)
  # return(features)  
}


#' Get a data frame with a complete set of training data with proper column names
#' @param features feature data 
#' @param activities activity data 
#' @return data frame with a complete set of training data with proper column names
#'
getTrainingData <- function(features, activities) {
  # Get Main Data:
  trainingMeasures <- read.table(trainXFilePath)
  colnames(trainingMeasures) <- features[,2]

  # Get Activity Data:
  trainingActivitiesRaw <- read.table(trainYFilePath, col.names =  c("activity_id"))
  # Join adding activity decription
  trainingActivities <- right_join(trainingActivitiesRaw,activities, by = "activity_id")
  
  # Add in the subject Id rows:
  trainingSubjectData <- read.table(trainSubjectFilePath, col.names = c("subject_id"))

  #finally join all three sets of columns and return the result
  cbind(trainingSubjectData, trainingActivities, trainingMeasures)
}


#' Get a data frame with a complete set of test data with proper column names
#' @param features feature data 
#' @param activities activity data 
#' @return data frame with a complete set of test data with proper column names
#'
getTestData <- function(features, activities) {
  # Get Main Data:
  testMeasures <- read.table(testXFilePath)
  colnames(testMeasures) <- features[,2]
  
  # Get Activity Data:
  testActivitiesRaw <- read.table(testYFilePath, col.names =  c("activity_id"))
  # Join adding activity decription
  testActivities <- right_join(testActivitiesRaw,activities, by = "activity_id")
  
  # Add in the subject Id rows:
  testSubjectData <- read.table(testSubjectFilePath, col.names = c("subject_id"))

  #finally combine  all three sets of columns, join in activity name and return the result
  cbind(testSubjectData, testActivities, testMeasures)
}

# MAIN CODE:

# Get features and activites once and pass as parameters
features <- getFeatures(featureFilePath)
activities <- getActivityLabels(activtyLabelFilePath)

# Get complete set of training and test data and concatinate into one unified list:
# 1. Merges the training and the test sets to create one data set.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.

allData <- rbind(getTrainingData(features, activities), getTestData(features, activities))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanStdData <- allData[,grepl('-(mean\\(\\)|std\\(\\))-',colnames(allData),ignore.case = TRUE)]


