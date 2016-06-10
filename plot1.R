################################################################################
# File Name : plot1.R
# Reference : Exploratory Data Analysis Course Project 1
# Author    : Ph A
# Summary   : script to produce plot 1
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

png("plot1.png")
hist(SubDataSet$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
