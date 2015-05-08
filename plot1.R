data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
library(lubridate)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
subdata$Global_active_power<-as.numeric(levels(subdata$Global_active_power))[subdata$Global_active_power]


# Plots Constants
PlotWidth         <- 480
PlotHeight        <- 480
PlotUnits         <- "px"
PlotBg            <- "white"
PlotFileName      <- "plot1.png"

png(filename = PlotFileName , width = PlotWidth, height = PlotHeight, units = PlotUnits, bg = PlotBg)

hist(subdata$Global_active_power, col = "red", , xlab="Global Active Power (kilowatts)")

dev.off()