## Peer-graded Assignment: Exploratory Data Analysis Course Project 1

## Load sqldf package
library(sqldf)

## Download source .zip file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./Dataset.zip")

## Unzip file
unzip("Dataset.zip")

## Load dataset from household_power_consumption txt file
## Filter from Date with value between 1/2/2007 and 2/2/2007
dataset <- read.csv.sql("./household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep=";", header = TRUE)

## Merge Date and Time column and cast to "POSIXlt" "POSIXt" class
datetime <- strptime(paste(dataset$Date, dataset$Time),"%d/%m/%Y %H:%M:%S")

## Create 4th plot that will be stored in PNG file 480X480 pixel
## Contains 4 plots in 2x2 layout
png(file="./plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## 1st plot - Scatterplot with type line of Global_active_power againts Date & Time
plot(datetime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## 2nd plot - Scatterplot with type line of Voltage againts Date & Time
plot(datetime, dataset$Voltage, type="l", ylab="Voltage")

## 3rd plot - Scatterplot with type line of Sub_metering_1, Sub_metering_2, Sub_metering_3 againts Date & Time
plot(datetime, dataset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, dataset$Sub_metering_2, type="l", col="red")
lines(datetime, dataset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), bty = "n")

## 4th plot - Scatterplot with type line of Global_reactive_power againts Date & Time
plot(datetime, dataset$Global_reactive_power, type="l", ylab="Global_reactive_power")

dev.off()