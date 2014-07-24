## Human Activity Recognition Using Smartphones Data Set

### Study design

**Information about the dataset:**

Human Activity Recognition database is built from the recordings of 30 subjects (persons), which were a group of 30 volunteers within an age bracket of 19-48 years.

They are performing six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) of daily living (ADL), while carrying a waist-mounted smartphone (Samsung Galaxy S II) with embedded inertial sensors.

**Source of dataset:**

* Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
* Smartlab - Non Linear Complex Systems Laboratory
* DITEN - Universita  degli Studi di Genova, Genoa I-16145, Italy
* activityrecognition @ smartlab.ws
* www.smartlab.ws

**Full description about the data:**

A full description is available at the site, where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data set transformations

**Step 1: Preparation and loading data into R**

Script downloads data sets to local computer, unzips the files and creates:

* vector, which consists paths to files from "test" and "train" directories
* list, which consists data frame objects from "test" and "train" directories
* vector, which consists paths to files with label names
* list, which consists label names for variables.

**Step 2: Merging data sets into one data frame**

Script merges data, which consist persons (subjects) label names. Merges data, which consist measurements for all subjects. And finally, merges data, which consist activity label names for each row.

**Step 3: Variables selection and variable names**

Extract only the measurements of mean and stardard deviation for each measurement (variables names which consist "mean()" or "std()" in their names). After that adds variables names to the data frame with measurements and cleans variables names:

* replace "mean" by "Mean"
* replace "std" by "StandardDeviation"
* delete numbers in names
* delete parentheses in names
* delete special signs and extra spaces in names
* replace "BodyBody" by "Body"
* replace "t" by "averageTime"
* replace "f" by "averageFrequency"
* replace "Gyro" by "Gyroscope"
* replace "Acc" by "Accelerometer"
* replace "Mag" by "Magnitude"

**Step 4: Preparing tidy data frame**

Script computes average values for all selected variables by two factor variables: "person id" and "activity name". After that creates a function, which cleans activity label names and finally adds clean factor labels to "activity name" variable.

**Step 5: Showing tidy data frame and writing it into file**

Script shows how the new tidy data looks like and after that writes this data into "tidyData.csv" file. It can be found in active working directory.

### Code Book for tidy data set

In tidy data set are 2 variables wchich identify the exact person ("idPerson") and exact activity ("activityName"). There are also 66 variables with average values of all selected measurements. This 66 columns were named very descriptive. Table below showed the naming pattern:

    | MEASUREMENT | FEATURE   | SIGNAL  | DEVICE        | SENSOR    | STATISTIC         | AXIS |
    |-------------|-----------|---------|---------------|-----------|-------------------|------|
    | average     | time      | body    | accelerometer | jerk      | mean              | x    |
    |             | frequency | gravity | gyroscope     | magnitude | standardDeviation | y    |
    |             |           |         |               | NULL      |                   | z    |
    |             |           |         |               |           |                   | NULL |

The list below consist complete variable list in tidy data set:

     VARIABLE NAME                                                  | DESCRIPTION
    -----------------------------------------------------------------------------------------------
                                                           idPerson | Type: integer
                                                                    | Values: 1 to 30
                                                                    | One number for exact person
    -----------------------------------------------------------------------------------------------
                                                       activityName | Type: factor
                                                                    |   1 = walking
                                                                    |   2 = walking.upstairs
                                                                    |   3 = walking.downstairs
                                                                    |   4 = sitting
                                                                    |   5 = standing
                                                                    |   6 = laying
    -----------------------------------------------------------------------------------------------
                                  averageTimeBodyAccelerometerMeanX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                  averageTimeBodyAccelerometerMeanY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                  averageTimeBodyAccelerometerMeanZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                     averageTimeBodyAccelerometerStandardDeviationX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                     averageTimeBodyAccelerometerStandardDeviationY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                     averageTimeBodyAccelerometerStandardDeviationZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                               averageTimeGravityAccelerometerMeanX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                               averageTimeGravityAccelerometerMeanY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                               averageTimeGravityAccelerometerMeanZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                  averageTimeGravityAccelerometerStandardDeviationX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                  averageTimeGravityAccelerometerStandardDeviationY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                  averageTimeGravityAccelerometerStandardDeviationZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                              averageTimeBodyAccelerometerJerkMeanX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                              averageTimeBodyAccelerometerJerkMeanY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                              averageTimeBodyAccelerometerJerkMeanZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                 averageTimeBodyAccelerometerJerkStandardDeviationX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                 averageTimeBodyAccelerometerJerkStandardDeviationY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                 averageTimeBodyAccelerometerJerkStandardDeviationZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                      averageTimeBodyGyroscopeMeanX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                      averageTimeBodyGyroscopeMeanY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                      averageTimeBodyGyroscopeMeanZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                         averageTimeBodyGyroscopeStandardDeviationX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                         averageTimeBodyGyroscopeStandardDeviationY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                         averageTimeBodyGyroscopeStandardDeviationZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                  averageTimeBodyGyroscopeJerkMeanX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                  averageTimeBodyGyroscopeJerkMeanY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                  averageTimeBodyGyroscopeJerkMeanZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                     averageTimeBodyGyroscopeJerkStandardDeviationX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                     averageTimeBodyGyroscopeJerkStandardDeviationY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                     averageTimeBodyGyroscopeJerkStandardDeviationZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                          averageTimeBodyAccelerometerMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
             averageTimeBodyAccelerometerMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                       averageTimeGravityAccelerometerMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
          averageTimeGravityAccelerometerMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                      averageTimeBodyAccelerometerJerkMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
         averageTimeBodyAccelerometerJerkMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                              averageTimeBodyGyroscopeMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                 averageTimeBodyGyroscopeMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                          averageTimeBodyGyroscopeJerkMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
             averageTimeBodyGyroscopeJerkMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                             averageFrequencyBodyAccelerometerMeanX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                             averageFrequencyBodyAccelerometerMeanY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                             averageFrequencyBodyAccelerometerMeanZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                averageFrequencyBodyAccelerometerStandardDeviationX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                averageFrequencyBodyAccelerometerStandardDeviationY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                averageFrequencyBodyAccelerometerStandardDeviationZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                         averageFrequencyBodyAccelerometerJerkMeanX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                         averageFrequencyBodyAccelerometerJerkMeanY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                         averageFrequencyBodyAccelerometerJerkMeanZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
            averageFrequencyBodyAccelerometerJerkStandardDeviationX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
            averageFrequencyBodyAccelerometerJerkStandardDeviationY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
            averageFrequencyBodyAccelerometerJerkStandardDeviationZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                 averageFrequencyBodyGyroscopeMeanX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                 averageFrequencyBodyGyroscopeMeanY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                                 averageFrequencyBodyGyroscopeMeanZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                    averageFrequencyBodyGyroscopeStandardDeviationX | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                    averageFrequencyBodyGyroscopeStandardDeviationY | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                    averageFrequencyBodyGyroscopeStandardDeviationZ | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                     averageFrequencyBodyAccelerometerMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
        averageFrequencyBodyAccelerometerMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                 averageFrequencyBodyAccelerometerJerkMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
    averageFrequencyBodyAccelerometerJerkMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                         averageFrequencyBodyGyroscopeMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
            averageFrequencyBodyGyroscopeMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
                     averageFrequencyBodyGyroscopeJerkMagnitudeMean | Type: numeric
                                                                    | Values: -1 to 1
    -----------------------------------------------------------------------------------------------
        averageFrequencyBodyGyroscopeJerkMagnitudeStandardDeviation | Type: numeric
                                                                    | Values: -1 to 1