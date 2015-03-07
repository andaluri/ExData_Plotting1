plot3 <- function() {
  # This function needs sqldf. 
  # Assume that sqldf was installed.
  library(sqldf)
  
  # Assume data file in same directory as script.
  febdata <- read.csv.sql(file="household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";", header=TRUE)
  
  # Combine date and time columns to a single new column called DateTime
  febdata$DateTime <- strptime(paste(as.character(febdata$Date), as.character(febdata$Time)), "%d/%m/%Y %H:%M:%S")

  # Save plot to a png file of size 480x480
  png(filename="plot3.png", height=480, width=480)
  
  # Plot with multiple variables represented in a line graph with different colors.
  plot(febdata$DateTime, febdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(febdata$DateTime, febdata$Sub_metering_2, type="l", col="red")
  lines(febdata$DateTime, febdata$Sub_metering_3, type="l", col="blue")
  
  # Add legend 
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
  
  # Close the device
  dev.off()  
}