# Question 2
library(plyr)
scc <- readRDS(file = "Source_Classification_Code.rds");
pm25 <- readRDS(file = "summarySCC_PM25.rds");

baltimorePM25 <- pm25[pm25["fips"] == "24510",]
emissionsByYear <- ddply(baltimorePM25, "year", summarise, total = sum(Emissions))

png(filename="plot2.png", width=480, height=480)

plot(x = emissionsByYear$year,
     y = emissionsByYear$total / 1000,
     type = "l",
     ylab = "Total Emissions from All Sources (kilotons)",
     xlab = "Year",
     xaxt='n'
)
axis(1, at=emissionsByYear$year,labels=emissionsByYear$year, col.axis="black", las=1)
dev.off()

