# This script creates plot 2 of the Course Project 1 of the "Exploratoy Data Analysis" course.
# It creates a PNG file of 480x480 pixels called plot2.png and representing Plot 2.
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

# Plot 2 saved into the file name plot1.png
png("plot2.png", width = 480, height = 480, units = "px")
with(datas2, plot(Time_R, Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l"))
dev.off()