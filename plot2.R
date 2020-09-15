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

## Create 2nd plot that will be stored in PNG file 480X480 pixel
## Scatterplot with type line of Global_active_power againts Date & Time
png(file="./plot2.png", width=480, height=480)
plot(datetime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()