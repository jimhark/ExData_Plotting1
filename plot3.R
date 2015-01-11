power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
selPower <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

dateStrings <- apply(selPower[,c("Date","Time")], 1, FUN=function(s) paste(s, collapse=" "))
selPower$datetime <- strptime(dateStrings, "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(selPower$datetime, selPower$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(selPower$datetime, selPower$Sub_metering_2, type="l", col="red")
lines(selPower$datetime, selPower$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

