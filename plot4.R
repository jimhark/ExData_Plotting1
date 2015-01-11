power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
selPower <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

dateStrings <- apply(selPower[,c("Date","Time")], 1, FUN=function(s) paste(s, collapse=" "))
selPower$datetime <- strptime(dateStrings, "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(selPower, {
    plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(datetime, Voltage, type="l")

    plot(datetime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, type="l", col="red")
    lines(datetime, Sub_metering_3, type="l", col="blue")
    legend("topright", lwd=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

    plot(datetime, Global_reactive_power, type="l")
})
dev.off()

