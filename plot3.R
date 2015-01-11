plot3 <- function() {
    # Read data
    message("Reading data...")
    data <- read.csv2("data/household_power_consumption.txt")
    
    # Subset data
    message("Filtering data...")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    d1 <- as.Date("2007-02-01")
    d2 <- as.Date("2007-02-02")
    data <- data[data$Date == d1 | data$Date == d2, ]
    dt <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
    sm1 <- as.numeric(as.character(data$Sub_metering_1))
    sm2 <- as.numeric(as.character(data$Sub_metering_2))
    sm3 <- as.numeric(as.character(data$Sub_metering_3))
    
    # Create plot
    message("Creating plot...")
    png(file="plot3.png",width=480,height=480, bg="transparent")
    plot(dt, sm1, type="l", ylab="Energy sub metering", xlab="")
    lines(dt, sm2, type="l", col = "red")
    lines(dt, sm3, type="l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
    dev.off()
}