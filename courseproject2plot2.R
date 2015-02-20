#Exploratory Data analysis course project 2

library(dplyr)
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips=="24510",]

baltimoreemmissions <- aggregate(Emissions ~ year, baltimore, sum)

png("courseproject2plot2.png", width=640, height=480)
plot2 <- barplot(height=baltimoreemmissions$Emissions, names.arg=baltimoreemmissions$year, xlab= "Year", ylab = "pm25 emmissions", main = "Yearly total pm25 emmissions in Baltimore (fips = 24510)")
print(plot2)
dev.off()