##Data Specialization 04 - Exploratory Data: Project 1 - plot1
rm(list=ls())
wd <- "C:/Users/KK/Documents/Outside Learning/Specialization-Data Science/04_Exploratory Data Analysis/Project/Project01/exdata-data-household_power_consumption"
setwd(wd)

data <- read.table("household_power_consumption.txt",nrow=2075259,sep=";",stringsAsFactors = FALSE)
colnames(data) <- data[1,]
data2 <- data[2:nrow(data),]
DateTime <- paste(data2[,1],data2[,2])
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
data2    <- cbind(DateTime,data2[,-(1:2)])
for(c in 2:ncol(data2)){
    data2[,c] <- gsub("?","",data2[,c],fixed=TRUE)
    data2[,c] <- as.numeric(data2[,c])
}
data2 <- data2[order(data2$DateTime),]
from <- c("2007-02-01 00:00:00")
date.from <- strptime(from, format = "%Y-%m-%d %H:%M:%S")
to   <- c("2007-02-02 23:59:59")
date.to   <- strptime(to, format = "%Y-%m-%d %H:%M:%S")
f <- which(data2[,1] < date.from)
t <- which(data2[,1] > date.to)
data3 <- data2[(f[length(f)]+1):(t[1]-1),]
###plot3
#png("plot3.png")
plot(data3[,1],data3[,2],type="line",xlab="",ylab="Global Active Power (kilowatts)")
#dev.off()
