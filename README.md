README- Getting and Cleaning Data - Course Project
================================================================================

###Downloading Data Set
1. Run download_data.R, to download the dataset.

Alternatively, download the file manually using the steps below:
1. Manually download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into the same folder as run_analysis.R script
2. Unzip the data set into a "data" folder
3. Ensure the content of the zip file is in "data/UCI HAR Dataset" folder where
"data" folder is at the same level as your run_analysis.R script. The README.txt
of the data set should be at "data/UCI HAR Dataset/README.txt"

###Run run_analysis.R

1. Run run_analysis.R

###Steps listed in run_analysis.R

 1. Load "features.text" into a DF and rename column to "id" and "feature"
 2. Use regular expression to select the required feaure columns which is mean() 
    and std() into a vector "featureRequired"
 3. Load Activities into a DF and rename column to "id" and "activity_Label"
 4. Load Training data from "x_train.txt" into "trainXData" DF and name column 
    header using "feature" from step 1.
 5. Load Training data from "y_train.txt" into "trainYData" DF and name column 
    header as "activity"
 6. Load Training data from "subject_train.txt" into "trainSubjectData" DF and 
    name column header as "subject"
 7. Filter "TrainXData" using "FeatureRequired" into a new DF call "trainDataRequired"
 8. Combine "trainDataRequire", "trainYData" and "trainSubjectData" into "trainData"
 9. Merge "trainData" with DF created in Step 2. into "trainDataComplete"
10. Repeat Step 4 to 9 for Test data.
11. Merge Training and Test data into "mergedData"
12. Convert "mergedData" using melt()
13. Tabulate the mean of the variables, by Activity and Subject into "result"
14. Write result into "tidyData.txt" using write.Table()