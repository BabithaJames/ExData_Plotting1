##Download the file into the working directory
##run the File using source()
#ie,source("plot2.R")



# read power Consumption data
pwrdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors =FALSE)

# change the date format
pwrdata$Date <- as.Date(pwrdata$Date, format = "%d/%m/%Y")


#subset the powerdata for the 2 days

subsetdata <- subset(pwrdata,Date == "2007-02-01" | Date =="2007-02-02")

#combine date and time

DateTime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")



Global_active_power <- as.numeric(as.character(subsetdata$Global_active_power))


#plot the data
plot(DateTime, subsetdata$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png,file="plot2.png", width=480, height=480)

dev.off()
