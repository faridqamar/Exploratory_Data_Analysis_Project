NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## finding vehicle related SCCs
vehicle <- grep("[Vv]ehicle", SCC$Short.Name)

year <- c(1999, 2002, 2005, 2008)
totalPM25Balt <- numeric()
totalPM25LAC <- numeric()
count <- 1
for (i in 1:4) {
        totalPM25Balt[i] <- sum(NEI$Emissions[which(NEI$year == year[i] & NEI$SCC %in% SCC$SCC[vehicle] & NEI$fips == "24510")])
        totalPM25LAC[i] <- sum(NEI$Emissions[which(NEI$year == year[i] & NEI$SCC %in% SCC$SCC[vehicle] & NEI$fips == "06037")])
}

## Calculating the % change in PM25 emissions year to year
PM25changeBalt <- numeric()
PM25changeLAC <- numeric()
for (i in 1:3) {
        PM25changeBalt[i] <- (totalPM25Balt[i+1] - totalPM25Balt[i])/(totalPM25Balt[i])
        PM25changeLAC[i] <- (totalPM25LAC[i+1] - totalPM25LAC[i])/(totalPM25LAC[i])
}

png(file="./plot6.png")
par(mfrow = c(1,2))
plot(year[2:4], PM25changeBalt, xlab = "Year", ylab = "% PM25 change in Baltimore", ylim = c(0.05,-0.5), pch = 19, type="b")
plot(year[2:4], PM25changeLAC, xlab = "Year", ylab = "% PM25 change in LA", ylim = c(0.05,-0.5), pch = 19, type="b")
mtext("Change in PM25 Emissions from motor vehicles in Baltimore City and LA County", outer = TRUE)
dev.off()
