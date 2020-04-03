setwd('/Users/jhan/Desktop/Coursera')



## Read the data in
consum <- read.delim2('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)
## Convert the Date column to be of the date format
consum$Date <- as.Date(consum$Date, tryFormats  = '%d/%m/%Y')
## Subsetting to look into just Feb 1 and 2 2007
sub_consum <- consum[consum$Date == '2007-02-01' | consum$Date == '2007-02-02',]

## Converting the numeric columns
sub_consum[,3:9] <- sapply(sub_consum[,3:9], as.numeric)
str(sub_consum)

## Plot 1
png(file = 'plot1.png')
hist(sub_consum$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()

hist(sub_consum$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')