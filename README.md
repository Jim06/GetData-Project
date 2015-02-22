##The following describes how the script within this repository works

###The script is located in the R file with the name *run_analysis.R*

The script executes the following steps in the order listed:

 - The script first downloads the **Human Activity Recognition Using Smartphones Data Set** into a temporary file
 - A list of the files within the zip file is then obtained
 - Based on the file list, the Training set data is extracted followed by the Test set data
 - The Training set contains 7,352 observations while the Test set contains 2,947 observations where each observation is a 561 variable vector
 - Next the labels for the 6 activities are extracted (i.e. WALKING, etc.)

 - Then the subject ids are extracted for the Training set and the Test set.
 - There are 30 subjects whose data was recorded.  70% (21) of the subjects are in the Training set and 30% (9) are in the Test set
 - There is no overlap of subjects between the Training and Test sets 
 - The order of the subject ids must be preserved as it identifies whose data is within the Training and Test sets

 - Correspondingly the activity ids for the Training set and the Test set are extracted.
 - These ids identify which activity the subject was performing when the observation was taken.
 - As with the subject ids, order must be preserved.

 - The list of features is then extracted.  Once done the temporary file is deleted as all required information has been extracted.
 - A index list is then created to indicate which features contain a **Mean** value or a **Standard deviation**
 - The Training set and the Test set are then row merged (Step 1 of requirements)
 - Similarly the subject ids and the activity ids are combined
 - The mean and standard deviation measures are then extracted (Step 2 of requirements).  There are 66 measures of either the Mean value or the Standard deviation.

 - The combined activity ids are then replaced by their corresponding activity name (Step 3 of requirements)
 - The column names within the extracted set (Step 2 above) are then appropriately labeled (Step 4 of requirements)

 - The extracted set is then grouped by subject and by activity
 - The grouped data is then summarized to give the average by subject by activity (Step 5 of requirements).
 - Since there are 30 subjects and 6 activities, the final summarized data set contains 180 rows of averages for the 66 extracted values.
