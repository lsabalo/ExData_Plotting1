plot2 <- function() {
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
    gap <- as.numeric(as.character(data[, 3]))
    
    # Create plot
    message("Creating plot2.png...")
    png(file="plot2.png",width=480,height=480, bg="transparent")
    plot(dt, gap, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    dev.off()
}