## Loading Data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, header = T, sep = ";", stringsAsFactors = F, dec = ".")

## Only load data from 1/2/2007 to 2/2/2007
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Creating PNG file
png("plot2.png", width = 480, height = 480)

DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
plot(Datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()