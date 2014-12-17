# Question 3
library(plyr)
library(ggplot2)

scc <- readRDS(file = "Source_Classification_Code.rds");
pm25 <- readRDS(file = "summarySCC_PM25.rds");

baltimorePM25 <- pm25[pm25["fips"] == "24510",]
baltimorePM25$typefactor <- factor(baltimorePM25$type)

emissionsByYearByType <- ddply(baltimorePM25, c("year", "typefactor"), summarise, total = sum(Emissions))
png(filename="plot3.png", width=480, height=480)
qplot(x      = year,
      xlab   = "Year",
      y      = total,
      ylab   = "Total Emissions (tons)",
      data   = emissionsByYearByType,
      color  = typefactor,
      geom   = c("point", "smooth"),
      method = "loess"
)
dev.off()
