rm(list=ls())
library(ggplot2)
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
## vehicle sources in Los Angeles County, California fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

getwd()
setwd("C:\\Users\\karis\\OneDrive\\Desktop")

# reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subsetting SCC with vehicle values
vehicleMatches  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicleMatches, ]

# merging dataframes
Baltimore <- merge(NEI[which(NEI$fips == "24510"),], subsetSCC, by="SCC")
Los_Angeles <- merge(NEI[which(NEI$fips == "06037"),], subsetSCC, by="SCC")

# summing emission data per year per type
Los_Angeles$city <- "Los Angeles County"
Baltimore$city <- "Baltimore City" 

data <- rbind(Baltimore, Los_Angeles)

# summing emission data per year per type
data <- aggregate(Emissions ~ year + city, data, sum)

# plotting
g <- ggplot(data, aes(year, Emissions, color = city))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions from motor sources in Baltimore and Los Angeles")
  
