## same as plot3.R
data <- read.table("household_power_consumption.txt", skip= 66637, nrow=2881, sep=";")
name <- read.table("household_power_consumption.txt", nrow=1, sep=";", header=TRUE)
names(data)[1:9] <- names(name)[1:9]
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
data$day <- as.factor(weekdays(as.Date(data$Date)))
FridayStart <- nrow(data[data$day=="Thursday",data$day])
Fri <- nrow(data[data$day=="Friday",data$day])
SaturdayStart <- sum(FridayStart, Fri)


##  Open PNG device with name as plot4.R
png(filename="plot4.png", width=480, height=480, units= "px")

##  specify a 2x2 plotting region (by row)
par(mfrow=c(2,2))

## Plot figure 1 as per plot2.R
plot(data$Global_active_power, col="white", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$Global_active_power)
axis(side=1 , at = c(1, FridayStart, SaturdayStart), labels = c("Thu", "Fri", "Sat"))

## plot figure 2 with same methodology as in plot2.R but for Voltage data
plot(data$Voltage, col="white", xaxt="n", xlab= "datetime", ylab="Voltage")
lines(data$Voltage, col="black")
axis(side=1 , at = c(1, FridayStart, SaturdayStart), labels = c("Thu", "Fri", "Sat"))

##plot figure 3 as per plot3.R
plot(data$Sub_metering_1, col="white", xaxt="n", xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_1, col="black")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend("topright",bty="n", lwd="2", col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side=1 , at = c(1, FridayStart, SaturdayStart), labels = c("Thu", "Fri", "Sat"))

##  Plot figure 4 with same method as previous figures but with reactive power data
plot(data$Global_reactive_power, col="white", xlab= "datetime", ylab = "Global_reactive_power", xaxt="n")
lines(data$Global_reactive_power)
axis(side=1 , at = c(1, FridayStart, SaturdayStart), labels = c("Thu", "Fri", "Sat"))

dev.off()
