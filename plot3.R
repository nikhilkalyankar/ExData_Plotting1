plot3 <- function(fileURL="household_power_consumption.txt",pngFile ="plot3.png")
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
  
  #Create Line plots for three variables Sub_metering_1, Sub_metering_2 & Sub_metering_3
  plot(dataS$dateTime,dataS$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
  lines(dataS$dateTime,dataS$Sub_metering_2,type="l",col="red")
  lines(dataS$dateTime,dataS$Sub_metering_3,type="l",col="blue")
  
  #Add legend
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.64)
  
  #Copy the plot to a png file
  dev.copy(png, file = pngFile)
  
  #Close the png device
  dev.off()
}