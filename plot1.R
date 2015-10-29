NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yr <- c(1999, 2002, 2005, 2008)

totalPM25 <- numeric()
for (i in 1:4) {
        totalPM25[i] <- sum(NEI$Emissions[which(NEI$year == yr[i])])
}

png(file="./plot1.png")
plot(yr, totalPM25, xlab = "Year", ylab = "Total PM25", main = "Total PM25 Emissions per Year", pch = 19, type="b")
dev.off()