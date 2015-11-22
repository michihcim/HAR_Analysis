

#1-Merge train data set with activity and subject

X_train<-read.table("./HAR/train/X_train.txt")
y_train<-read.table("./HAR/train/y_train.txt")
subject_train<-read.table("./HAR/train/subject_train.txt")
train<-cbind(subject_train, y_train, X_train)

#1-Merge test data set with activity and subject

X_test<-read.table("./HAR/test/X_test.txt")
y_test<-read.table("./HAR/test/y_test.txt")
subject_test<-read.table("./HAR/test/subject_test.txt")
test<-cbind(subject_test, y_test, X_test)

#1-Merge train and test
HARdata<-rbind(train, test)

#2-Extract only mean and SD for each measurement. 
#4-Label dataset
#Variable namematch- indeces for feature names containing "mean" and "std"
#Variable filteredHAR- dataset with only mean and std for teach measurement

feature<-read.table("./HAR/features.txt")
featurename<-as.character(feature[,2])
colnames(HARdata)<-c("subject","activity",featurename)
namematch<-c(grep("mean", names(HARdata)),grep("std", names(HARdata)))
filteredHAR<-HARdata[,c(1,2,namematch)] 
        ## filteredHAR only contains columns with mean and std in its column names


#3-Descriptive activity name- change numbers in "activity" to descriptive names
filteredHAR[filteredHAR[,2]==1,2]<-"Walking"
filteredHAR[filteredHAR[,2]==2,2]<-"Walking_Upstairs"
filteredHAR[filteredHAR[,2]==3,2]<-"Walking_Downstairs"
filteredHAR[filteredHAR[,2]==4,2]<-"Sitting"
filteredHAR[filteredHAR[,2]==5,2]<-"Standing"
filteredHAR[filteredHAR[,2]==6,2]<-"Laying"

# 5- Create tidy dataset (Average of activity and subject)
summary<-aggregate(filteredHAR[,3:ncol(filteredHAR)], by=list(filteredHAR$subject, filteredHAR$activity),mean)
colnames(summary)[1]<-"subject"
colnames(summary)[2]<-"activity"

# Write the tidy dataset to a .txt file
write.table(summary, file="./HARsummary.txt", row.name=FALSE)

