plot4 <- function(data, path = getwd()){
  
  filelocation <- file.path("~", path, data)
  AllData <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE)
  MyData <- subset(AllData, AllData$Date == "1/2/2007"|AllData$Date =="2/2/2007")
  MyData[MyData == "?"] <- NA
  MyData <- na.omit(MyData)
  MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
  MyData$DateTime <- strptime(paste(MyData$Date, MyData$Time), format="%d/%m/%Y %H:%M:%S")
  
  
  png(filename="plot4.png")
  par(mfcol = c(2,2))
  
  plot(MyData$DateTime, MyData$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)")
  lines(MyData$DateTime, MyData$Global_active_power)
  

  
  plot(MyData$DateTime, MyData$Sub_metering_1, type = "n", ylab = "Energy Sub Metering")
  points(MyData$DateTime, MyData$Sub_metering_3, type = "n")
  points(MyData$DateTime, MyData$Sub_metering_2, type = "n")
  lines(MyData$DateTime, MyData$Sub_metering_1, col = "red", ylab = "Energy Sub Metering")
  lines(MyData$DateTime, MyData$Sub_metering_3, col = "blue", ylab = "Energy Sub Metering")
  lines(MyData$DateTime, MyData$Sub_metering_2, col = "black", ylab = "Energy Sub Metering")
  legend(x = "topright", pch = "___", col = c("black", "red", "blue"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
  
  
  
  plot(MyData$DateTime, MyData$Voltage, type = "n", ylab = "Voltage", xlab = "Date/Time")
  lines(MyData$DateTime, MyData$Voltage)
  
  
  
  plot(MyData$DateTime, MyData$Global_reactive_power, type = "n", ylab = "Global Reactive Power")
  lines(MyData$DateTime, MyData$Global_reactive_power)
  
  dev.off() 
  
}

