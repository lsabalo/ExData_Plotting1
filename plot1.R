plot1 <- function() {
    # Read data
    message("Reading data...")
    data <- read.csv2("data/household_power_consumption.txt")
    
    # Subset data
    message("Filtering data...")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    d1 <- as.Date("2007-02-01")
    d2 <- as.Date("2007-02-02")
    gap <- as.numeric(as.character(data[data$Date == d1 | data$Date == d2, 3]))
    
    # Create plot
    message("Creating plot1.png...")
    png(file="plot1.png",width=480,height=480, bg="transparent")
    hist(gap, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
    dev.off()
}