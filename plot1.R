#Loading Data

setwd("C:/Users/Class/datasciencecoursera")
library(data.table)

power <- fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings="?")
power_head <- fread("household_power_consumption.txt", nrows=0)

names(power) <- names(power_head)

power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

power$dateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
power$Voltage <- as.numeric(power$Voltage)
power$Global_intensity <- as.numeric(power$Global_intensity)
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)                            


# Creating PNG File

png(file="plot1.png")

hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")

dev.off()