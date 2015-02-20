#Exploratory Data analysis course project 2

library(dplyr)
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emmissions <- aggregate(Emissions ~ year, NEI, sum)

png("courseproject2plot1.png", width=640, height=480)
plot1 <- barplot(height=emmissions$Emissions, names.arg=emmissions$year, xlab= "Year", ylab = "pm25 emmissions", main = "Yearly Total pm25 Emmissions in the USA from 1999 to 2008")
print(plot1)
dev.off()
