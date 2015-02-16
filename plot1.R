### ques - 1

## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## calculating total emissions by year

total <- tapply(NEI$Emissions, NEI$year, sum)

png(file = "plot1.png")

plot(names(total),total, type ="l",
     xlab = "Years", ylab = "Total Emissions PM2.5",
     main = "Total US PM2.5 Emissions over the years 1999-2008")
 dev.off()
