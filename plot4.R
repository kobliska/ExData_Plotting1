setwd("C:/R")
dfrm=read.table("household_power_consumption.txt",stringsAsFactor=FALSE,sep=";",header=TRUE)
dfrm$Date=as.Date(dfrm$Date,"%d/%m/%Y")
dfrml=dfrm[ dfrm$Date > "2007-01-31",]
dffinal=dfrml[ dfrml$Date < "2007-02-03",]
dffinal$Global_active_power=as.numeric(dffinal$Global_active_power)
voltage=as.numeric(dffinal$Voltage)
grp=as.numeric(dffinal$Global_reactive_power)

sm1=as.numeric(dffinal$Sub_metering_1)
sm2=as.numeric(dffinal$Sub_metering_2)
sm3=as.numeric(dffinal$Sub_metering_3)

xxx=paste(dffinal$Date,dffinal$Time)
yyy=strptime(xxx,"%Y-%m-%d %H:%M:%S")
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,6,2,0),oma=c(4,0,2,1))
plot(yyy,dffinal$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(yyy,voltage,type="l",xlab="datetime",ylab="Voltage",col=1)
plot(yyy,sm1,type="l",xlab="",ylab="Energy sub metering",col=1)
lines(yyy,sm2,col=2)
lines(yyy,sm3,col=4)
legend("topright",lty=1,col=c("black","red","blue"),bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(yyy,grp,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

