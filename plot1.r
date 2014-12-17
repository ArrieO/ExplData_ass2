# Question 1
library(plyr)
scc <- readRDS(file = "Source_Classification_Code.rds");
pm25 <- readRDS(file = "summarySCC_PM25.rds");

emissionsByYear <- ddply(pm25, "year", summarise, total = sum(Emissions))
png(filename="plot1.png", width=480, height=480)
plot(x = emissionsByYear$year,
     y = emissionsByYear$total / 1000,
     type = "l",
     ylab = "Total Emissions from All Sources (kilotons)",
     xlab = "Year",
     xaxt='n')
axis(1, at=emissionsByYear$year,labels=emissionsByYear$year, col.axis="black", las=1)
dev.off()

