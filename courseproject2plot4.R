library(dplyr)
library(plyr)

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

neiscc <- merge(NEI, SCC, by="SCC")

coal <- grepl("coal", neiscc$Short.Name, ignore.case=TRUE)

coalnccscc <- neiscc[coal,] #takes subset of all the coal lines

yearlycoalem <- aggregate(Emissions ~ year, coalnccscc, sum)

png("courseproject2plot4.png", width=640, height=480)

g <- ggplot(yearlycoalem, aes(factor(year), Emissions))

plot4 <- g + 
  geom_bar(stat="identity") + 
  xlab("Year") + 
  ylab(expression('Total PM'[2.5]* "Emissions")) + 
  ggtitle('Total Coal Combustion Emissions from 1999 to 2008 in the USA')  #This plot is correct

print(plot4)
dev.off()