#Read Electric power consumption data
x<- read.table("household_power_consumption.txt",sep=";",header = TRUE,
               colClasses = c("character","character","numeric","numeric",
                              "numeric","numeric","numeric","numeric",
                              "numeric"),na="?")

#Subset data on Feb1,2007 and Feb2,2007; then add Datetime column
subsetx<-subset(x,x$Date=="1/2/2007"|x$Date=="2/2/2007")   
subsetx$DateTime <- strptime(paste(subsetx$Date,subsetx$Time),
                             "%d/%m/%Y %H:%M:%S")

#create plot2
png(file="plot2.png",width=480, height=480, units="px")
plot(subsetx$DateTime,subsetx$Global_active_power, type="l",xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()

