## ##############################################################################################
## set you working directory use setwd
## Ensure that the text file has been downloaded from the website into your working directory
## Read in the data
## If the data has already been read in to h no need to run this line again. 
## ##############################################################################################
h<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

## convert Date to a class date
h$Date <- as.Date(h$Date,"%d/%m/%Y") 

##create a new datetime field 
h$DateTime <- strptime(paste(h$Date,h$Time), "%Y-%m-%d %H:%M:%S")
## ##############################################################################################
#
# Get the subset data and store it in variable x
# Convert the necessary data to numeric
#############################################################################
x<- subset(h,Date=="2007-02-01" | Date=="2007-02-02")

#Now convert the following factor data to numeric. To do this first converty to characther and then numeric.
x$Global_active_power <-as.character(x$Global_active_power)
x$Global_active_power <-as.numeric(x$Global_active_power)
x$Global_reactive_power <-as.character(x$Global_reactive_power)
x$Global_reactive_power <-as.numeric(x$Global_reactive_power)
x$Voltage<-as.character(x$Voltage)
x$Voltage<-as.numeric(x$Voltage)
x$Sub_metering_1 <- as.character(x$Sub_metering_1)
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2<- as.character(x$Sub_metering_2)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.character(x$Sub_metering_3)
x$Sub_metering_3<- as.numeric(x$Sub_metering_3)
#check data looks ok
#head(x)
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#windows()
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')

##PLOT2
plot( x$DateTime,x$Global_active_power,xlab="",ylab ="Global Active Power (kilowatts)",type="l")

dev.off()
