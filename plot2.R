# Plot the continuous global active power from the dates 2007-02-01 and 2007-02-02.
#
# @param[raw] The raw data from the dataset. Loaded with:
#   "raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))"
#
# @outputs A "plot2.png" file into the work directory.

plot2 <- function(raw) {
  dateFormat <- "%d/%m/%Y"
  dates <- as.Date(raw$Date, format = dateFormat)
  
  begDate <- as.Date("01/02/2007", format = dateFormat)
  endDate <- as.Date("02/02/2007", format = dateFormat)
  
  segment <- raw[dates >= begDate & dates <= endDate,]
  
  time <- strptime(paste(segment[,1], segment[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  plot(time, segment$Global_active_power, type="n", xlab="", ylab="Global Active Power (killowatts)")
  lines(time, segment$Global_active_power)
  title(main = "")
  dev.copy(png, file = "plot2.png")
  dev.off()
}