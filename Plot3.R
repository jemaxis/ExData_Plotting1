# Cse4ProjectAssignment1 - Plot 3
rm(list=ls())
setwd("C:\\Rassignment\\Cse4Project\\CseAssign1")
#=== Read just the first column of data which is "Date" ===
df.dates <-read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses=c("character","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL"),na.strings="?",stringsAsFactors = FALSE)
test<-which(df.dates$Date == "1/2/2007" | df.dates$Date=="2/2/2007")
firstrow <- test[1]
numrows <- length(test)
#=== Obtain required data set ===
df.data <-read.table("household_power_consumption.txt",header = FALSE,sep = ";",skip = firstrow, nrows=numrows, stringsAsFactors = FALSE)
nrow(df.data) # check to ensure have 2880 observations
head(df.data)
names(df.data)=c("date","time","global.active.power","global.reactive.power","voltage","global_intensity","sub.metering.1","sub.metering.2","sub.metering.3")
names(df.data) 
#=== Creation of Plot ===
library(dplyr)
daytime.data <- paste(df.data$date,df.data$time)%>%strptime(,format="%d/%m/%Y %H:%M:%S")
#Initiate Graphic Device
png(filename = "Plot3.png", width=480, height=480)
par(cex=1, mar=c(5,4,4,2)) # adj font and margin
plot(daytime.data,df.data$sub.metering.1,type = "l",col="black",ylab="Energy sub metering",xlab="")
points(daytime.data,df.data$sub.metering.2,type = "l",col="red")
points(daytime.data,df.data$sub.metering.3,type="l",col="blue")
legend("topright", yjust=0, merge=FALSE, lty=1,lwd=1, cex=1, legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
dev.off()
