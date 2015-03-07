plot4 <- function() {
  # This function needs sqldf. 
  # Assume that sqldf was installed.
  library(sqldf)
  
  # Assume data file in same directory as script.
  febdata <- read.csv.sql(file="household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";", header=TRUE)
  
  # Combine date and time columns to a single new column called DateTime
  febdata$DateTime <- strptime(paste(as.character(febdata$Date), as.character(febdata$Time)), "%d/%m/%Y %H:%M:%S")
  
  # Save plot to a png file of size 480x480
  png(filename="plot4.png", height=480, width=480)  
  
  # We need to show 4 plots in a 2 x 2 arrangement. Add the plots row wise.
  # if we were to use mfcol, then we need change the order of plot instructions below.
  par(mfrow=c(2,2))
  
  # Add plots row wise.
  # First plot (same as plot2.png)
  plot(febdata$DateTime, febdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
  
  # Second plot
  plot(febdata$DateTime, febdata$Voltage, type="l", xlab="datetime", ylab="Voltage")  
  
  # Third plot (same plot3.png but without borders in the legend)
  plot(febdata$DateTime, febdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(febdata$DateTime, febdata$Sub_metering_2, type="l", col="red")
  lines(febdata$DateTime, febdata$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), bty="n")
  
  # Fourth plot 
  plot(febdata$DateTime, febdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 
  
  # Close device
  dev.off()
}