
setwd("C:/R")

getwd()
rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data to only the two dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
# Create Plot 2

data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy Sub Metering", xlab = "Day")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, lwd =3, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



# Save file as pdf file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)




