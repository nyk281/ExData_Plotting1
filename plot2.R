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

##Plot
plot(data$Days,data$Global_active_power, type = "n", xlab = " ", ylab = "Global Active Power (kilowatts)")
lines(data$Days, data$Global_active_power, lwd = 1)

##Save to file
dev.copy(png,file = "plot2.png")
dev.off()
