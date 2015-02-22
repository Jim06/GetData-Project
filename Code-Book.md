##This file describes the variables within the R file *run_analysis.R*

**Variable**     **Variable Description**

 *myzip* - a temporary file containing the **Human Activity Recognition Using Smartphones Data Set** zip file
 
 *filelist* - a list of the files within the zip file
 
 *train_set* - the Training set data (7,352 observations of 561 variables) 
 
 *test_set* - the Test set data (2,947 observations of 561 variables)
 
 *labels* -  the labels for the 6 activities (i.e. WALKING, etc.)

 *train_subject_id* - the subject ids for the Training set (7,352 ids with 21 distinct values)
 
 *test_subject_id* - the subject ids for the Test set (2,947 ids with 9 distinct values)
 
 *activity_train_labels* - the activity ids for the Training set (7,352 ids with 6 distinct values)
 
 *activity_test_labels* - the activity ids for the Test set (2,947 ids with 6 distinct values)
 
 *features* - the list of all features (561 distinct features)
 
 *extract_indices* - a index list indicating which features contain a **Mean** value or a **Standard deviation** (66 indices)
 
 *merged_set* - the Training set row merged with the Test set (10,299 observations of 561 variables)
 
 *merged_subject_id* - the Training set subject ids combined with the Test set subject ids (10,299 ids; 30 distinct values)
 
 *merged_activity_labels* -the Training set activity ids combined with the Test set activity ids and then then replaced by their corresponding activity name (10,299 names; 6 distinct values)

 *extract_merged* - the extracted mean and standard deviation measures column bound with the corresponding subject id and activity name (10,299 observations with 68 (66+2) variables) 

 *by_sub_act*  - the extracted set is grouped by subject and by activity (10,299 observations of 68 variables)
 
 *tidy* - the grouped data summarized to give the average by subject by activity (180 rows of 68 variables)
