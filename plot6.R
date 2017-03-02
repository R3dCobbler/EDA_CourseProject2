## Exploratory Data Analysis: Course Project 2

setwd("~/R3dCobbler/DataScience/Coursera/Data Science Specialisation/04.Exploratory Data Analysis/Course Project 2")
rm(list = ls())

# Read each of the 2 files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 6. Comparing emissions from motor vehicles in Baltimore City and Los Angeles County, which city has seen greater changes over time?

# Load packages
library(dplyr)
library(ggplot2)

# Identify the motor vehicle sources

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE) 
vehicle.sources <- SCC[vehicles, ] # assuming all motor vehicles i.e. both highway and off-highway vehicles

# Merge the NEI and new vehicle.sources data frames

vehicle.emissions <- merge(vehicle.sources, NEI, by.x = "SCC")

# Identify only results from Baltimore City and Los Angeles County

vehicle.emissions$fips <- as.numeric(vehicle.emissions$fips)
comp <- subset(vehicle.emissions$fips, 
               


baltimore <- subset(vehicle.emissions, fips == "24510")
LAcounty <- subset(vehicle.emissions, fips == "06037")


# Create plot

png("plot6.png")
ggplot() + geom_line(aes(x = factor(year), y = Emissions, colour = fips), data = comp, stat = "identity") +
  ggtitle("Comparison of pm25 Emissions from Motor Vehicles in Baltimore City and LA County: 1999 - 2008")
dev.off()


