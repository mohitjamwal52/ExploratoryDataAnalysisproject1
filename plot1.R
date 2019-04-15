library(data.table)


data <- read.table(file.choose(), header = TRUE, sep = ";", dec = ".", na.strings = "?")


data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]


png("plot1.png",width = 480 , height = 480)
hist(as.numeric(data2$Global_active_power), xlab = "Global Active Power(killowatts)",
       main = "Global Active Power", col = "red")

dev.off()