## same as plot2.R
data <- read.table("household_power_consumption.txt", skip= 66637, nrow=2881, sep=";")
name <- read.table("household_power_consumption.txt", nrow=1, sep=";", header=TRUE)
names(data)[1:9] <- names(name)[1:9]
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
data$day <- as.factor(weekdays(as.Date(data$Date)))
FridayStart <- nrow(data[data$day=="Thursday",data$day])
Fri <- nrow(data[data$day=="Friday",data$day])
SaturdayStart <- sum(FridayStart, Fri)


##  Open PNG device with name as plot3.R
png(filename="plot3.png", width=480, height=480, units= "px")

##  plot the data of 'Sub_metering_1' and annotate with data from 'Sub_metering_2 & 3'
plot(data$Sub_metering_1, col="white", xaxt="n", xlab="", ylab="Energy sub metering")

lines(data$Sub_metering_1, col="black")

lines(data$Sub_metering_2, col="red")

lines(data$Sub_metering_3, col="blue")

##  Add legend to plot
legend("topright",lwd="2", col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Add x-axis as per plot2.R
axis(side=1 , at = c(1, FridayStart, SaturdayStart), labels = c("Thu", "Fri", "Sat"))

##  Close PNG device
dev.off()
