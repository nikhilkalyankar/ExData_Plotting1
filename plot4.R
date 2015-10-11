plot4 <- function(fileURL="household_power_consumption.txt",pngFile ="plot4.png")
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
  
  #Set the mfcol values
  par(mfcol=c(2,2))
   
  #Create Line plot and add label
  plot(dataS$dateTime,dataS$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  #Create Line plots for three variables Sub_metering_1, Sub_metering_2 & Sub_metering_3
  plot(dataS$dateTime,dataS$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
  lines(dataS$dateTime,dataS$Sub_metering_2,type="l",col="red")
  lines(dataS$dateTime,dataS$Sub_metering_3,type="l",col="blue")
  
  #Add legend
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n",cex=0.64)
  
  #Create line plot for Voltage versus Datetime and add labels
  plot(dataS$dateTime,dataS$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  #Create line plot for Global Reactive Power and add labels
  plot(dataS$dateTime,dataS$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  #Reset to original values
  par(mfcol=c(1,1))
  
  #Copy the plot to a png file
  dev.copy(png, file = pngFile)
  
  #Close the png device
  dev.off()
}