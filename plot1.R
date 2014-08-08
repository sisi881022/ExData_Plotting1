# Read in Data
PowerConsumption<- read.csv("household_power_consumption.txt",header=T,sep=";", na.strings = "?")
colnames(powerConsumption)
#Convert date
powerConsumption$Date<- as.Date(powerConsumption$Date,"%d/%m/%Y")
#subset data 
project1<- subset(powerConsumption,Date>="2007-02-01" & Date<= "2007-02-02")


datetime<-strptime(paste(project1$Date, project1$Time), "%Y-%m-%d %H:%M:%S")

#plot1

hist(project1[,3],xlab="Global Active Power (kilowatts)",main=" Global Active Power",col="red")
