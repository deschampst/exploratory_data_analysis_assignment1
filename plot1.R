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

# create plot on screen device
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# copy plot to png file
dev.copy(png, "plot1.png")
dev.off()
