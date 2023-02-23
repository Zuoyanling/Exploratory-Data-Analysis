## Getting full dataset
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y") ## Date
## Subsetting the data
powerdata <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
head(powerdata)
dim(powerdata)
## Converting dates
class(powerdata$Sub_metering_1)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
class(powerdata$Sub_metering_2)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
class(powerdata$Sub_metering_3)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)
## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="Datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="Datetime")
})
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
