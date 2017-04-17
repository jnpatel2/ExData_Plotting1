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

#Plot 1
png(file="plot1.png",height = 480,width = 480)
par(mfrow=c(1,1))
hist(pwr_sel$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
