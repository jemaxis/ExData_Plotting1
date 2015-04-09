# Cse4ProjectAssignment1 - Plot 4
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
names(df.data)=c("date","time","global.active.power","global.reactive.power","voltage","global_intensity","sub.metering.1","sub.metering.2","sub.metering.3")
#=== Creation of Plot ===
library(dplyr)
daytime.data <- paste(df.data$date,df.data$time)%>%strptime(,format="%d/%m/%Y %H:%M:%S")
#Initiate Graphic Device
png(filename = "Plot4.png", width=480, height=480)
par(cex=1, mfrow=c(2,2)) # adj font and increase number of graphs in a plot
#Sub Plot1
plot(daytime.data,df.data$global.active.power,col="black",ylab="Global Active Power",xlab="", type="l")
#Sub Plot 2
plot(daytime.data,df.data$voltage,ylab="Voltage",xlab="datetime",type="l", col="black")
#Sub Plot3
plot(daytime.data,df.data$sub.metering.1,type = "l",col="black",ylab="Energy sub metering",xlab="")
points(daytime.data,df.data$sub.metering.2,type = "l",col="red")
points(daytime.data,df.data$sub.metering.3,type="l",col="blue")
legend("topright", bty="n",lty=1,lwd=0.1, cex=0.9, legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
#Sub Plot 4
plot(daytime.data,df.data$global.reactive.power,col="black",type="l",ylab="Global_reactive_power",xlab="datatime")
dev.off()
