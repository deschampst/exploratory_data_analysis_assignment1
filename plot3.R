##### READ IN THE DATA #####

# download and unzip the file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "power-consumption.zip")
unzip("power-consumption.zip")

# read data into R
fulldata <- read.table("household_power_consumption.txt",
                       sep = ";", header = TRUE, na.strings = "?",
                       nrows = 2075259)
data <- subset(fulldata, fulldata$Date == "1/2/2007" | fulldata$Date == "2/2/2007")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y%H:%M:%S")

##### CREATE PLOT #####

# create plot directly to png
png(file = "plot3.png")
with(data, plot(data$Sub_metering_1 ~ data$DateTime, type = "n", 
     xlab = "", ylab = "Energy sub metering"))
lines(data$Sub_metering_1 ~ data$DateTime, col = "black")
lines(data$Sub_metering_2 ~ data$DateTime, col = "red")
lines(data$Sub_metering_3 ~ data$DateTime, col = "blue")
legend("topright", lty = c(1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# turn off device
dev.off()
