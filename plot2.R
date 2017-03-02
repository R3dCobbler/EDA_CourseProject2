## Exploratory Data Analysis: Course Project 2

setwd("~/R3dCobbler/DataScience/Coursera/Data Science Specialisation/04.Exploratory Data Analysis/Course Project 2")

# Read each of the 2 files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland area(fips == "24510") from 1999 to 2008?

baltimore <- subset(NEI, fips == "24510")

balt_emissions <- aggregate(Emissions ~ year, baltimore, sum)

# Make a plot using the Base plotting system to answer this question.

png("plot2.png")
barplot(height = balt_emissions$Emissions, names.arg = balt_emissions$year, main = "Total Emissions Baltimore City 1999 - 2008", xlab = "Year", ylab = "pm25 Emissions", col = "red")
dev.off()