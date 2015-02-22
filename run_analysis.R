#script to take extract subset from Smartphone data set and produce summary values 
  setwd("C:/Users/Jim/R-Prog/Week1")
  myURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  myzip <- tempfile()
  download.file(myURL,myzip)
  filelist <- unzip(myzip, list = TRUE)
  top_20 <- read.table(unzip(myzip,filelist[31,1]),nrows=20)
  colclass <- sapply(top_20,class)  
  train_set <- read.table(unzip(myzip, filelist[31,1]),colClasses=colclass)
  top_20 <- read.table(unzip(myzip,filelist[17,1]),nrows=20)
  colclass <- sapply(top_20,class)
  test_set <- read.table(unzip(myzip, filelist[17,1]),colClasses=colclass)
  labels <- readLines(unzip(myzip, filelist[1,1]))
  test_subject_id <- readLines(unzip(myzip, filelist[16,1]))
  train_subject_id <- readLines(unzip(myzip, filelist[30,1]))
  activity_test_labels <- readLines(unzip(myzip, filelist[18,1]))
  activity_train_labels <- readLines(unzip(myzip, filelist[32,1]))
  features <- readLines(unzip(myzip, filelist[2,1]))
  unlink(myzip)
  mean_indices <- grep(pattern="mean()",features, fixed=T)
  std_indices <- grep(pattern="std()",features, fixed=T)
  extract_indices <- sort(c(mean_indices,std_indices))
  merged_set <- rbind(train_set,test_set)
  merged_subject_id <- c(train_subject_id,test_subject_id)
  merged_activity_labels <- c(activity_train_labels,activity_test_labels)
  extract_merged <- merged_set[,extract_indices]
  labels <- gsub("^[1-6] ","",labels)
  labels[1] -> merged_activity_labels[merged_activity_labels=="1"]
  labels[2] -> merged_activity_labels[merged_activity_labels=="2"]
  labels[3] -> merged_activity_labels[merged_activity_labels=="3"]
  labels[4] -> merged_activity_labels[merged_activity_labels=="4"]
  labels[5] -> merged_activity_labels[merged_activity_labels=="5"]
  labels[6] -> merged_activity_labels[merged_activity_labels=="6"]
  colnames <- features[extract_indices]
  colnames <- gsub("^([0-9]{1,3}) ","",colnames); colnames <- gsub("-","_",colnames)
  colnames <- gsub("\\(\\)","",colnames)
  extract_merged <- cbind(merged_subject_id,merged_activity_labels,extract_merged)
  colnames(extract_merged) <- c("subject","activity",colnames)
  library(dplyr)
  by_sub_act <- group_by(extract_merged, subject, activity)
  tidy <- summarize(by_sub_act,mean(tBodyAcc_mean_X),mean(tBodyAcc_mean_Y),mean(tBodyAcc_mean_Z),
          mean(tBodyAcc_std_X),mean(tBodyAcc_std_Y),mean(tBodyAcc_std_Z),          
          mean(tGravityAcc_mean_X),mean(tGravityAcc_mean_Y),mean(tGravityAcc_mean_Z),       
          mean(tGravityAcc_std_X),mean(tGravityAcc_std_Y),mean(tGravityAcc_std_Z),        
          mean(tBodyAccJerk_mean_X),mean(tBodyAccJerk_mean_Y),mean(tBodyAccJerk_mean_Z),      
          mean(tBodyAccJerk_std_X),mean(tBodyAccJerk_std_Y),mean(tBodyAccJerk_std_Z),       
          mean(tBodyGyro_mean_X),mean(tBodyGyro_mean_Y),mean(tBodyGyro_mean_Z),         
          mean(tBodyGyro_std_X),mean(tBodyGyro_std_Y),mean(tBodyGyro_std_Z),          
          mean(tBodyGyroJerk_mean_X),mean(tBodyGyroJerk_mean_Y),mean(tBodyGyroJerk_mean_Z),     
          mean(tBodyGyroJerk_std_X),mean(tBodyGyroJerk_std_Y),mean(tBodyGyroJerk_std_Z),      
          mean(tBodyAccMag_mean),mean(tBodyAccMag_std),mean(tGravityAccMag_mean),      
          mean(tGravityAccMag_std),mean(tBodyAccJerkMag_mean),mean(tBodyAccJerkMag_std),      
          mean(tBodyGyroMag_mean),mean(tBodyGyroMag_std),mean(tBodyGyroJerkMag_mean),    
          mean(tBodyGyroJerkMag_std),mean(fBodyAcc_mean_X),mean(fBodyAcc_mean_Y),          
          mean(fBodyAcc_mean_Z),mean(fBodyAcc_std_X),mean(fBodyAcc_std_Y),           
          mean(fBodyAcc_std_Z),mean(fBodyAccJerk_mean_X),mean(fBodyAccJerk_mean_Y),      
          mean(fBodyAccJerk_mean_Z),mean(fBodyAccJerk_std_X),mean(fBodyAccJerk_std_Y),       
          mean(fBodyAccJerk_std_Z),mean(fBodyGyro_mean_X),mean(fBodyGyro_mean_Y),         
          mean(fBodyGyro_mean_Z),mean(fBodyGyro_std_X),mean(fBodyGyro_std_Y),          
          mean(fBodyGyro_std_Z),mean(fBodyAccMag_mean),mean(fBodyAccMag_std),          
          mean(fBodyBodyAccJerkMag_mean),mean(fBodyBodyAccJerkMag_std),mean(fBodyBodyGyroMag_mean),    
          mean(fBodyBodyGyroMag_std),mean(fBodyBodyGyroJerkMag_mean),mean(fBodyBodyGyroJerkMag_std))