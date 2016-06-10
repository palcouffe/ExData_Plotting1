################################################################################
# File Name : plot2.R
# Reference : Exploratory Data Analysis Course Project 1
# Author    : Ph A
# Summary   : script to produce plot 2
################################################################################

################################################################################
# Step 0    : Read the data downloaded (in working dir) and subset for specific
#             dates 1/2/2007 and 2/2/2007 (format %d/%m/%Y)
################################################################################

AllDataSet <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors = FALSE)
SubDataSet <- AllDataSet[AllDataSet$Date %in% c("1/2/2007","2/2/2007"),]

################################################################################
# Step 1    : Create the plot with png device (created by default with
#             width of 480 pixels and a height of 480 pixels)
################################################################################

# Add an extra variable Date_time to be used as x axis
SubDataSet$Date_time <- strptime(paste(SubDataSet$Date, SubDataSet$Time), format="%d/%m/%Y %H:%M:%S")

# Make sure things will be in english .... (I am in Quebec ...)
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

png("plot2.png")
plot(SubDataSet$Date_time, SubDataSet$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()