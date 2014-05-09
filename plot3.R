power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_consumption$compound_date <- paste(power_consumption$Date, power_consumption$Time)
power_consumption$compound_date <- strptime(power_consumption$compound_date, format="%d/%m/%Y %H:%M:%S")
sub_power <- subset(power_consumption, as.Date(power_consumption$Date, format="%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(power_consumption$compound_date, format="%d/%m/%Y") <= as.Date('2007-02-02'))

png(filename="figure/plot3.png", width=480, height=480)

plot(sub_power$compound_date, sub_power$Sub_metering_1, ylab="Energy sub metering", main="", xlab="", type="l")
lines(sub_power$compound_date, sub_power$Sub_metering_2, col="red")
lines(sub_power$compound_date, sub_power$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

dev.off()