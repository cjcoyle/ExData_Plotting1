# Download and Clean Data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
dataChart <- subset(data, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))

# Create Chart
png("Rplot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

# Chart 1
with(dataChart, plot(Global_active_power ~ DateTime, type = "l", xlab = "", ylab = "Global Active Power"))

# Chart 2
with(dataChart, plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
with(dataChart, lines(DateTime, Sub_metering_2, col = "red"))
with(dataChart, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty = "n", cex = 0.9)

# Chart 3
with(dataChart, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

# Chart 4
with(dataChart, plot(DateTime, Global_reactive_power, xlab = "datetime", type = "l"))

dev.off()