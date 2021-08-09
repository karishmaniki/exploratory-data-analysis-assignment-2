rm(list=ls())
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?  
## Use the base plotting system to make a plot answering this question.

getwd()
setwd("C:\\Users\\karis\\OneDrive\\Desktop\\assignment2")

# reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset data for Baltimore City, Maryland and summing emission data per year
totalEmissions <- tapply(NEI$Emissions[NEI$fips == "24510"], NEI$year[NEI$fips == "24510"], sum)

# plotting
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission per year in Baltimore City, Maryland")






