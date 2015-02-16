### ques - 3


library(plyr)
library(ggplot2)

## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- subset(NEI, fips == "24510")

type_pm <- ddply(Baltimore, .(year, type), function(x) sum(x$Emissions))
colnames(type_pm)[3] <- "Emissions"

png("plot3.png")
qplot(year, Emissions, data=type_pm, color=type, geom="line") +
        ggtitle("Emissions by Source Type and Year") +
        xlab("Years") +
        ylab("Total Emissions")
dev.off()
