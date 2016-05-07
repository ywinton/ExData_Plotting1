#Read Electric power consumption data
x<- read.table("household_power_consumption.txt",sep=";",header = TRUE,
               colClasses = c("character","character","numeric","numeric",
                              "numeric","numeric","numeric","numeric",
                              "numeric"),na="?")
#Subset data on Feb1,2007 and Feb2,2007; then add Datetime column
subsetx<-subset(x,x$Date=="1/2/2007"|x$Date=="2/2/2007")   
subsetx$DateTime <- strptime(paste(subsetx$Date,subsetx$Time),
                             "%d/%m/%Y %H:%M:%S")

#create plot3
png(file="plot3.png",width=480, height=480, units="px")
with(subsetx, plot(DateTime,Sub_metering_1,type="l",col="black", ylab=
                       "Energy sub metering", xlab=""))
lines(subsetx$DateTime,subsetx$Sub_metering_2, type="l", col="red")
lines(subsetx$DateTime,subsetx$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1)

dev.off()
