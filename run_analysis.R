# 1. Read data into R
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/Y_test.txt")
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/Y_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")
# 2. Merge data
data <- rbind(cbind(subject_test,ytest,xtest),cbind(subject_train,ytrain,xtrain))
# 3. Extract measurements on mean and standard deviation
feature <- read.table("features.txt",stringsAsFactors = FALSE)[,2]
fIn <- grep("mean|std",feature)
fulldata <- data[,c(1,2,fIn+2)]
colnames(fulldata) <- c("subject","activity",feature[fIn])
# 4. Change activity names
activityName <- read.table("activity_labels.txt")
fulldata$activity <- factor(fulldata$activity,labels = activityName[[2]])
# 5. Use descriptive variable names
names(fulldata) <- gsub("\\(\\)","",names(fulldata))
names(fulldata) <- gsub("\\-mean","Mean",names(fulldata))
names(fulldata) <- gsub("\\-std","Std",names(fulldata))
names(fulldata) <- gsub("^t","Time",names(fulldata))
names(fulldata) <- gsub("^f","Frequency",names(fulldata))
# 6. Create table
library(dplyr)
groupdata <- group_by(fulldata,activity,subject)
groupdt <- summarise_each(groupdata,funs(mean))
write.table(groupdt, "MeanData.txt", row.names = FALSE)