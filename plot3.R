## Setting up the necessary package, reading and filtering the data and

require("dplyr")
require("grDevices")

setwd("C:/Users/Rémy/Documents")
data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- data[data$Date %in% as.Date(c("2007/02/01","2007/02/02")),]

## Converting the classes of the useful columns 

setwd("C:/Users/Rémy/Documents/ExData_Plotting1/")

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
vec <- paste (data$Date,data$Time,sep=":")
vec <- strptime(vec, format = "%Y-%m-%d:%H:%M:%S")

## Realising the plot, adding the legend and copying to a PNG file

png(file="plot3.png", width = 480, height = 480)
plot(x=vec, y=data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(vec, data$Sub_metering_1, type="l")
points(vec, data$Sub_metering_2, type="l", col="red")
points(vec, data$Sub_metering_3, type="l", col="blue")
legend("topright",pch="__", col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() 