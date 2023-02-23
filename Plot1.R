## Getting full dataset
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y") ## Date
## Subsetting the data
powerdata <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
head(powerdata)
dim(powerdata)
## Converting dates
class(powerdata$Global_active_power)
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
## Plot 1
hist(powerdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
