plot2 <- function(data, path = getwd()){
  
  filelocation <- file.path("~", path, data)
  AllData <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE)
  MyData <- subset(AllData, AllData$Date == "1/2/2007"|AllData$Date =="2/2/2007")
  MyData[MyData == "?"] <- NA
  MyData <- na.omit(MyData)
  MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
  MyData$DateTime <- strptime(paste(MyData$Date, MyData$Time), format="%d/%m/%Y %H:%M:%S")

  png(filename="plot2.png")
  plot(MyData$DateTime, MyData$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)")
  lines(MyData$DateTime, MyData$Global_active_power)
  dev.off()
  
  }