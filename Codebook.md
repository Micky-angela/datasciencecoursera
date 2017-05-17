Introduction

The script run_analysis.R creates a tidy data set for Human Activity Recognition Using Smartphones Dataset.
The script can be divided into the following 6 steps
1. Read the data into R
2. Merge test data and train data together
3. Extract measurements on mean and standard deviation of all measurements using features.txt
4. Change activity names using data from activity_labels.txt
5. Change variable names into more descriptive ones
6. Create a table of means in groups of activity and subject
The final result is stored at MeanData.txt

Variables

xtest: data read from X_test.txt
ytest: data read from Y_test.txt
xtrain: data read from X_train.txt
ytrain: data read from Y_train.txt
subject_test: data read from subject_test.txt
subject_train: data read from subject_train.txt

data: data created by merging all test and train data
feature: data read from feature.txt
fIn: integer showing rows that are measurements on mean and standard deviation
fulldata: data of measurements on mean and standard deviation
groupdata: data group by activity and subject
groupdt: means of each column divided by activity and subject