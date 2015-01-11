power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
selPower <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

dateStrings <- apply(selPower[,c("Date","Time")], 1, FUN=function(s) paste(s, collapse=" "))
selPower$datetime <- strptime(dateStrings, "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(selPower$datetime, selPower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

