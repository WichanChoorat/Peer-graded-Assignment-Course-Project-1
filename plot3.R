
# import data

power <- read.table("household_power_consumption.txt",skip=1,sep=";")

# set the name of variable in the table

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# select the data from date 1/2/2007 and 2/2/2007

subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transform date/time format

subpower$Date <- as.Date(subpower$Date, format = "%d/%m/%Y") 
DateTime <- paste(as.Date(subpower$Date), subpower$Time) 
subpower$DateTime <- as.POSIXct(DateTime)

# open png device

png("Plot3.png", width = 480, height = 480,unit="px")

# plot
with(subpower, {
  plot(Sub_metering_1 ~ DateTime, col="black", type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ DateTime, col = 'red')
  lines(Sub_metering_3 ~ DateTime, col = 'blue')
})

# Legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
