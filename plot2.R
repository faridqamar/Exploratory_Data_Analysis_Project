NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yr <- c(1999, 2002, 2005, 2008)

totalPM25Balt <- numeric()
for (i in 1:4) {
        totalPM25Balt[i] <- sum(NEI$Emissions[which(NEI$year == yr[i] & NEI$fips == "24510")])
}

png(file="./plot2.png")
plot(yr, totalPM25Balt, xlab = "Year", ylab = "Total PM25", main = "Total PM25 Emissions per Year in Baltimore City", pch = 19, type="b")
dev.off()