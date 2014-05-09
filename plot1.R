power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")
sub_power <- subset(power_consumption, power_consumption$Date >= as.Date('2007-02-01') & power_consumption$Date <= as.Date('2007-02-02'))

png(filename="figure/plot1.png", width=480, height=480)

hist(sub_power$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

dev.off()