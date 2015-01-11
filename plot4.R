plot4 <- function() {
    # Read data
    message("Reading data...")
    data <- read.csv2("data/household_power_consumption.txt")
    
    # Subset data
    message("Filtering data...")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    d1 <- as.Date("2007-02-01")
    d2 <- as.Date("2007-02-02")
    data <- data[data$Date == d1 | data$Date == d2, ]
    data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
    data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
    data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
    data$Voltage <- as.numeric(as.character(data$Voltage))
    data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
    data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
    data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
    
    # Create plot
    message("Creating plot...")
    png(file="plot4.png",width=480,height=480, bg="transparent")
    par(mfrow = c(2, 2))
    #par(mar=c(4, 4, 2, 2))
    plot(data$datetime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(data$datetime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
    plot(data$datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(data$datetime, data$Sub_metering_2, type="l", col = "red")
    lines(data$datetime, data$Sub_metering_3, type="l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")
    plot(data$datetime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
    dev.off()
}