downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/household_power_consumption.zip"
householdFile <- "./Data/household_power_consumption.txt"
if (!file.exists(householdFile)){
  download.file(downloadURL, destfile= "./Data/household_power_consumption.zip", method = "libcurl")
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}
plotData <- read.table(householdFile, header = TRUE, sep = ";", na.strings = "?")

##set tiem variable
finalData <- plotData[plotData$Date %in% c("1/2/2007", "2/2/2007"),]
SetTime <- strptime(paste(finalData$Date, finalData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

#Generating Plot 1
hist(finalData$Global_active_power, col= "red", main= "Global Active Power", xlab = "Global Active Power(kilowatts)")