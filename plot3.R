## Loading Data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, header = T, sep = ";", stringsAsFactors = F, dec = ".")

## Only load data from 1/2/2007 to 2/2/2007
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Creating PNG file
png("plot3.png", width = 480, height = 480)

DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)

## Identifying data groups
Sub_metering_1 <- as.numeric(SubsetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(SubsetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(SubsetData$Sub_metering_3)

## Plot the graph with the data groups
plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, type = "l", col = "red")
lines(DateTime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
