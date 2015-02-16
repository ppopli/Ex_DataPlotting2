### ques-5

library(plyr)
library(ggplot2)

## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Baltimore_mv <- subset(NEI, fips == "24510" & type=="ON-ROAD")

Baltimore_mv_year <- ddply(Baltimore_mv, .(year), function(x) sum(x$Emissions))
colnames(Baltimore_mv_year)[2] <- "Emissions"

png("plot5.png")
qplot(year, Emissions, data=Baltimore_mv_year, geom="line") +
        ggtitle("Baltimore City Motor Vehicle Emissions by Year") +
        xlab("Year") +
        ylab("Total Emissions")
dev.off()