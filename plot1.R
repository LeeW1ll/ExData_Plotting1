library(sqldf)
dattab<-read.csv.sql(file = "household_power_consumption.txt", sep=';', header=TRUE, 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
dattab$Date_1<-as.Date(dattab$Date)
dattab$DateTime_1<-strptime(paste(dattab$Date,dattab$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 1
png(filename = "plot1.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)

par(mar=c(4,4,2,2))
hist(dattab$Global_active_power, col="Red", main = "Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")

dev.off()