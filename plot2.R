source("download.R")
if (!"NEI" %in% ls()) {
    NEI <- readRDS("data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
    SCC <- readRDS("data/Source_Classification_Code.rds")
}

library(dplyr)
png("plots/plot2.png")
NEI %>%
    filter(fips == "24510" & between(year, 1999, 2008)) %>%
    select(year, Emissions) %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions)) %>%
    plot(type = "l")
dev.off()

#plot shows an overall downward trend
