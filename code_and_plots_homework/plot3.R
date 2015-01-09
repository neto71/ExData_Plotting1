col_cat<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
# to read upto required date only need to read first 75000
filename <- "household_power_consumption.txt"
powerData <- read.table(filename,sep=";", header=TRUE,na.strings="?",colClasses=col_cat,nrows=75000)
#powerData$Date<-paste(powerData$Date,powerData$Time)
powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")
powerData<-subset(powerData,powerData$Date >="2007-02-01" & powerData$Date <="2007-02-02")
powerData$Date1<-paste(powerData$Date,powerData$Time)
powerData$Date1<-as.POSIXlt(powerData$Date1,format="%Y-%m-%d %H:%M:%S")

png(filename="plot3.png",width=480,height=480)
par(cex=1,cex.axis=.85)
with(powerData,{
  plot(Date1,Sub_metering_1,type="n",xlab="",ylab="",ylim=c(0,38))
  lines(Date1,Sub_metering_1,type="l",col="black")
  lines(Date1,Sub_metering_2,type="l",col="red")
  lines(Date1,Sub_metering_3,type="l",col="blue")
  title(ylab="Energy sub metering",cex.lab=1.1)
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "),y.intersp=0.85,x.intersp=1.5)
})
#dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()