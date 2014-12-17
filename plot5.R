# Question 5
library(plyr)
library(ggplot2)

scc <- readRDS(file = "Source_Classification_Code.rds");
pm25 <- readRDS(file = "summarySCC_PM25.rds");

baltimorePM25 <- pm25[pm25["fips"] == "24510",]

motorSources <- scc[grepl("*Vehicles", scc$EI.Sector),]
motorPM25 <- baltimorePM25[baltimorePM25$SCC %in% motorSources$SCC,]

emissionsByYear <- ddply(motorPM25, "year", summarise, total = sum(Emissions))
png(filename="plot5.png", width=480, height=480)
qplot(x = year,
      xlab = "Year",
      y = total,
      ylab = "Total Emissions (tons)",
      data = emissionsByYear,
      geom = c("point", "smooth"),
      method = "loess") + labs(title = "Emissions from motor vehicle sources in Baltimore City")
)
dev.off()
