# Overview
This is a course project for 'Getting and Cleaning Data' course. Its objective is to clean up the project data set, [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

## The data set contains the following files
* README.md  
* Codebook.md -- Information regarding the variables and processes in run_analysis.R 
* run.analysis.R -- the code for obtaining the tidy data set (‘tidyds.txt’)
* tidyds.txt -- tidy data set with the average of each variable for each activity and each subject

## Variables in tidyds data set  
* Subjects -- The numerical indicator of the one who performed an activity
* Activity -- Label of activity
* Signal -- Type of measurement
* Signal Average -- Mean value of the signal
