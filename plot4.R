data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
library(lubridate)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata<-data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
subdata$Global_active_power<-as.numeric(levels(subdata$Global_active_power))[subdata$Global_active_power]
subdata$Sub_metering_1 <-as.numeric(levels(subdata$Sub_metering_1))[subdata$Sub_metering_1]
subdata$Sub_metering_2 <-as.numeric(levels(subdata$Sub_metering_2))[subdata$Sub_metering_2]
subdata$Global_reactive_power<-as.numeric(levels(subdata$Global_reactive_power))[subdata$Global_reactive_power]

# Plots Constants
PlotWidth         <- 480
PlotHeight        <- 480
PlotUnits         <- "px"
PlotBg            <- "white"
PlotFileName      <- "plot4.png"

png(filename = PlotFileName , width = PlotWidth, height = PlotHeight, units = PlotUnits, bg = PlotBg)
par(mfrow=c(2,2))

# Plot 1
plot(subdata$DateTime, subdata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Plot 2
plot(subdata$DateTime, subdata$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Plot 3
plot(subdata$DateTime, subdata$Sub_metering_1, col = "black",
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(subdata$DateTime, subdata$Sub_metering_2, col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), c("Sub_metering_1", 
                                                   "Sub_metering_2", "Sub_metering_3"), lty=1)

# Plot 4
plot(subdata$DateTime, subdata$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(subdata$DateTime, subdata$Global_reactive_power)

dev.off()