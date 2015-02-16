### Ques - 2

## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## calculating total emissions by year

Baltimore <- subset(NEI, fips == "24510")
total <- tapply(Baltimore$Emissions, Baltimore$year, sum)


png(file = "plot2.png")

plot(names(total),total, type ="l",
     xlab = "Years", ylab = "Total Emissions PM2.5",
     main = "Total Baltimore PM2.5 Emissions over the years 1999-2008")
dev.off()


