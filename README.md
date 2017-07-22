# Coursera Getting and Cleaning Data Course Project

## Overview

Summarizing from the [class project instructions](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project), 
data used in this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. Click [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for a full description from the site where the data was obtained. 

This project converts the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a [tidy dataset](http://vita.had.co.nz/papers/tidy-data.pdf), contents of which are described in the [code book](./CodeBook.md), using a recipe encoded into **run_analysis.R** that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Using this project

### Prerequisites:
* The R programming language is installed
* The dplyr, reshape2 and tidyr R packages are installed

### Running the script

1. Open RStudio or the R Console
2. Use the `setwd()` command to set your working directory to be the one containing `run_analysis.R`. Alternatively add `chdir=TRUE` as a second parameter in the next step:
3. use the `source()` command to source `run_analysis.R`

## Viewing the tidy output dataset

Once the script runs, you can see the output data by issuing the following command in the console:

``View(tidyData)``

Alternatley, navigate to the `data` directory and open `outputTidyData.txt`

More information about the data is available in the [code book](./CodeBook.md).

## Notes for reviewers:

1. **The submitted data set is tidy.** Note that I created a "tall" tidy data set where each variable forms a column, each observation forms a row and the table is made up of one type of observational unit (the mean of each instance in this case).  
1. **The Github repo contains the required scripts.** Note that my github repo contains this [readme](https://github.com/jeffrey-anderson/getting-cleaning-data-course-project/blob/master/README.md), the [codebook](https://github.com/jeffrey-anderson/getting-cleaning-data-course-project/blob/master/CodeBook.md) and the [run_analysis.R](https://github.com/jeffrey-anderson/getting-cleaning-data-course-project/blob/master/run_analysis.R) script.
1. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
1. **The README that explains the analysis files is clear and understandable.** Hopefully it does :-)

## References
1. [Coursera Getting and Cleaning Data Course Project](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)
2. [How to Share Data With a Statistician](https://github.com/jtleek/datasharing)
3. [Raw Data for the Project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

