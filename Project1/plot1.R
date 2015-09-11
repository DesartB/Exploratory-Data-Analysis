# This script creates plot 1 of the Course Project 1 of the "Exploratoy Data Analysis" course.
# It creates a PNG file of 480x480 pixels representing Plot 1.
# Author: Bruno Desart
# Date : 9 September 2015

# Reading the file
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrow = 2075260)

# Date and time conversion into Date/Time classes in R
dtchar <- paste(data$Date, data$Time, sep = " ")
dt <- strptime(dtchar, "%d/%m/%Y %H:%M:%S")

# Subset data from the dates 2007-02-01 and 2007-02-02
fromdate <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
todate <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")
ok <- (dt >= fromdate & dt < todate)
data <- cbind(data,Date_R = as.Date(data$Date, "%d/%m/%Y"), Time_R = dt, OK = ok)
datas <- data[data$OK == TRUE,]
datas2 <- na.omit(datas)

# Plot 1 saved into the file name plot1.png
png("plot1.png", width = 480, height = 480, units = "px")
hist(datas2$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()

