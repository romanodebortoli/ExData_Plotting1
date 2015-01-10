#setwd("C:\\Users\\Romano\\Desktop\\Coursera\\Certificate Data Analisys\\Exploratory Data\\Course Project")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
sel<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02", ]

sel$Date<-strptime(with(sel, paste(Date, Time)), "%Y-%m-%d %H:%M:%S")
sel$Time<-NULL
sel$Global_active_power<-as.numeric(levels(sel$Global_active_power))[sel$Global_active_power]

png(filename="plot2.png", width = 480, height = 480)

with(sel, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)"))

dev.off()
