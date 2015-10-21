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
    inner_join(y = SCC, by = "SCC") %>%
    filter(Data.Category == "Onroad") %>%
    select(year, Emissions) %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))

png("plots/plot5.png")
qplot(data = d, x = year, y = Emissions, geom = "line")
dev.off()
# shows overall decrease
