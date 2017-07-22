# Code Book

## Study Overview

This project uses the [Human Activity Recognition Using Smartphones Dataset](data/UCI%20HAR%20Dataset/README.txt) by combining the training and test sets to create one data set. From the combined dataset, it extracts only the measurements on the mean and standard deviation for each measurement.  Finally, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables

### Input Data

| file  | Decription |
| ------------- | ------------- |
| [data/UCI HAR Dataset/test/X_test.txt](data/UCI%20HAR%20Dataset/test/X_test.txt) | Testing data measures |  
| [data/UCI HAR Dataset/test/y_test.txt](data/UCI%20HAR%20Dataset/test/y_test.txt) | [Activity](data/UCI%20HAR%20Dataset/activity_labels.txt) ID for each row in the file above |  
| [data/UCI HAR Dataset/train/X_train.txt](data/UCI%20HAR%20Dataset/train/X_train.txt) | Training data measures |  
| [data/UCI HAR Dataset/train/y_train.txt](data/UCI%20HAR%20Dataset/train/y_train.txt) | [Activity](data/UCI%20HAR%20Dataset/activity_labels.txt) ID for each row in the file above |  

### Output Data

File: [outputTidyData.txt](data/outputTidyData.txt)

| Column  | Decription | Source |
| ------------- | ------------- | ------------- |
| subject_id | Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. | Training data from [data/UCI HAR Dataset/train/subject_train.txt](data/UCI%20HAR%20Dataset/train/subject_train.txt) and testing data from [data/UCI HAR Dataset/test/subject_test.txt](data/UCI%20HAR%20Dataset//test/subject_test.txt) |
| activity  | Activty Name which is one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING | [data/UCI HAR Dataset/activity_labels.txt](data/UCI%20HAR%20Dataset/activity_labels.txt) |
| feature | Features as described in [this codebook](data/UCI%20HAR%20Dataset/features_info.txt) | [data/UCI HAR Dataset/features.txt](data/UCI%20HAR%20Dataset/features.txt)
| mean  | the average of each variable for each activity and each subject. | See the *Details* section below |

## Details

The mean column in the output file is calculated as follows:

1. Concatinate the activity, subject, training measure and testing measures data so it forms a complete table.
2. Extract out only columns who's names match: `mean\\(\\)|std\\(\\))`
3. Melt the data so for every subject_id and activity the feature measures (stored as columns in the source data) form their own rows in the output data taking the mean of each measure.
