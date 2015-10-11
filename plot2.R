plot2 <- function(fileURL="household_power_consumption.txt",pngFile ="plot2.png")
{
  #Read the file from the URL assuming the file is 'semicolon';' seperated
  #and has '?' as missing values
  data <- read.table(fileURL,sep=";",header=TRUE,na.strings="?")
  
  #Substring the data and only select values for the dates 1/2/2007 and 2/2/2007
  data <- data[(data$Date=="1/2/2007"| data$Date=="2/2/2007"),]
  
  #Convert date and time to respective classes and combine them into single variable
  dateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
  
  #Replace date & time columns with a single dateTime column
  data <- cbind(dateTime,data[,3:9])
  
  #Create Line plot and add label
  plot(dataS$dateTime,dataS$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  #Copy the plot to a png file
  dev.copy(png, file = pngFile)
  
  #Close the png device
  dev.off()
}