# Loading Data

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

png(file="plot4.png")

par(mfrow = c(2,2))

# Upper Left Hand Plot
plot(power$dateTime, power$Global_active_power, xlab = "",
     ylab = "Global Active Power", type = "n")
lines(power$dateTime, power$Global_active_power)

# Upper Right Hand Plot
plot(power$dateTime, power$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(power$dateTime, power$Voltage)

# Lower Left Hand Plot
plot(power$dateTime, power$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "n")
lines(power$dateTime, power$Sub_metering_1, col = "black")
lines(power$dateTime, power$Sub_metering_2, col = "red")
lines(power$dateTime, power$Sub_metering_3, col = "blue")
legend("topright", bty = "n", legend=c("Sub_metering_1", "Sub_metering_2",
                            "Sub_metering_3"), col=c("black","red","blue"), lwd=1)

# Lower Right Hand Plot
plot(power$dateTime, power$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "n")
lines(power$dateTime, power$Global_reactive_power)

dev.off()