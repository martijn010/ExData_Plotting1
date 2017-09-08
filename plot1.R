#reading data (set your work directory first) and fixing dates/times
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, data$Date>="2007-02-01" & data$Date <="2007-02-02")
datetime <- paste(data$Date, data$Time)
data$datetime <- as.POSIXct(datetime)
Sys.setlocale(locale = "USA")

#plot1
png(filename = "plot1.png", height=480, width=480)

hist(data$Global_active_power, main = "Global Active Power", 
     xlab="Global Active Power (kilowatts", ylab="Frequency", col="Red")

dev.off()

