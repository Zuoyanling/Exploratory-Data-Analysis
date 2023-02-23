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
## Plot 3
with(powerdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
