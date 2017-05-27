##Download the file into the working directory
##run the File using source()
#ie,source("plot1.R")


# read power Consumption data
pwrdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors =FALSE)
 
# change the date format
pwrdata$Date <- as.Date(pwrdata$Date, format = "%d/%m/%Y")


#subset the powerdata for the 2 days

subsetdata <- subset(pwrdata,Date == "2007-02-01" | Date =="2007-02-02")


#plot the data


hist(subsetdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main ="Global Active Power")
dev.copy(png,file="plot1.png", width=480, height=480)

dev.off()








