library(plyr)

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


LAbaltmotors <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",]

LAbaltmotorsem <- aggregate(Emissions ~ year + fips, LAbaltmotors, sum)


png("courseproject2plot6.png", width=1040, height=480)

g <- ggplot(LAbaltmotorsem, aes(factor(year), Emissions))

g <- g + facet_grid(. ~ fips)

plot6 <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab("Total PM 2.5 Emissions") +
  ggtitle("Totol Yearly Pm 2.5 Emissions from 1999 to 2008 
          in Baltimore (fips 24510) and LA (fips 06037) 
          a wholesome comparative study")

print(plot6)
dev.off()
