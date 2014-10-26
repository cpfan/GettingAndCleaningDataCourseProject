UCI HAR Dataset Data Dictionary - Getting and Cleaning Data - Course Project
================================================================================

#####Activity Label: Column name "activity_label"

Describes the activities that performed by the subjects in the experiment. 

There is 6 types of activity performed:
        1. Laying
        2. Sitting
        3. Standing
        4. Walking
        5. Walking Downstair
        6. Walking Upstair


#####Subject: Column name "subject"
Describes the test subject of the experiment, in this experiment, there are 30 
volunteers who took part. They are indicate by number 1 to 30.


#####Feature Vectors: Column name "<Feature>-mean()-X",
#####                             "<Feature>-mean()-Y", 
#####                             "<Feature>-mean()-Z",
#####                             "<Feature>-std()-X", 
#####                             "<Feature>-std()-Y", 
#####                             "<Feature>-std()-Z"

Contains the mean and std deviation of the each features. The features is prefix 
with a t which stand for Time while the prefix with f represents frequency and 
end with the features type for the records. Each row of the obseration is tagged 
to a specific activity and individual subject.

The list of features are as follow:
          * tBodyAcc-XYZ
          * tGravityAcc-XYZ
          * tBodyAccJerk-XYZ
          * tBodyGyro-XYZ
          * tBodyGyroJerk-XYZ
          * tBodyAccMag
          * tGravityAccMag
          * tBodyAccJerkMag
          * tBodyGyroMag
          * tBodyGyroJerkMag
          * fBodyAcc-XYZ
          * fBodyAccJerk-XYZ
          * fBodyGyro-XYZ
          * fBodyAccMag
          * fBodyAccJerkMag
          * fBodyGyroMag
          * fBodyGyroJerkMag

For columns with "-mean()", contains are the mean value of the feature, while 
those columns with "-std()" contains the Standard deviation of the feature.