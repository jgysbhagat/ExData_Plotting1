setwd("/Users/jigyasabhagat/Desktop/coursera/Exploratory Data Analysis")
library(dplyr)
elect=read.table("/Users/jigyasabhagat/Desktop/coursera/Exploratory Data Analysis/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?") %>%
    mutate(act_Date=as.Date(Date,"%d/%m/%Y")) %>%
    filter(act_Date==as.Date("2007-02-01") | act_Date==as.Date("2007-02-02"))
date_time=paste(elect$act_Date,elect$Time)
act_datetime=strptime(date_time,"%Y-%m-%d %H:%M:%S")
elect$act_datetime=act_datetime
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(elect$act_datetime,elect$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="datetime")
plot(elect$act_datetime,elect$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(elect$act_datetime,elect$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(elect$act_datetime,elect$Sub_metering_2,col="red")
lines(elect$act_datetime,elect$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = c(1,1,1),bty = "n",cex = 0.75)
plot(elect$act_datetime,elect$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()