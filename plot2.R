hpc <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep =";")
greplogi <- grepl("^1/2/2007$", hpc$Date) | grepl("^2/2/2007$", hpc$Date)
hpc <- hpc[greplogi,]
hpc$Time <- paste(hpc$Date, hpc$Time)
hpc$Time <- strptime(hpc$Time, "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",
    width = 480, height = 480)

plot(hpc$Time, hpc$Global_active_power, type ="l",
     xlab = "", ylab = "Global Active Power(kilowatts)")

dev.off()