library(data.table)

# read all itmes
data = read.table("household_power_consumption.txt", sep=";", colClasses = c('character', 'character', rep('numeric', 7)), 
                  na.strings = "?", header=TRUE)

# convert to Date
data$Date = as.Date(data$Date, format="%d/%m/%Y")

# subset of data for desired dates
d1   = data[data$Date=="2007-02-01",]
d2   = data[data$Date=="2007-02-02",]
data = merge(d1, d2, all = TRUE)
dateTime = strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# single plot
par(mfrow=c(1,1))

par(cex=.56)
plot(dateTime, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")

lines(dateTime, data$Sub_metering_2, col="red")
lines(dateTime, data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),
       col=c("black","red", "blue"), text.font=2)

# save plot file
dev.copy(png,'plot3.png', width=480, height=480)
dev.off()
