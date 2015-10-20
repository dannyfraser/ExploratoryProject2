source("download.R")
if (!"NEI" %in% ls()) {
    NEI <- readRDS("data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
    SCC <- readRDS("data/Source_Classification_Code.rds")
}

library(dplyr)
library(ggplot2)

d <- NEI %>%
    filter(fips == "24510" & between(year, 1999, 2008)) %>%
    select(year, type, Emissions) %>%
    group_by(type, year) %>%
    summarise(Emissions = sum(Emissions))
qplot(data = d, x = year, y = Emissions, facets = . ~ type, geom = "line")

# all show decreases except POINT, which shows a slight increase overall
