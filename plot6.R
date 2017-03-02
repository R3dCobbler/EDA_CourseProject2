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

comp <- subset(vehicle.emissions, fips == "24510" | fips == "06037")
comp1 <- aggregate(Emissions ~ year + fips, comp, sum)

# Rename the fips variables for the legend in the plot

comp1$fips <- factor(comp1$fips, levels = c("24510","06037"), labels = c("Baltimore City","Los Angeles County"))

# Create plot

png("plot6.png")
ggplot(comp1, aes(year, Emissions, color = fips)) + geom_line() +
  ggtitle("Comparison of Motor Vehicle Emissions in Baltimore City and Los Angeles County: 1999-2008") +
  xlab("Year") + ylab("pm25 Emission Levels") 
dev.off()


