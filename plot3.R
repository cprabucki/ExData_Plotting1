# Loads the file 
setwd("C:\\Users\\a212857\\Documents\\GitHub\\ProgrammingAssigment1.EDA")

# Loads the DF's
HH <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Selectes only the working subset
HH$Time <- strptime(paste(as.character(HH$Date), as.character(HH$Time)) ,format='%d/%m/%Y %H:%M:%S')
HH$Date <- as.Date(as.character(HH$Date),format='%d/%m/%Y')
HH2 <- subset(HH, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
rm(HH)

# Launches the png plot
png(filename = "plot3.png", width = 480, height = 480)
with (HH2, plot(Time, Sub_metering_1, type="l", ylab="Energy sub meetering"))
with (HH2, points(Time, Sub_metering_2, type="l", col="red"))
with (HH2, points(Time, Sub_metering_3, type="l", col="blue"))

## Annotates the legend
legend("topright", col=c("black","red","blue"), lwd=2, legend=names(HH2)[7:9], cex=0.8)

dev.off()

