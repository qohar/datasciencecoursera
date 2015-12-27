library(dplyr)
library(tidyr)

## Merges the training and the test sets to create one data set. Since both
## train and test data sets contain similar files, this helper function merges
## the files in each set.
merges <- function(directory) {
    files <- list.files(directory, pattern="*.txt")
    header <- read.table("features.txt", sep=" ", header=FALSE)
    measures <- read.table(file.path(directory,files[2]), header=FALSE,
                           col.names=header[,2])
    subjects <- read.table(file.path(directory,files[1]), header=FALSE,
                           col.names="subjects")
    activity <- read.table(file.path(directory,files[3]), header=FALSE,
                           col.names="activity")
    complete <- cbind(subjects,activity,measures)
}

merged_train <- merges("train")
merged_test <- merges("test")

## merge the merged train and test sets together
bothds <- rbind(merged_train, merged_test)

## Uses descriptive activity names to name the activities in the data set.
## The two lines below replaces the numerical indicator in the activity column
## for its corresponding label from activity_label.txt
act <- read.table("activity_labels.txt", sep=" ",header=FALSE)
bothds$activity <- act$V2[match(bothds$activity,act$V1)]

## Extracts only the measurements on the mean and standard deviation for each
## measurement.
meanstd <- bothds[, grepl("subjects|activity|mean[^F]|std()",colnames(bothds))]

## Appropriately labels the data set with descriptive variable names.
## Expand shorthand names like 'Acc' -> 'Acceleration' and substitute for longer
## name. For example, 'tBodyAcc.mean().X' expands to 'timeBodyAccelerationMeanX'.
mscols <- colnames(meanstd)
names(meanstd)[3:42] <- sub("t","time",mscols[3:42])
names(meanstd)[43:68] <- sub("f","frequency",mscols[43:68])
names(meanstd) <- sub("Acc","Acceleration",names(meanstd))
names(meanstd) <- sub("Mag","Magnitude",names(meanstd))
names(meanstd) <- sub("mean","Mean",names(meanstd))
names(meanstd) <- sub("std","StandardDeviation",names(meanstd))
names(meanstd) <- gsub("\\.","",names(meanstd))

## From the data set in step 4, creates a second, independent tidy data set with
##the average of each variable for each activity and each subject.
tidyds <- gather(meanstd, signal, avgsignal, -subjects, -activity)
tidyds <- tidyds %>% group_by(subjects, activity, signal)
                %>% summarize(signalaverage = mean(avgsignal))
write.table(tidyds,"tidyds.txt", row.names=FALSE)
