
# import data

power <- read.table("household_power_consumption.txt",skip=1,sep=";")

# set the name of variable in the table

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# select the data from date 1/2/2007 and 2/2/2007

subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# open png device

png("Plot1.png", width = 480, height = 480,unit="px")

# plot histogram
hist(as.numeric(as.character(subpower$Global_active_power)), col = "red", 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)", 
                ylab="Frequency")


dev.off()
