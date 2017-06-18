##Loading data into memory

dataFile <- "./rawdata/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subsetting data for only two days
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot 1
#getting values from variable Global_active_power and converting chars to numeric value
Global_active_power <- as.numeric(subSetData$Global_active_power)

#creating png file
png("plot1.png", width=480, height=480)
#adding histogram
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#finishing using file
dev.off()

#plot 2
#getting dates and formating the values
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#getting values from variable Global_active_power and converting chars to numeric value
Global_active_power <- as.numeric(subSetData$Global_active_power)
#creating png file
png("plot2.png", width=480, height=480)
#adding plot
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#finishing using file
dev.off()