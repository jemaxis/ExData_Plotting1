# Cse4ProjectAssignment1 Plot 1
rm(list=ls())
setwd("C:\\Rassignment\\Cse4Project\\CseAssign1")
#=== Read just the first column of data which is "Date" ===
df.dates <-read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses=c("character","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL"),na.strings="?",stringsAsFactors = FALSE)
test<-which(df.dates$Date == "1/2/2007" | df.dates$Date=="2/2/2007")
firstrow <- test[1]
numrows <- length(test)
#=== Obtain required data set ===
df.data <-read.table("household_power_consumption.txt",header = FALSE, sep = ";",skip = firstrow, nrows=numrows, stringsAsFactors = FALSE)
nrow(df.data) # check to ensure have 2880 observations
#=== Creation of Plot ===
png(file = "RPlot1.png", width=480, height=480)
hist(df.data$V3,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()