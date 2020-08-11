
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("./Project Data")){
    dir.create("./Project Data")
    download.file(url, destfile = "./Project Data/projectData.zip", mode= wb)
    unzip("projectData.zip", exdir= getwd())}

library(dplyr)


features = read.csv("./Project Data/features.txt", header= FALSE, sep= " ")
features = features[,2]

x_train = read.table("./Project Data/train/X_train.txt")
y_train = read.csv("./Project Data/train/Y_train.txt", header= FALSE, sep= " ")
subject_train= read.csv("./Project Data/train/subject_train.txt", header= FALSE, sep= " ")




training_data=data.frame(subject_train, y_train ,x_train )
names(training_data)= c(c("Subject", "Activity"), features)


x_test= read.table("./Project Data/test/X_test.txt")
y_test= read.csv("./Project Data/test/Y_test.txt", sep= " ", header = FALSE)
subject_test= read.csv("./Project Data/test/subject_test.txt", sep= " ", header = FALSE)

test_data =data.frame(subject_test, y_test,x_test)
names(test_data)= c(c("Subject", "Activity"), features)

total_data= rbind(training_data, test_data)




mean_indexes= grep("mean()", features)
std_indexes= grep("std()", features)
stats_indexes= c(mean_indexes, std_indexes)

stats_data= total_data[,c(1,2, stats_indexes + 2)]




actLabels= as.character(read.table('./Project Data/activity_labels.txt', header = FALSE)[, 2])

newLabels= stats_data$Activity


list= vector(mode="character", length=10)
indexes= c(1:length(stats_data$Activity))

for (i in indexes){
    
    if (stats_data$Activity[i] == 1){
        list[i] = actLabels[1]
    }
    if (stats_data$Activity[i] == 2){
        list[i] = actLabels[2]
    }
    if (stats_data$Activity[i] == 3){
        list[i] = actLabels[3]
    }
    if (stats_data$Activity[i] == 4){
        list[i] = actLabels[4]
    }
    if (stats_data$Activity[i] == 5){
        list[i] = actLabels[5]
    }
    if (stats_data$Activity[i] == 6){
        list[i] = actLabels[6]
    }
}

stats_data$Activity = list



columns= names(stats_data)
columns

columns = gsub("[(][)]", "", columns)
columns = gsub("^t", "TimeDomain_", columns)
columns = gsub("^f", "FrequencyDomain_", columns)
columns = gsub("Acc", "_Accelerometer_", columns)
columns = gsub("Gyro", "_Gyroscope_", columns)
columns = gsub("Mag", "_Magnitude_", columns)
columns = gsub("-mean-", "_Mean_", columns)
columns = gsub("-std-", "_StandardDeviation_", columns)
columns = gsub("-", "_", columns)

names(stats_data) = columns



final_data <- aggregate(stats_data[,3:dim(stats_data)[2]], by = list( subject = stats_data$Subject, Activity = stats_data$Activity),FUN = mean)

write.table(x = final_data, file = "finalData.txt", row.names  = FALSE)