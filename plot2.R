## This R file will read in the household power consumption data
## in the same directory and plot and save the 4 required plots. 


# Read in the data and limit to just the two days in question
data<-read.table("household_power_consumption.txt",na.strings="?",header=T,sep=";")
data<-data[as.character(data$Date)=="2/2/2007" | as.character(data$Date)=="1/2/2007",]
data<-cbind(data,date.time=strptime(paste(as.character(data[,1]),as.character(data[,2])),"%d/%m/%Y %T",tz=""))
row.names(data)<-NULL

# Add the plot
png(file="plot2.png",width = 480, height = 480, units = "px", bg = "transparent")
plot(data$date.time,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",yaxp=c(0,6,3))

dev.off()