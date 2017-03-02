## Exploratory Data Analysis: Course Project 2

setwd("~/R3dCobbler/DataScience/Coursera/Data Science Specialisation/04.Exploratory Data Analysis/Course Project 2")
rm(list = ls())

# Read each of the 2 files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Load packages
library(dplyr)
library(ggplot2)

# Identify coal combustion related sources

dig4coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector) 
coal.sources <- SCC[dig4coal,]

# Merge the NEI and new coal.sources data frames

coal.combustion <- merge(coal.sources, NEI, by.x = "SCC")

# Create plot

png("plot4.png")
ggplot(coal.combustion, aes(x = factor(year), y = Emissions/1000, fill = EI.Sector)) +
  ggtitle("US Coal Combustion Related pm25 Emissions: 1999 - 2008") +
  geom_bar(stat = "identity") + xlab("Year") + ylab("Total pm25 emissions in kilotons")
dev.off()



