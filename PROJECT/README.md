The following file describes the execution of run_analysis.r

First six lines create the directory where the data will be stored and unzipped.
Consecutively, dplyr library is loaded

After that, the features are loaded with the read.csv function (using " " as a separator)
Then, both x and y training sets are loaded with read.csv and read.table.
Finally, the subject data is loaded as well, which consists uniquely of the number of the subject.

Once the train data is loaded, with the data.frame function, a dataframe is created from these three datasets mentioned earlier.
The column names of the first two columns were changed to more user friendly labels.


This exact same process is done to the test sets as well, which includes the X, Y, and Subject test sets.

Once the test and train sets have their respective data frame, they are merged by rows using the rbind function. 
This was saved under the variable named total_data.

Afterwards, since the activity column only includes numbers, we use the text file given to change the numbers to their corresponding 
activity with the for loop and replacing it with a list with the activity names.

Once that is done, the names of the columns are quite complicated to read. The gsub function was used to change the list of names of the data
frame. Regular expressions were used in two instances to change the undesired text. 

With that done, the final data was made with the aggregate function, which splits the data into subsets and computes a statistics function on 
each (in this case the mean, as mentioned in the instructions). The by= argument defines by what columns will the new dataframe be arranged.

Finally, the data is exported in txt form using write.table.





VARIABLE CODE BOOK 

Feature Selection 
=================


The signals that were recorded and used on the final dataset are: 
"subject" "Activity" 
"TimeDomain_Body_Accelerometer__Mean_X" 
"TimeDomain_Body_Accelerometer__Mean_Y" 
"TimeDomain_Body_Accelerometer__Mean_Z" 
"TimeDomain_Gravity_Accelerometer__Mean_X" 
"TimeDomain_Gravity_Accelerometer__Mean_Y" 
"TimeDomain_Gravity_Accelerometer__Mean_Z" 
"TimeDomain_Body_Accelerometer_Jerk_Mean_X" 
"TimeDomain_Body_Accelerometer_Jerk_Mean_Y" 
"TimeDomain_Body_Accelerometer_Jerk_Mean_Z" 
"TimeDomain_Body_Gyroscope__Mean_X" 
"TimeDomain_Body_Gyroscope__Mean_Y"
"TimeDomain_Body_Gyroscope__Mean_Z" 
"TimeDomain_Body_Gyroscope_Jerk_Mean_X" 
"TimeDomain_Body_Gyroscope_Jerk_Mean_Y" 
"TimeDomain_Body_Gyroscope_Jerk_Mean_Z" 
"TimeDomain_Body_Accelerometer__Magnitude__mean" 
"TimeDomain_Gravity_Accelerometer__Magnitude__mean" 
"TimeDomain_Body_Accelerometer_Jerk_Magnitude__mean" 
"TimeDomain_Body_Gyroscope__Magnitude__mean" 
"TimeDomain_Body_Gyroscope_Jerk_Magnitude__mean"
"FrequencyDomain_Body_Accelerometer__Mean_X" 
"FrequencyDomain_Body_Accelerometer__Mean_Y" 
"FrequencyDomain_Body_Accelerometer__Mean_Z" 
"FrequencyDomain_Body_Accelerometer__meanFreq_X" 
"FrequencyDomain_Body_Accelerometer__meanFreq_Y" 
"FrequencyDomain_Body_Accelerometer__meanFreq_Z" 
"FrequencyDomain_Body_Accelerometer_Jerk_Mean_X" 
"FrequencyDomain_Body_Accelerometer_Jerk_Mean_Y" 
"FrequencyDomain_Body_Accelerometer_Jerk_Mean_Z" 
"FrequencyDomain_Body_Accelerometer_Jerk_meanFreq_X" 
"FrequencyDomain_Body_Accelerometer_Jerk_meanFreq_Y" 
"FrequencyDomain_Body_Accelerometer_Jerk_meanFreq_Z" 
"FrequencyDomain_Body_Gyroscope__Mean_X"
"FrequencyDomain_Body_Gyroscope__Mean_Y"
"FrequencyDomain_Body_Gyroscope__Mean_Z" 
"FrequencyDomain_Body_Gyroscope__meanFreq_X"
"FrequencyDomain_Body_Gyroscope__meanFreq_Y" 
"FrequencyDomain_Body_Gyroscope__meanFreq_Z" 
"FrequencyDomain_Body_Accelerometer__Magnitude__mean" 
"FrequencyDomain_Body_Accelerometer__Magnitude__meanFreq" 
"FrequencyDomain_BodyBody_Accelerometer_Jerk_Magnitude__mean" 
"FrequencyDomain_BodyBody_Accelerometer_Jerk_Magnitude__meanFreq" 
"FrequencyDomain_BodyBody_Gyroscope__Magnitude__mean" 
"FrequencyDomain_BodyBody_Gyroscope__Magnitude__meanFreq" 
"FrequencyDomain_BodyBody_Gyroscope_Jerk_Magnitude__mean"
"FrequencyDomain_BodyBody_Gyroscope_Jerk_Magnitude__meanFreq" 
"TimeDomain_Body_Accelerometer__StandardDeviation_X" 
"TimeDomain_Body_Accelerometer__StandardDeviation_Y" "
TimeDomain_Body_Accelerometer__StandardDeviation_Z" 
"TimeDomain_Gravity_Accelerometer__StandardDeviation_X"
"TimeDomain_Gravity_Accelerometer__StandardDeviation_Y" 
"TimeDomain_Gravity_Accelerometer__StandardDeviation_Z" 
"TimeDomain_Body_Accelerometer_Jerk_StandardDeviation_X"
"TimeDomain_Body_Accelerometer_Jerk_StandardDeviation_Y" 
"TimeDomain_Body_Accelerometer_Jerk_StandardDeviation_Z" 
"TimeDomain_Body_Gyroscope__StandardDeviation_X" 
"TimeDomain_Body_Gyroscope__StandardDeviation_Y" 
"TimeDomain_Body_Gyroscope__StandardDeviation_Z" 
"TimeDomain_Body_Gyroscope_Jerk_StandardDeviation_X" 
"TimeDomain_Body_Gyroscope_Jerk_StandardDeviation_Y"
"TimeDomain_Body_Gyroscope_Jerk_StandardDeviation_Z" 
"TimeDomain_Body_Accelerometer__Magnitude__std" 
"TimeDomain_Gravity_Accelerometer__Magnitude__std" 
"TimeDomain_Body_Accelerometer_Jerk_Magnitude__std" 
"TimeDomain_Body_Gyroscope__Magnitude__std"
"TimeDomain_Body_Gyroscope_Jerk_Magnitude__std" 
"FrequencyDomain_Body_Accelerometer__StandardDeviation_X" "FrequencyDomain_Body_Accelerometer__StandardDeviation_Y"
"FrequencyDomain_Body_Accelerometer__StandardDeviation_Z" "FrequencyDomain_Body_Accelerometer_Jerk_StandardDeviation_X" 
"FrequencyDomain_Body_Accelerometer_Jerk_StandardDeviation_Y" "FrequencyDomain_Body_Accelerometer_Jerk_StandardDeviation_Z" 
"FrequencyDomain_Body_Gyroscope__StandardDeviation_X" "FrequencyDomain_Body_Gyroscope__StandardDeviation_Y" "FrequencyDomain_Body_Gyroscope__StandardDeviation_Z" "FrequencyDomain_Body_Accelerometer__Magnitude__std" "FrequencyDomain_BodyBody_Accelerometer_Jerk_Magnitude__std" "FrequencyDomain_BodyBody_Gyroscope__Magnitude__std" 
"FrequencyDomain_BodyBody_Gyroscope_Jerk_Magnitude__std"



The set of variables that were estimated from these signals and included in the final dataset are: 

mean(): Mean value
std(): Standard deviation


The complete list of variables of each feature vector is available in 'features.txt'
