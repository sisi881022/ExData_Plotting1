# Read in Data
PowerConsumption<- read.csv("household_power_consumption.txt",header=T,sep=";", na.strings = "?")
colnames(powerConsumption)
#Convert date
powerConsumption$Date<- as.Date(powerConsumption$Date,"%d/%m/%Y")
#subset data 
project1<- subset(powerConsumption,Date>="2007-02-01" & Date<= "2007-02-02")


datetime<-strptime(paste(project1$Date, project1$Time), "%Y-%m-%d %H:%M:%S")




#plot4
png("plot4.png")
par(mfrow=c(2,2))
plot(datetime,project1[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
Voltage<- project1$Voltage
plot(datetime,Voltage,type="l" )
plot(datetime, project1[,7],  type="l", col="black", ylab="Energy sub metering", xlab="")
lines(datetime,project1[,8], type="l", col="red")
lines(datetime,project1[,9], type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub-metering_2", "Sub_meteing_3"), lwd=2,col=c("black", "red", "blue"))
plot(datetime,project1[,4],type="l",ylab="Global reactive_power")
dev.off()
