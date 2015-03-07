## Subsetting the data for dates required some manual calculation first - found it difficult to subset by date without calling in ALL the data first
data <- read.table("household_power_consumption.txt", skip= 66637, nrow=2881, sep=";")

## Getting names of data columns
name <- read.table("household_power_consumption.txt", nrow=1, sep=";", header=TRUE)

## Allocating names of columns to data subset
names(data)[1:9] <- names(name)[1:9]

## Opening PNG device and create .PNG file in wd
png(filename="plot1.png", width=480, height=480, units= "px")

## Plot histogram of Global active power over two days of Feb 2007.
hist(data$Global_active_power, col="red", breaks=11, xlab= "Global Active Power (kilowatts)", main =" Global Active Power")

##  turn PNG device off
dev.off()
