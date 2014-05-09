power_consumption <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_consumption$compound_date <- paste(power_consumption$Date, power_consumption$Time)
power_consumption$compound_date <- strptime(power_consumption$compound_date, format="%d/%m/%Y %H:%M:%S")
sub_power <- subset(power_consumption, as.Date(power_consumption$Date, format="%d/%m/%Y") >= as.Date('2007-02-01') & as.Date(power_consumption$compound_date, format="%d/%m/%Y") <= as.Date('2007-02-02'))

png(filename="figure/plot2.png", width=480, height=480)

plot(sub_power$compound_date, sub_power$Global_active_power, ylab="Global Active Power (kilowatts)", main="", xlab="", type="l")

dev.off()