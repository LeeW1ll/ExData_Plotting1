library(sqldf)
dattab<-read.csv.sql(file = "household_power_consumption.txt", sep=';', header=TRUE, 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
dattab$Date_1<-as.Date(dattab$Date)
dattab$DateTime_1<-strptime(paste(dattab$Date,dattab$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 2
png(filename = "plot2.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)

par(mar=c(4,4,2,2))
plot(dattab$DateTime_1,dattab$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="", type="l")

dev.off()
