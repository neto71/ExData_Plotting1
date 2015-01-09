col_cat<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
# to read upto required date only need to read first 75000
filename <- "household_power_consumption.txt"
powerData <- read.table(filename,sep=";", header=TRUE,na.strings="?",colClasses=col_cat,nrows=75000)
#powerData$Date<-paste(powerData$Date,powerData$Time)
powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")
powerData<-subset(powerData,powerData$Date >="2007-02-01" & powerData$Date <="2007-02-02")
powerData$Date1<-paste(powerData$Date,powerData$Time)
powerData$Date1<-as.POSIXlt(powerData$Date1,format="%Y-%m-%d %H:%M:%S")

par(cex.lab=.75,cex.axis=.75)
with(powerData,{
    plot(Date1,Global_active_power,type="n",xlab="",ylab="")
    lines(Date1,Global_active_power,type="l")
    title(ylab="Global Active Power (kilowatts)")
    })
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()