setwd('/Users/jhan/Desktop/Coursera')

## Read the data in
consum <- read.delim2('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
## Convert the Date column to be of the date format
consum$Time2 <- paste(consum$Date, consum$Time)

consum$Time2 <- (strptime(consum$Time2, "%d/%m/%Y %H:%M:%S"))
consum$Date <- as.Date(consum$Date, tryFormats  = '%d/%m/%Y')


## Subsetting to look into just Feb 1 and 2 2007
sub_consum <- consum[consum$Date == '2007-02-01' | consum$Date == '2007-02-02',]

png(file = 'plot3.png')
plot(sub_consum$Time2, sub_consum$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(sub_consum$Time2, sub_consum$Sub_metering_2, type = 'l', col = 'red')
lines(sub_consum$Time2, sub_consum$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), ncol = 1, lty = c(1,1,1))
dev.off()


plot(sub_consum$Time2, sub_consum$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(sub_consum$Time2, sub_consum$Sub_metering_2, type = 'l', col = 'red')
lines(sub_consum$Time2, sub_consum$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), ncol = 1, lty = c(1,1,1))
