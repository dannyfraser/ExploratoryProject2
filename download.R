# this script will gather the data for the assignment into a /data subfolder

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
savePath <- "data/download.zip"

if (!dir.exists("data")) {
    dir.create("data")
}
if (!dir.exists("plots")) {
    dir.create("plots")
}

if (!(file.exists("data/summarySCC_PM25.rds") &
    file.exists("data/Source_Classification_Code.rds")) ) {

    download.file(url, savePath)
    unzip(zipfile = savePath, exdir = "data")

    file.remove(savePath)
}
