##Loading data into memory

dataFile <- "./rawdata/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subsetting data for only two days
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot 3
#getting dates and formating the values
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#getting values from variable Global_active_power and converting chars to numeric value
Global_active_power <- as.numeric(subSetData$Global_active_power)
#getting values from variables Sub_metering and converting chars to numeric value
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
#creating png file
png("plot3.png", width=480, height=480)
#creating plot
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
#putting legend on topright
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))
dev.off()