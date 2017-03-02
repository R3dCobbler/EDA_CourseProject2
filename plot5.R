## Exploratory Data Analysis: Course Project 2

setwd("~/R3dCobbler/DataScience/Coursera/Data Science Specialisation/04.Exploratory Data Analysis/Course Project 2")
rm(list = ls())

# Read each of the 2 files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Load packages
library(dplyr)
library(ggplot2)

# Identify the motor vehicle sources

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE) 
vehicle.sources <- SCC[vehicles, ] # assuming all motor vehicles i.e. both highway and off-highway vehicles

# Merge the NEI and new vehicle.sources data frames

vehicle.emissions <- merge(vehicle.sources, NEI, by.x = "SCC")

# Create plot

png("plot5.png")
ggplot(vehicle.emissions, aes(x = factor(year), y = Emissions/1000, fill = SCC.Level.Two)) +
  ggtitle("pm25 Emissions from Motor Vehicles in Baltimore City: 1999 - 2008") +
  geom_bar(stat = "identity") + xlab("Year") + ylab("Total pm25 emissions")
dev.off()