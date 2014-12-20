NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
totalPM25ByYear <- tapply(NEI$Emissions, NEI$year, sum)
png("plot1.png")
plot(names(totalPM25ByYear), totalPM25ByYear, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()
