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
png(filename = "plot2.png", width = 480, height = 480)
with (HH2, plot(Time, HH2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
dev.off()

