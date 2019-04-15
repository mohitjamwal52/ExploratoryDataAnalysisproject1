library(data.table)


data <- read.table(file.choose(), header = TRUE, sep = ";", dec = ".", na.strings = "?")


data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time))


png("plot2.png",width = 480 , height = 480)
plot(data2$DateTime, data2$Global_active_power, xlab ="", ylab = "Global Active Power(kllowatts)", 
      type = "l")
dev.off()
