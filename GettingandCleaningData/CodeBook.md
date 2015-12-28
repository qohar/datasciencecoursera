# Overview
This code book describes the variables, the data, and any transformations or work that was performed to clean up the project data set, [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data set
The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

## Variables
The Human Activity Recognition data set contains over 500 measurements captured from the smartphone. The data set also contains 'subject', a range of numbers (1:30) to indicate the person who performed the activity, and 'activity label', which links the class labels with their activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). For this project, I mainly focused on these variables: 'subject', 'activity label', and mean of the mean and standard deviation measurements.

## Transformation
There are four steps involved in the process of cleaning the original data set to creating a tidy data set.

### Merge the training and the test sets to create one data set.
Each data set contains three separate files:  

  * X_.txt -- Measurements for the data set  
  * y_.txt -- Activity labels for the data set  
  * subject_.txt -- Each row identifies the subject who performed the activity for each window sample.  

There is a helper function, `merges()`, that merges the above files in each data set together. The merged train and test data sets are further combined together.

### Use descriptive activity names to name the activities in the data set.
The activity variable contains the number that corresponds to the activity rather than the label. This is not helpful, as one would need to cross-reference the activity_label table. Therefore, I changed the numbers to their corresponding labels. 

### Extract only the measurements on the mean and standard deviation for each measurement.
There are over 500 variables that were collected in the original data set. I extracted only the measurements on the mean and standard deviation using `grepl`. The variable names are expanded to be more descriptive, using substituions. For example, _tBodyAcc.mean().X_ expands to _timeBodyAccelerationMeanX_. 

### Create a a second, independent tidy data set with the average of each variable for each activity and each subject.
The measurement variables are collapsed into key-value pairs using `gather()`. The mean of each variable was taken and grouped by subjects and by activity. The resulting data set follows the principle of each observation forming a row and each variable (subjects, activity, signal, signal average) forming their own columns.
