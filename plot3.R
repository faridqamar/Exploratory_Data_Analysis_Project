library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yr <- c(1999, 2002, 2005, 2008)
tp <- c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD")
tmpyear = integer()
tmptype = character()
tmptotalPM25 = numeric()

count <- 1
for (i in 1:4) {
        for (j in 1:4){
                tmpyear[count] <- yr[i]
                tmptype[count] <- tp[j]
                tmptotalPM25[count] <- sum(NEI$Emissions[which(NEI$fips == "24510" & NEI$year == yr[i] & NEI$type == tp[j])])
                count <- count+1
        }
}

dataFrame <- data.frame("year" = tmpyear, "totalPM25" = tmptotalPM25, "type" = tmptype)

png(file="./plot3.png")
g <- ggplot(dataFrame, aes(year, totalPM25))
g <- g + geom_point() + geom_line() + facet_grid(type~.)
g <- g + labs(title="Total PM25 emissions per year in Baltimore City for each type of sources", x="Year", y="Total PM25")
print(g)
dev.off()