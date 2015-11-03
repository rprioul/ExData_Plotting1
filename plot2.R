## Setting up the necessary package, reading and filtering the data and

require("dplyr")
require("grDevices")

setwd("C:/Users/Rémy/Documents")
data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- data[data$Date %in% as.Date(c("2007/02/01","2007/02/02")),]

## Converting the classes of the useful columns and realising the plot

setwd("C:/Users/Rémy/Documents/ExData_Plotting1/")

data$Global_active_power <- as.numeric(data$Global_active_power)
vec <- paste (data$Date,data$Time,sep=":")
vec <- strptime(vec, format = "%Y-%m-%d:%H:%M:%S")
png(file="plot2.png", width = 480, height = 480)
plot(x=vec, y=data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off() 