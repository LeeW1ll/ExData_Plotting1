library(sqldf)
dattab<-read.csv.sql(file = "household_power_consumption.txt", sep=';', header=TRUE, 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
dattab$Date_1<-as.Date(dattab$Date)
dattab$DateTime_1<-strptime(paste(dattab$Date,dattab$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 4
png(filename = "plot4.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)

par(mfcol=c(2,2))

par(mar=c(4,4,1,2))

plot(dattab$DateTime_1,dattab$Global_active_power, ylab="Global Active Power",xlab="", type="l")

plot(dattab$DateTime_1,dattab$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
points(dattab$DateTime_1,dattab$Sub_metering_1, col = "Black", type="l" )
points(dattab$DateTime_1,dattab$Sub_metering_2, col = "Red" , type="l")
points(dattab$DateTime_1,dattab$Sub_metering_3, col = "Blue" , type="l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("Black","Red","Blue"), bty="n" )

plot(dattab$DateTime_1,dattab$Voltage, ylab="Voltage",xlab="datetime", type="l")

plot(dattab$DateTime_1,dattab$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l", lwd=0.5)

dev.off()