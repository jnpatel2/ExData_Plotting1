#Import packages
library(downloader)
library(dplyr)
library(quantmod)
library(lubridate)
library(stringr)


#Read Data set and cleaning data
pwr_con <- read.table("./household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")
pwr_sel <- filter(pwr_con,Date == "1/2/2007" | Date == "2/2/2007")
date_time = as.POSIXlt(paste(pwr_sel[,1],pwr_sel[,2]),
                       format="%d/%m/%Y %H:%M:%S", tz="GMT") 
pwr_sel[,1] <- as.Date(pwr_sel[,1],"%d/%m/%Y")

#Plot 4
png(file="plot4.png",height = 480,width = 480)

par(mfcol=c(2,2))
plot(date_time,
     pwr_sel$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab= "")

plot(date_time,
     pwr_sel$Sub_metering_1, 
     type="l",
     ylab="Energy sub metering",
     xlab= "",
     col="black")
points(date_time,
       pwr_sel$Sub_metering_2,
       type="l",
       col="red")
points(date_time,
       pwr_sel$Sub_metering_3,
       type="l",
       col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=c(1,1,1),
       bty="n")
plot(date_time,
     pwr_sel$Voltage,
     ylab="Voltage",
     xlab="datetime",
     type="l")
plot(date_time,
     pwr_sel$Global_reactive_power,
     ylab="Global_reactive_power",
     xlab="datetime",
     type="l")

dev.off()
