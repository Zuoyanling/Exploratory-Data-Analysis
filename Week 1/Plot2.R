## Getting full dataset
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y") ## Date
## Subsetting the data
powerdata <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
head(powerdata)
dim(powerdata)
## Converting dates
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)
head(powerdata)
## Plot 2
plot(powerdata$Global_active_power~powerdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="") #type="l", line

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
