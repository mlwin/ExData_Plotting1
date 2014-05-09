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

# single plot
par(mfrow=c(1,1))

# Plot histagrm of Global Active Power
hist(data$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)", main = "Global Active Power")

# save plot file
dev.copy(png,'plot1.png', width=480, height=480)
dev.off()
