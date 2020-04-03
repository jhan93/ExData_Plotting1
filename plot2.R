setwd('/Users/jhan/Desktop/Coursera')

## Read the data in
consum <- read.delim2('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
## Convert the Date column to be of the date format
consum$Time2 <- paste(consum$Date, consum$Time)

consum$Time2 <- (strptime(consum$Time2, "%d/%m/%Y %H:%M:%S"))
consum$Date <- as.Date(consum$Date, tryFormats  = '%d/%m/%Y')


## Subsetting to look into just Feb 1 and 2 2007
sub_consum <- consum[consum$Date == '2007-02-01' | consum$Date == '2007-02-02',]

## Converting the numeric columns
sub_consum[,3:9] <- sapply(sub_consum[,3:9], as.numeric)

## Plot 2
png(file = 'plot2.png')
plot(x = sub_consum$Time2, y = sub_consum$Global_active_power, ylab = 'Global Active Power (kilowatts)', xlab = '' ,type = 'l')
dev.off()

plot(x = sub_consum$Time2, y = sub_consum$Global_active_power, ylab = 'Global Active Power (kilowatts)', xlab = '' ,type = 'l')