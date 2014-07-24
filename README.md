## Readme for Getting and Cleaning Data Project

### Purpose of this project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data, that can be used for later analysis.

The data linked to this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site, where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data, which was used in analysis: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

GitHub repository contains three files:

* run_analysis.R
* CodeBook.md
* README.md

### Information about the R script

R script files "run_analysis.R" does the following things:

  1. Merges the "training" and the "test" sets to create one data set.
  2. Extracts only the variables which contain mean and standard deviation measurements.
  3. Uses descriptive activity names to name the activities in the data set. Labels are taken from "activity_labels.txt" file.
  4. Appropriately labels the data set with descriptive variable names.
  5. Creates a second, independent, tidy data set with the average of each variable for each activity and each subject.
  6. Write tidy data set into file called "tidyData.csv".

### Information about the Code Book

In file "CodeBook.md" you can find more information about the data set. It also include information about data transformations, which "run_analysis.R" script does (there is description to each step of transformation). And finally you can find description about all variables names in tidy data set, which includes: variable name in tidy data, description what each variable represent and values of particular variables.

### How to run the script

1. Open script "run_analysis.R" in R.
2. Run the script directly in R.
3. Wait a few moments.
4. After the script finishes its work, you can find "tidyData.csv" file in your working directory.