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

## Create 1st plot that will be stored in PNG file 480X480 pixel
## Histogram of Global_active_power
png(file="./plot1.png", width=480, height=480)
hist(dataset$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()