### ques-6

library(plyr)
library(ggplot2)

# reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


mv <- subset(NEI, (fips == "24510" | fips == "06037") & type=="ON-ROAD")

mv <- transform(mv,
                region = ifelse(fips == "24510", "Baltimore City", "Los Angeles County"))

mv_year_region <- ddply(mv, .(year, region), function(x) sum(x$Emissions))
colnames(mv_year_region)[3] <- "Emissions"

png("plot6.png")
qplot(year, Emissions, data=mv_year_region, geom="line", color=region) +
        ggtitle("Comparison  Motor Vehicle Emissions by Year") +
        xlab("Years") +
        ylab("Total Emissions")
dev.off()