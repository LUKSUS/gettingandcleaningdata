# PREPARATION AND LOADING DATA INTO R

### download datasets to local computer:
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile = 'datasets.zip')

### unzip data files:
unzip(zipfile = 'datasets.zip')

### create a vector, which consists paths to files from 'test' and 'train' directories:
filesPaths <- list.files(path = c('UCI HAR Dataset/test', 'UCI HAR Dataset/train'), pattern = '\\.txt', full.names = TRUE)

### create a list, which consists data frame objects from 'test' and 'train' directories:
filesList <- lapply(X = filesPaths, FUN = read.table, header = FALSE, stringsAsFactors = FALSE)

### create a vector, which consists paths to files with label names:
labelsPaths <- list.files(path = 'UCI HAR Dataset', pattern = 'labels.txt$|features.txt$', full.names = TRUE)

### create a list, which consists label names for data:
labelsList <- lapply(X = labelsPaths, FUN = readLines)



# MERGING DATASETS INTO ONE DATA FRAME

### merge data, which consist persons (subjects) label names:
subjectComplete <- rbind(filesList[[1]], filesList[[4]])

### merge data, which consist measurements for all subjects:
variablesComplete <- rbind(filesList[[2]], filesList[[5]])

### merge data, which consist activity label names for each row:
activityComplete <- rbind(filesList[[3]], filesList[[6]])

### add variable names to the data frame with measurements:
names(variablesComplete) <- labelsList[[2]]

### create a recognition vector, which consists index of mean and standard deviation estimations:
variablesIndex <- grep(pattern = '-[Mm][Ee][Aa][Nn]\\(\\)|-[Ss][Tt][Dd]\\(\\)', x = names(variablesComplete))

### subset 'variablesComplete' data frame by using the recognition vector:
dataSubset <- variablesComplete[, variablesIndex]

### create a function, which cleans variables (measurements) names in data frame:
cleanVariables <- function(x) {
    x <- gsub(pattern = 'mean', replacement = 'Mean', x = x)
    x <- gsub(pattern = 'std', replacement = 'StandardDeviation', x = x)
    x <- gsub(pattern = '[0-9]', replacement = '', x = x)
    x <- gsub(pattern = '\\(', replacement = '', x = x)
    x <- gsub(pattern = '\\)', replacement = '', x = x)
    x <- gsub(pattern = '-', replacement = '', x = x)
    x <- gsub(pattern = ' ', replacement = '', x = x)
    x <- gsub(pattern = 'BodyBody', replacement = 'Body', x = x)
    x <- gsub(pattern = '^t', replacement = 'averageTime', x = x)
    x <- gsub(pattern = '^f', replacement = 'averageFrequency', x = x)
    x <- gsub(pattern = 'Gyro', replacement = 'Gyroscope', x = x)
    x <- gsub(pattern = 'Acc', replacement = 'Accelerometer', x = x)
    x <- gsub(pattern = 'Mag', replacement = 'Magnitude', x = x)
}

### clean variables names by using 'cleanVariables' function:
names(dataSubset) <- cleanVariables(names(dataSubset))

### merge persons (subjects), activities and measurements data frames:
dataComplete <- cbind(subjectComplete, activityComplete, dataSubset)
names(dataComplete) <- c('person', 'activity', names(dataSubset))



# PREPARING TIDY DATA FRAME

### compute average values for 'mean' and 'standard deviation' variables:
tidyData <- aggregate(x = dataComplete[3:ncol(dataComplete)], by = list(dataComplete[, 1], dataComplete[, 2]), FUN = mean)

### create a function, which cleans activity label names:
cleanActivities <- function(x) {
    x <- tolower(x)
    x <- gsub(pattern = '[0-9] ', replacement = '', x = x)
    x <- gsub(pattern = '_', replacement = '.', x = x)
}

### add factor labels to 'activity' variable and clean it by using 'cleanActivities' function:
names(tidyData) <- c('idPerson', 'activityName', names(tidyData)[3:length(names(tidyData))])
tidyData$activityName <- as.factor(tidyData$activityName)
activityFactors <- cleanActivities(x = labelsList[[1]])
levels(tidyData$activityName) <- activityFactors
tidyData <- tidyData[order(tidyData[, 1], tidyData[, 2]), ]
rownames(tidyData) <- 1:length(tidyData[, 1])



# SHOWING TIDY DATA FRAME AND WRITING IT INTO FILE

### show tidy data frame:
View(tidyData)

### write tidy data frame into '.csv' file:
write.csv(x = tidyData, file = 'tidyData.csv', row.names = FALSE)