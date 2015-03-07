
## same as plot1.R
data <- read.table("household_power_consumption.txt", skip= 66637, nrow=2881, sep=";")
name <- read.table("household_power_consumption.txt", nrow=1, sep=";", header=TRUE)
names(data)[1:9] <- names(name)[1:9]
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")



##  new column with day of week corresponding to date column
data$day <- as.factor(weekdays(as.Date(data$Date)))


##  Some numbers identifying the row positions of Friday & Saturday
FridayStart <- nrow(data[data$day=="Thursday",data$day])
Fri <- nrow(data[data$day=="Friday",data$day])
SaturdayStart <- sum(FridayStart, Fri)


## Opening PNG device and create .PNG file in wd
png(filename="plot2.png", width=480, height=480, units= "px")

##plot points - suppress labels, x-axis, points coloured white to suppress visibility  
plot(data$Global_active_power, col="white", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")

##  connect points with line
lines(data$Global_active_power)
## give x-axis to figure with appropriate lables
axis(side=1 , at = c(1, FridayStart, SaturdayStart), labels = c("Thu", "Fri", "Sat"))

##  turn PNG device off
dev.off()

