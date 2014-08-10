# Read in Data
powerConsumption<- read.csv("household_power_consumption.txt",header=T,sep=";", na.strings = "?")
colnames(powerConsumption)
#Convert date
powerConsumption$Date<- as.Date(powerConsumption$Date,"%d/%m/%Y")
#subset data 
dat<- subset(powerConsumption,Date>="2007-02-01" & Date<= "2007-02-02")
#convert the datetime
datetime<-strptime(paste(dat$Date, dat$Time), "%Y-%m-%d %H:%M:%S")

#plot3
png("plot3.png")
plot(datetime, dat[,7],  type="l", col="black", ylab="Energy sub metering", xlab="")
lines(datetime,dat[,8], type="l", col="red")
lines(datetime,dat[,9], type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub-metering_2", "Sub_meteing_3"), lwd=2,col=c("black", "red", "blue")) # add legend to plot
dev.off()
