## read full dataset
data_pc <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_pc$Date <- as.Date(data_pc$Date, format="%d/%m/%Y")

## subset the data
data <- subset(data_pc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_pc)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
