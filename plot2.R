data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
library(lubridate)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata<-data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
subdata$Global_active_power<-as.numeric(levels(subdata$Global_active_power))[subdata$Global_active_power]
ylabel <- "Global Active Power (kilowatts)"

# Plots Constants
PlotWidth         <- 480
PlotHeight        <- 480
PlotUnits         <- "px"
PlotBg            <- "white"
PlotFileName      <- "plot2.png"

png(filename = PlotFileName , width = PlotWidth, height = PlotHeight, units = PlotUnits, bg = PlotBg)

plot(subdata$DateTime,subdata$Global_active_power, type="l",xlab="",ylab=ylabel)
dev.off()