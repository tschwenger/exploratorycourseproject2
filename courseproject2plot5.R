library(plyr)

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


baltimoremotors <- NEI[NEI$fips=="24510" &NEI$type=="ON-ROAD",]

baltimoremotorsem <- aggregate(Emissions ~ year + type, baltimoremotors, sum)


png("courseproject2plot5.png", width=640, height=480)

g <- ggplot(baltimoremotorsem, aes(factor(year), Emissions))

plot5 <- g +geom_bar(stat="identity") +
  xlab("Year")+
  ylab("Total PM 2.5 Emissions")+
  ggtitle("Total Yearly Pm 2.5 Emissions from 1999 to 2008 in Baltimore (fips 2451)")

print(plot5)
dev.off()



