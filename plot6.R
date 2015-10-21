source("download.R")
if (!"NEI" %in% ls()) {
    NEI <- readRDS("data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
    SCC <- readRDS("data/Source_Classification_Code.rds")
}

library(dplyr)
library(ggplot2)

city <- data.frame(fips = c("24510", "06037"), city = c("Baltimore", "Los Angeles"))

d <- NEI %>%
    filter(fips %in% c("24510", "06037") & between(year, 1999, 2008)) %>%
    inner_join(y = SCC, by = "SCC") %>%
    inner_join(y = city, on = "fips") %>%
    filter(Data.Category == "Onroad") %>%
    select(year, city, Emissions) %>%
    group_by(city, year) %>%
    summarise(Emissions = sum(Emissions))

png("plots/plot6.png")
qplot(data = d, x = year, y = Emissions, geom = "line", colour = city)
dev.off()

# shows decrease in Baltimore and increase in LA
