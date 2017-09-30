# Plot lots of things from the dates 2007-02-01 and 2007-02-02.
#
# @param[raw] The raw data from the dataset. Loaded with:
#   "raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))"
#
# @outputs A "plot4.png" file into the work directory.

plot4 <- function(raw) {
  dateFormat <- "%d/%m/%Y"
  dates <- as.Date(raw$Date, format = dateFormat)
  
  begDate <- as.Date("01/02/2007", format = dateFormat)
  endDate <- as.Date("02/02/2007", format = dateFormat)
  
  segment <- raw[dates >= begDate & dates <= endDate,]
  
  time <- strptime(paste(segment[,1], segment[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  png(file = "plot4.png")
  par(mfrow = c(2,2))
  
  plot(time, segment$Global_active_power, type="n", xlab="", ylab="Global Active Power")
  lines(time, segment$Global_active_power)
  
  plot(time, segment$Voltage, type="n", xlab="datetime", ylab="Voltage")
  lines(time, segment$Voltage)
  
  plot(time, segment$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(time, segment$Sub_metering_1)
  lines(time, segment$Sub_metering_2, col = "red")
  lines(time, segment$Sub_metering_3, col = "blue")
  legend("topright", legend = names(raw)[7:9], lty=c(1,1,1), col=c("black", "red", "blue"), cex=1, xpd=NA)
  
  plot(time, segment$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
  lines(time, segment$Global_reactive_power)
  
  title(main = "")
  dev.off()
}