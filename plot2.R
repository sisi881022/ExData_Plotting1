# Read in Data
PowerConsumption<- read.csv("household_power_consumption.txt",header=T,sep=";", na.strings = "?")
colnames(powerConsumption)
#Convert date
powerConsumption$Date<- as.Date(powerConsumption$Date,"%d/%m/%Y")
#subset data 
dat<- subset(powerConsumption,Date>="2007-02-01" & Date<= "2007-02-02")
#convert the datetime
datetime<-strptime(paste(dat$Date, dat$Time), "%Y-%m-%d %H:%M:%S")

#plot2
png("plot2.png")
plot(datetime,dat[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
