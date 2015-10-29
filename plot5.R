NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## finding vehicle related SCCs
vehicle <- grep("[Vv]ehicle", SCC$Short.Name)

year <- c(1999, 2002, 2005, 2008)
totalPM25vehicle <- numeric()
count <- 1
for (i in 1:4) {
        totalPM25vehicle[i] <- sum(NEI$Emissions[which(NEI$year == year[i] & NEI$SCC %in% SCC$SCC[vehicle] & NEI$fips == "24510")])
}


png(file="./plot5.png")
plot(year, totalPM25vehicle, xlab = "Year", ylab = "Total PM25 from motor vehicles", main = "Total PM25 Emissions in Baltimore City from motor vehicles", pch = 19, type="b")
dev.off()