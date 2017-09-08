#reading data (set your work directory first) and fixing dates/times
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, data$Date>="2007-02-01" & data$Date <="2007-02-02")
datetime <- paste(data$Date, data$Time)
data$datetime <- as.POSIXct(datetime)
Sys.setlocale(locale = "USA")

#plot2
png(filename = "plot2.png", height=480, width=480)

plot(data$Global_active_power~data$datetime, type = "l", xlab="", 
     ylab = "Global Active Power (kilowatts)")

dev.off()
