setwd("C:/R")
dfrm=read.table("household_power_consumption.txt",stringsAsFactor=FALSE,sep=";",header=TRUE)
dfrm$Date=as.Date(dfrm$Date,"%d/%m/%Y")
dfrml=dfrm[ dfrm$Date > "2007-01-31",]
dffinal=dfrml[ dfrml$Date < "2007-02-03",]
dffinal$Global_active_power=as.numeric(dffinal$Global_active_power)
png("plot1.png",width=480,height=480)
hist((dffinal$Global_active_power),breaks=20,col=2,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()