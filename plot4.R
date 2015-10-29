NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## finding coal related SCCs
coal <- grep("[Cc]oal", SCC$Short.Name)
## removing charcoal
charcoal <- grep("[Cc]harcoal", SCC$Short.Name[coal])
coal <- coal[-c(charcoal)]

year <- c(1999, 2002, 2005, 2008)
totalPM25coal <- numeric()
count <- 1
for (i in 1:4) {
        totalPM25coal[i] <- sum(NEI$Emissions[which(NEI$year == year[i] & NEI$SCC %in% SCC$SCC[coal])])
}


png(file="./plot4.png")
plot(year, totalPM25coal, xlab = "Year", ylab = "Total PM25 from coal combustion", main = "Total PM25 Emissions per year from coal combustion", pch = 19, type="b")
dev.off()