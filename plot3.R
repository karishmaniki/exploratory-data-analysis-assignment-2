rm(list=ls())

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

library("ggplot2")
getwd()
setwd("C:\\Users\\karis\\OneDrive\\Desktop")

# reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset data for Baltimore City, Maryland and summing emission data per year
totalEmissions <- subset(NEI, NEI$fips == "24510")

# plotting with ggplot2
# summing emission data per year per type
data <- aggregate(Emissions ~ year + type, totalEmissions, sum)

# plotting
g <- ggplot(data, aes(year, Emissions, color = type))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions per type in Baltimore City")


