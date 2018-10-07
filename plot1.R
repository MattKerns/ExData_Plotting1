plot1 <- function(data, path = getwd()){
  
  filelocation <- file.path("~", path, data)
  AllData <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE)
  MyData <- subset(AllData, AllData$Date == "1/2/2007"|AllData$Date =="2/2/2007")
  MyData$Global_active_power <- as.numeric(MyData$Global_active_power)
  
  png(filename = "plot1.png")
  hist(MyData$Global_active_power, col = "red", xlab = "Global Active Power (in Kilowatts)", main = "Global Active Power")
  dev.off()
  
  
} 