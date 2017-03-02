## Exploratory Data Analysis: Course Project 2

setwd("~/R3dCobbler/DataScience/Coursera/Data Science Specialisation/04.Exploratory Data Analysis/Course Project 2")
rm(list = ls())

# Read each of the 2 files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

tot_emissions <- aggregate(Emissions ~ year, NEI, sum)

# Make a plot using the Base plotting system showing total pm25 emissions from all sources
# Show for 1999, 2002, 2005 and 2008

png("plot1.png")
barplot(height = tot_emissions$Emissions,names.arg = tot_emissions$year, main = "Total Emissions 1999 - 2008", xlab = "Year", ylab = "pm25 Emissions", col = "red")
dev.off()