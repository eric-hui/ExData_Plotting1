#!/usr/bin/env Rscript
# plot2.R

# read in data file
fname <- "foo.txt"
fname <- "household_power_consumption.txt"
classes <- c("character", "character", "numeric", "numeric", "numeric", 
            "numeric", "numeric", "numeric", "numeric")
power <- read.csv(fname, sep = ";", na.strings = "?", stringsAsFactors = F, 
            colClasses = classes)

# subset data for just 1Feb2007 and 2Feb2007
# note: date format in file is d/m/yyyy, leading zeros not added
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

# create timestamp
power$timestamp <- with(power, strptime(paste(Date, Time), 
            "%d/%m/%Y %H:%M:%S"))

# > names(power)
# [1] "Date"                  "Time"                 
# [3] "Global_active_power"   "Global_reactive_power"
# [5] "Voltage"               "Global_intensity"     
# [7] "Sub_metering_1"        "Sub_metering_2"       
# [9] "Sub_metering_3"        "timestamp"  

# plot2
png(file = "plot2.png", width = 480, height = 480)
# par(mfrow = c(1, 1), mar = c(5.1, 4.1, 4.1, 2.1))
plot(power$timestamp, power$Global_active_power, type = "l", xlab = "", 
            ylab = "Global Active Power (kilowatts)")
dev.off()

