plot3 <- function(data, path = getwd()){
  
  filelocation <- file.path("~", path, data)
  AllData <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE)
  MyData <- subset(AllData, AllData$Date == "1/2/2007"|AllData$Date =="2/2/2007")
  MyData[MyData == "?"] <- NA
  MyData <- na.omit(MyData)
  MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
  MyData$DateTime <- strptime(paste(MyData$Date, MyData$Time), format="%d/%m/%Y %H:%M:%S")
  
  png(filename="plot3.png")
  plot(MyData$DateTime, MyData$Sub_metering_2, type = "n", ylab = "Energy Sub Metering")
  plot(MyData$DateTime, MyData$Sub_metering_3, type = "n", ylab = "Energy Sub Metering")
  plot(MyData$DateTime, MyData$Sub_metering_1, type = "n", ylab = "Energy Sub Metering")

  lines(MyData$DateTime, MyData$Sub_metering_2, col = "red", ylab = "Energy Sub Metering")
  lines(MyData$DateTime, MyData$Sub_metering_3, col = "blue", ylab = "Energy Sub Metering")
  lines(MyData$DateTime, MyData$Sub_metering_1, col = "black", ylab = "Energy Sub Metering")

  legend(x = "topright", pch = "___", col = c("black", "red", "blue"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
  
  dev.off() 
}