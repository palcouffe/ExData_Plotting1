################################################################################
# File Name : plot4.R
# Reference : Exploratory Data Analysis Course Project 1
# Author    : Ph A
# Summary   : script to produce plot 4
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

png("plot4.png")

# create a 2 by 2 zone, plots will be placed left to right startng at the top left
par(mfrow=c(2,2))

# top left plot
# note there is a slight variation from plot 2 as the y axis label is different here
plot(SubDataSet$Date_time, SubDataSet$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# top right plot
plot(SubDataSet$Date_time, SubDataSet$Voltage, type="l", xlab="datetime", ylab="Voltage")

# bottom left plot
# note there is a slight variation from plot 3 as the legend as no border here
plot(SubDataSet$Date_time, SubDataSet$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(SubDataSet$Date_time, SubDataSet$Sub_metering_2, type="l", col="red")
lines(SubDataSet$Date_time, SubDataSet$Sub_metering_3,type="l", col="blue")
legend(x="topright", c("sub_metering_1","sub_metering_2","sub_metering_3"),bty="n", lty=c(1,1,1), col=c("black","red","blue"))

# bottom right plot
plot(SubDataSet$Date_time, SubDataSet$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()