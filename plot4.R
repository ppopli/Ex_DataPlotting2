### ques -4

library(plyr)
library(ggplot2)

## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Coal_SCC <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Institutional - Coal",
                                                  "Fuel Comb - Electric Generation - Coal",
                                                  "Fuel Comb - Industrial Boilers, ICEs - Coal"))

Coal_SCC1 <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))

d1 <- setdiff(CoalCombustionSCC$SCC, CoalCombustionSCC1$SCC)
d2 <- setdiff(CoalCombustionSCC1$SCC, CoalCombustionSCC$SCC)


Coal_SCCCodes <- union(CoalCombustionSCC$SCC, CoalCombustionSCC1$SCC)


CoalCombustion <- subset(NEI, SCC %in% Coal_SCCCodes)

coal_Comb_Year <- ddply(CoalCombustion, .(year, type), function(x) sum(x$Emissions))
colnames(coal_Comb_Year)[3] <- "Emissions"

png("plot4.png")
qplot(year, Emissions, data=coal_Comb_Year, color=type, geom="line") +
        stat_summary(fun.y = "sum", fun.ymin = "sum", fun.ymax = "sum", 
                     color = "black", aes(shape="total"), geom="line") +
        geom_line(aes(size="total", shape = NA)) +
        ggtitle("Coal Combustion Emissions by Source Type and Year") +
        xlab("Year") +
        ylab("Total Emissions")
dev.off()
