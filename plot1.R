# Question 1

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission
# from all sources for each of the years 1999, 2002, 2005, and 2008.
source("download.R")
if (!"NEI" %in% ls()) {
    NEI <- readRDS("data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
    SCC <- readRDS("data/Source_Classification_Code.rds")
}

library(dplyr)
png("plots/plot1.png")
NEI %>%
    filter(year %in% c(1999, 2002, 2005, 2008)) %>%
    select(year, Emissions) %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions)) %>%
    plot(type = "l")
dev.off()

# plot shows downward trend in totals

