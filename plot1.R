plot1 <- function() {
  # This function needs sqldf. 
  # Assume that sqldf was installed.
  library(sqldf)
  
  # Assume data file in same directory as script.
  febdata <- read.csv.sql(file="household_power_consumption.txt", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";", header=TRUE)
  
  # Combine date and time columns to a single new column called DateTime
  febdata$DateTime <- strptime(paste(as.character(febdata$Date), as.character(febdata$Time)), "%d/%m/%Y %H:%M:%S")
  
  # Save plot to a png file of size 480x480
  png(filename="plot1.png", height=480, width=480)
  
  # Histogram (comment the line above and below to see the plot on screen)
  hist(febdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  
  # Close the device
  dev.off()
}
