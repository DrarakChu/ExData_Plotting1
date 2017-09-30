# Plot the continuous energy sub meterings from the dates 2007-02-01 and 2007-02-02.
#
# @param[raw] The raw data from the dataset. Loaded with:
#   "raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))"
#
# @outputs A "plot3.png" file into the work directory.

plot3 <- function(raw) {
  dateFormat <- "%d/%m/%Y"
  dates <- as.Date(raw$Date, format = dateFormat)
  
  begDate <- as.Date("01/02/2007", format = dateFormat)
  endDate <- as.Date("02/02/2007", format = dateFormat)
  
  segment <- raw[dates >= begDate & dates <= endDate,]
  
  time <- strptime(paste(segment[,1], segment[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  plot(time, segment$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(time, segment$Sub_metering_1)
  lines(time, segment$Sub_metering_2, col="red")
  lines(time, segment$Sub_metering_3, col="blue")
  legend("topright", legend = names(raw)[7:9], lty=c(1,1,1), col=c("black", "red", "blue"), cex=1, xpd=NA)
  title(main = "")
  dev.copy(png, file = "plot3.png")
  dev.off()
}