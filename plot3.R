## This R file will read in the household power consumption data
## in the same directory and plot and save the 4 required plots. 


# Read in the data and limit to just the two days in question
data<-read.table("household_power_consumption.txt",na.strings="?",header=T,sep=";")
data<-data[as.character(data$Date)=="2/2/2007" | as.character(data$Date)=="1/2/2007",]
data<-cbind(data,date.time=strptime(paste(as.character(data[,1]),as.character(data[,2])),"%d/%m/%Y %T",tz=""))
row.names(data)<-NULL

# Add the plot
png(file="plot3.png",width = 480, height = 480, units = "px", bg = "transparent")
plot(data$date.time,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$date.time,data$Sub_metering_2,type="l",col="Red")
lines(data$date.time,data$Sub_metering_3,type="l",col="Blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()