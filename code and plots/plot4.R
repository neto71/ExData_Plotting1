col_cat<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
# to read upto required date only need to read first 75000
filename <- "household_power_consumption.txt"
powerData <- read.table(filename,sep=";", header=TRUE,na.strings="?",colClasses=col_cat,nrows=75000)
#powerData$Date<-paste(powerData$Date,powerData$Time)
powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")
powerData<-subset(powerData,powerData$Date >="2007-02-01" & powerData$Date <="2007-02-02")
powerData$Date1<-paste(powerData$Date,powerData$Time)
powerData$Date1<-as.POSIXlt(powerData$Date1,format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png",width=480,height=480)
par(mfrow= c(2,2),cex.axis=1)
#graph1
#par(cex.axis=.75)
with(powerData,{
  plot(Date1,Global_active_power,type="n",xlab="",ylab="")
  lines(Date1,Global_active_power,type="l")
  title(ylab="Global Active Power",cex.lab=.95)
})

#graph 2
with(powerData,{
  plot(Date1,Voltage,type="n",xlab="",ylab="")
  lines(Date1,Voltage,type="l")
  title(ylab="Voltage",xlab="datetime",cex.lab=.95)
})

#graph 3
with(powerData,{
  plot(Date1,Sub_metering_1,type="n",xlab="",ylab="",ylim=c(0,38))
  lines(Date1,Sub_metering_1,type="l",col="black")
  lines(Date1,Sub_metering_2,type="l",col="red")
  lines(Date1,Sub_metering_3,type="l",col="blue")
  title(ylab="Energy sub metering",cex.lab=.95)
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.99,y.intersp=0.85,bg = "transparent", box.col = "transparent",inset=.02)
})
#graph4
with(powerData,{
  plot(Date1,Global_reactive_power,type="n",xlab="",ylab="")
  lines(Date1,Global_reactive_power,type="l")
  title(ylab="Global_reactive_power",cex.lab=.95,xlab="datetime",cex=.65)
})



#dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()