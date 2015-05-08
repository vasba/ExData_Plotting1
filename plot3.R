data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
library(lubridate)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata<-data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
subdata$Sub_metering_1 <-as.numeric(levels(subdata$Sub_metering_1))[subdata$Sub_metering_1]
subdata$Sub_metering_2 <-as.numeric(levels(subdata$Sub_metering_2))[subdata$Sub_metering_2]
ylabel <- "Energy sub metering"

# Plots Constants
PlotWidth         <- 480
PlotHeight        <- 480
PlotUnits         <- "px"
PlotBg            <- "white"
PlotFileName      <- "plot3.png"

png(filename = PlotFileName , width = PlotWidth, height = PlotHeight, units = PlotUnits, bg = PlotBg)

plot(subdata$DateTime,subdata$Sub_metering_1, col="black",
     type="l",xlab="",ylab=ylabel)
lines(subdata$DateTime, subdata$Sub_metering_2, col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, col="blue")

legend("topright",col=c("black", "red", "blue"), c("Sub_metering_1", 
                                                   "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()