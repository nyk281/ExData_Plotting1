##Read the data into R
power<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

## Subset the data to include only desired dates
data <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

##Change the data classes from factor to numbers for most variables
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

##Convert Date & Time
data$Days<-paste(data$Date,data$Time)
data$Days<-strptime(data$Days, format = "%d/%m/%Y %H:%M:%S")

##Plot upper left corner
par(mfrow = c(2,2))
plot(data$Days,data$Global_active_power, type = "n", xlab = " ", ylab = "Global Active Power (kilowatts)")
lines(data$Days, data$Global_active_power, lwd = 1)

##Plot upper right corner
plot(data$Days,data$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(data$Days, data$Voltage, lwd = 1)

##Plot lower left corner
plot(data$Days,data$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
lines(data$Days, data$Sub_metering_1)
lines(data$Days,data$Sub_metering_2, col = "red") 
lines(data$Days,data$Sub_metering_3, col = "blue")
legend ("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lwd = 1, lty = 1)

##Plot lower right corner
plot(data$Days,data$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(data$Days, data$Global_reactive_power, lwd = 1)

##Save to file
dev.copy(png,file = "plot4.png")
dev.off()
