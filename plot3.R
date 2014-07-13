library(sqldf)
dattab<-read.csv.sql(file = "household_power_consumption.txt", sep=';', header=TRUE, 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
dattab$Date_1<-as.Date(dattab$Date)
dattab$DateTime_1<-strptime(paste(dattab$Date,dattab$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 3
png(filename = "plot3.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)

par(mar=c(4,4,2,2))
plot(dattab$DateTime_1,dattab$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
points(dattab$DateTime_1,dattab$Sub_metering_1, col = "Black", type="l" , lwd=0.25)
points(dattab$DateTime_1,dattab$Sub_metering_2, col = "Red" , type="l" , lwd=0.25)
points(dattab$DateTime_1,dattab$Sub_metering_3, col = "Blue" , type="l" , lwd=0.25)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("Black","Red","Blue"))

dev.off()

