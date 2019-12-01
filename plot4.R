hpc <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep =";")
greplogi <- grepl("^1/2/2007$", hpc$Date) | grepl("^2/2/2007$", hpc$Date)
hpc <- hpc[greplogi,]
hpc$Time <- paste(hpc$Date, hpc$Time)
hpc$Time <- strptime(hpc$Time, "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",
    width = 480, height = 480)

par(mfrow=c(2,2))

plot(hpc$Time, hpc$Global_active_power, type ="l",
     xlab = "", ylab = "Global Active Power")

plot(hpc$Time, hpc$Voltage, type ="l",
     xlab = "datetime", ylab = "Voltage")

plot(hpc$Time, hpc$Sub_metering_1, 
     type ="n",
     xlab = "",
     ylab = "Energy sub metering")
lines(hpc$Time, hpc$Sub_metering_1)
lines(hpc$Time, hpc$Sub_metering_2, col = "RED")
lines(hpc$Time, hpc$Sub_metering_3, col = "BLUE")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2,
       col = c("Black","Red", "Blue"))

plot(hpc$Time, hpc$Global_reactive_power, type ="l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()