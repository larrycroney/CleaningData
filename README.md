
README for Coursera Project
Course: Getting and Cleaning Data
Author: Larry Croney
Date: Feb. 11, 2015

The run_analysis.R program contains all of the R code for this project.  It consumes raw data from the UCI HAR Dataset and produces formatted and summarized output.

R packages required:
reshape2

Data files consumed:
features.txt
activity_labels.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt
test/subject_test.txt
test/X_test.txt
test/y_test.txt

The program executes the following steps:
* Read feature names from features.txt, then reduce the set to only include features containing "mean()" or "std()" in the name
* Read activity names from activity_labels.txt
* Read all three files from the training data set
* Read all three files from the test data set
* Combine the training and test data together
* Merge feature names and activity names into the combined set

This completes the main data set, in data frame dataFinal.  Then:

* Use melt() (from reshape2) to express the data frame in long form, moving variables from columns to rows
* Aggregate the melted dataset to produce means across all subject, activity, and variable combinations

This completes the secondary data set, in data frame dataSummary.  Finally:

* Product output file dataSummary.txt in the working directory from data frame dataSummary.
