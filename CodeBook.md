
Codebook for Coursera Project

Course: Getting and Cleaning Data

Author: Larry Croney

Date: Feb. 11, 2015

The run_analysis.R program creates two datasets: dataFinal and dataSummary.  Both datasets are detailed below.  Processing steps are detailed in README.md.


<pre>

dataFinal
This dataset contains one row for each observation from the phone's sensors (10299 observations),
and 66 variables are provided in columns.  The only tranformation performed on the data was converting
the subject id to a factor, and mapping the activity names provided in the activity_labels.txt file
included with the raw data to the activity id's as a factor.  Only the mean() and std() variables
from the raw data were included, and both the training and test data sets were combined into a single
set.

subject         factor containing the id of the 30 subjects involved in the experiment
activity        factor containing a text description of the six activities classified
                  WALKING
                  WALKING_UPSTAIRS
                  WALKING_DOWNSTAIRS
                  SITTING
                  STANDING
                  LAYING
The remaining 66 columns are the 66 mean() or std() variables from the raw dataset, and are named
accordingly.  All represent sensor data, and are normalized and bounded within [-1, 1].




dataSummary
This is a summarization of the dataFinal dataset.  For each combination of subject and activity, each
variable is averaged.  The dataset is in long form, which results in 4 columns and 11880 rows.

subject         factor containing the id of the 30 subjects involved in the experiment
activity        factor containing a text description of the six activities classified
                  WALKING
                  WALKING_UPSTAIRS
                  WALKING_DOWNSTAIRS
                  SITTING
                  STANDING
                  LAYING
variable        factor containing the names of each of the 66 mean() or std() variables from the raw dataset
mean            numeric representing the mean of all observations for this subject, activity, variable combination

</pre>
