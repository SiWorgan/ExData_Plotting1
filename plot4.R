power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_consumption$compound_date <- paste(power_consumption$Date, power_consumption$Time)
power_consumption$compound_date <- strptime(power_consumption$compound_date, format="%d/%m/%Y %H:%M:%S")
sub_power <- subset(power_consumption, as.Date(power_consumption$Date, format="%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(power_consumption$compound_date, format="%d/%m/%Y") <= as.Date('2007-02-02'))

png(filename="figure/plot4.png", width=480, height=480)

par(mfrow=c(2,2))
plot(sub_power$compound_date, sub_power$Global_active_power, ylab="Global Active Power", main="", xlab="", type="l")
plot(sub_power$compound_date, sub_power$Voltage, ylab="Voltage", main="", xlab="datetime", type="l")

plot(sub_power$compound_date, sub_power$Sub_metering_1, ylab="Energy sub metering", main="", xlab="", type="l")
lines(sub_power$compound_date, sub_power$Sub_metering_2, col="red")
lines(sub_power$compound_date, sub_power$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

plot(sub_power$compound_date, sub_power$Global_reactive_power, ylab="Global_reactive_power", main="", xlab="datetime", type="l")

dev.off()