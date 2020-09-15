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

## Create 3rd plot that will be stored in PNG file 480X480 pixel
## Scatterplot with type line of Sub_metering_1, Sub_metering_2, Sub_metering_3 againts Date & Time
png(file="./plot3.png", width=480, height=480)
plot(datetime, dataset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, dataset$Sub_metering_2, type="l", col="red")
lines(datetime, dataset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()