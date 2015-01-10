#setwd("C:\\Users\\Romano\\Desktop\\Coursera\\Certificate Data Analisys\\Exploratory Data\\Course Project")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
sel<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02", ]

sel$Date<-strptime(with(sel, paste(Date, Time)), "%Y-%m-%d %H:%M:%S")
sel$Time<-NULL
sel$Sub_metering_1<-as.numeric(levels(sel$Sub_metering_1))[sel$Sub_metering_1]
sel$Sub_metering_2<-as.numeric(levels(sel$Sub_metering_2))[sel$Sub_metering_2]
sel$Sub_metering_3<-as.numeric(levels(sel$Sub_metering_3))[sel$Sub_metering_3]

png(filename="plot3.png", width = 480, height = 480)

with(sel, plot(Date, Sub_metering_1, type="n", xlab="", ylab="Energy Sub metering"))
with(sel, points(Date, Sub_metering_1, type = "l", col="black"))
with(sel, points(Date, Sub_metering_2, type = "l", col="red"))
with(sel, points(Date, Sub_metering_3, type = "l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
