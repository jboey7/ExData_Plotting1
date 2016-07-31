## Loading Data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, header = T, sep = ";", stringsAsFactors = F, dec = ".")

## Only load data from 1/2/2007 to 2/2/2007
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Creating PNG file
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubsetData$Global_reactive_power)
Voltage <- as.numeric(SubsetData$Voltage)
Sub_metering_1 <- as.numeric(SubsetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(SubsetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(SubsetData$Sub_metering_3)

## Plotting the top left graph
plot(DateTime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

## Plotting the top right graph
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Plotting the bottom left graph (Code is reuse from plot3.R, but alter a little on the legend format)
plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, type = "l", col = "red")
lines(DateTime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

## Plotting the bottom right graph
plot(DateTime, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
