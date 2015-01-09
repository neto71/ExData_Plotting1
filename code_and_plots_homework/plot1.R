col_cat<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
# to read upto required date only need to read first 75000
filename <- "household_power_consumption.txt"
powerData <- read.table(filename,sep=";", header=TRUE,na.strings="?",colClasses=col_cat,nrows=75000)
#powerData$Date<-paste(powerData$Date,powerData$Time)
powerData$Date<-as.Date(powerData$Date,format="%d/%m/%Y")
powerData<-subset(powerData,powerData$Date >="2007-02-01" & powerData$Date <="2007-02-02")
hist(powerData$Global_active_power,col="red",xlab="Global Active Power (kiloWatts)",main="Global Active Power",xlim=c(0,6),breaks=12,xaxt='n')
axis(side=1,at=seq(0,6,2),labels=seq(0,6,2))
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()