##Project 1
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
Filter_Data <- power[power$Date %in% c("1/2/2007","2/2/2007"),]
Assign_Time <- strptime(paste(Filter_Data$Date, Filter_Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 
Merge_Data <- cbind(Assign_Time, Filter_Data)


##PLOT1 

hist(Merge_Data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

##PLOT2

plot(Merge_Data$Assign_Time, Merge_Data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

## PLOT3

plot(Merge_Data$Assign_Time, Merge_Data$Sub_metering_1, type="l", col= "black", xlab="", ylab="Energy sub metering")
lines(Merge_Data$Assign_Time, Merge_Data$Sub_metering_2, col="red")
lines(Merge_Data$Assign_Time, Merge_Data$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()

## PLOT4

par(mfrow=c(2,2))
plot(Merge_Data$Assign_Time, Merge_Data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(Merge_Data$Assign_Time, Merge_Data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(Merge_Data$Assign_Time, Merge_Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Merge_Data$Assign_Time, Merge_Data$Sub_metering_2, type="l", col="red")
lines(Merge_Data$Assign_Time, Merge_Data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col= c("black","red","blue"))
plot(Merge_Data$Assign_Time, Merge_Data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()