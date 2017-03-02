## Exploratory Data Analysis: Course Project 2

setwd("~/R3dCobbler/DataScience/Coursera/Data Science Specialisation/04.Exploratory Data Analysis/Course Project 2")

# Read each of the 2 files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 3. Which of the four source types (point, nonpoint, onroad, nonroad) have seen decreases in emissions from 1999 - 2008?
# Which have seen increases over the same period?

# Use ggplot2 plotting system to answer this question

library(ggplot2)

png("plot3.png")
balt.types <- aggregate(baltimore["Emissions"], list(type = baltimore$type, year = baltimore$year), sum)
qplot(year, Emissions, data = balt.types, color = type, geom= "line") + xlab("Year") + ylab("pm2.5 Emissions") + ggtitle("Total pm2.5 Emissions Baltimore City by Source Type")
dev.off()








