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
