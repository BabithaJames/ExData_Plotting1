##Download the file into the working directory
##run the File using source()
#ie,source("plot3.R")

# read power Consumption data
pwrdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors =FALSE)

# change the date format
pwrdata$Date <- as.Date(pwrdata$Date, format = "%d/%m/%Y")


#subset the powerdata for the 2 days

subsetdata <- subset(pwrdata,Date == "2007-02-01" | Date =="2007-02-02")

#combine date and time

DateTime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")


#change the class

subsetdata$Sub_metering_1 <- as.numeric(as.character(subsetdata$Sub_metering_1))

subsetdata$Sub_metering_2 <- as.numeric(as.character(subsetdata$Sub_metering_2))

subsetdata$Sub_metering_3 <- as.numeric(as.character(subsetdata$Sub_metering_3))


#plot the data

plot(DateTime,subsetdata$Sub_metering_1 ,type="l",xlab="", ylab="Energy sub metering",col="black")

lines(DateTime,subsetdata$Sub_metering_2,col="red")
lines(DateTime,subsetdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1)

dev.copy(png,file="plot3.png", width=480, height=480)

dev.off()
