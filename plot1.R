# Read in Data
powerConsumption<- read.csv("household_power_consumption.txt",header=T,sep=";", na.strings = "?")
colnames(powerConsumption)
#Convert dates
powerConsumption$Date<- as.Date(powerConsumption$Date,"%d/%m/%Y")
#subset data 
dat<- subset(powerConsumption,Date>="2007-02-01" & Date<= "2007-02-02")

#plot1
png("plot1.png")
hist(dat[,3],xlab="Global Active Power (kilowatts)",main=" Global Active Power",col="red")
dev.off()
