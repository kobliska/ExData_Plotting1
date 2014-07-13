setwd("C:/R")
dfrm=read.table("household_power_consumption.txt",stringsAsFactor=FALSE,sep=";",header=TRUE)
dfrm$Date=as.Date(dfrm$Date,"%d/%m/%Y")
dfrml=dfrm[ dfrm$Date > "2007-01-31",]
dffinal=dfrml[ dfrml$Date < "2007-02-03",]
dffinal$Global_active_power=as.numeric(dffinal$Global_active_power)
xxx=paste(dffinal$Date,dffinal$Time)
yyy=strptime(xxx,"%Y-%m-%d %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(yyy,dffinal$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()