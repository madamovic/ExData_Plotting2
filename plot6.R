library(plyr)
library(ggplot2)
# Read the data file
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")
# Assume "Motor Vehicles" only means on road
MV <- subset(NEI, (fips == "24510" | fips == "06037") & type=="ON-ROAD")
# Use more meaningful variable names
MV <- transform(MV,
                region = ifelse(fips == "24510", "Baltimore City", "Los Angeles County"))
MVPM25ByYearAndRegion <- ddply(MV, .(year, region), function(x) sum(x$Emissions))
colnames(MVPM25ByYearAndRegion)[3] <- "Emissions"
# This plot was unsatisfying due to vastly different scales
png("plot6.png")
qplot(year, Emissions, data=MVPM25ByYearAndRegion, geom="line", color=region) +
  ggtitle(expression("Baltimore City and Los Angeles County" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()
