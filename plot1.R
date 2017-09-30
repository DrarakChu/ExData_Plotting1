# Plot the global active power from the dates 2007-02-01 and 2007-02-02.
#
# @param[raw] The raw data from the dataset. Loaded with:
#   "raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))"
#
# @outputs A "plot1.png" file into the work directory.

plot1 <- function(raw) {
  dateFormat <- "%d/%m/%Y"
  dates <- as.Date(raw$Date, format = dateFormat)
  
  begDate <- as.Date("01/02/2007", format = dateFormat)
  endDate <- as.Date("02/02/2007", format = dateFormat)
  
  segment <- raw[dates >= begDate & dates <= endDate,]
  
  hist(segment$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="")
  title(main = "Global Active Power")
  dev.copy(png, file = "plot1.png")
  dev.off()
}