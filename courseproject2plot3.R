#Exploratory Data analysis course project 2

library(dplyr)
library(plyr)

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips=="24510",]

baltimoreemissions <- aggregate(Emissions ~ year + type, baltimore, sum)

qplot(year, Emissions, data=baltimoreemissions, facets = type ~.)


png("courseproject2plot3.png", width=640, height=480)

g <- ggplot(baltimoreemissions, aes(year, Emissions))


plot3 <- g + geom_point() + #This plot is correct
  facet_grid(. ~ type) + 
  geom_smooth(size = .5, linetype=7, method = "lm", se = FALSE) +
  xlab("Year")+
  ylab("PM2.5 Emissions")+
  ggtitle("Non-road, nonpoint, on-road, and point yearly PM2.5 emissions
          in Baltimore (fips 24510) between 1999 and 2008")

print(plot3)
dev.off()

