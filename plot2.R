# Download and Clean Data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
dataChart <- subset(data, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))

# Create Chart
png("Rplot2.png", width = 480, height = 480)
with(dataChart, plot(Global_active_power ~ DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()