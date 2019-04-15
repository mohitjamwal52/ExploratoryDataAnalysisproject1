library(data.table)


data <- read.table(file.choose(), header = TRUE, sep = ";", dec = ".", na.strings = "?")


data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time))

png("plot4.png",width = 480 , height = 480)

par(mfrow = c(2, 2))
plot(data2$DateTime, data2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", 
     type = "l")
plot(data2$DateTime, data2$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(data2$DateTime, data2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
plot(data2$DateTime, data2$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "l")

dev.off()
