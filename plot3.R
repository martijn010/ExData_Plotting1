#reading data (set your work directory first) and fixing dates/times
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, data$Date>="2007-02-01" & data$Date <="2007-02-02")
datetime <- paste(data$Date, data$Time)
data$datetime <- as.POSIXct(datetime)
Sys.setlocale(locale = "USA")

#plot3
png(filename = "plot3.png", height=480, width=480)

plot(data$Sub_metering_1~data$datetime, type = "l", 
     ylab = "Energy Sub Metering", xlab = "")
lines(data$Sub_metering_2~data$datetime, col = "Red")
lines(data$Sub_metering_3~data$datetime, col = "Blue")
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
