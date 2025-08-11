library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "dataset.zip", method = "curl")
unzip("dataset.zip")
rm("url")

dfTmp = read.csv(
  file = "household_power_consumption.txt",
  sep = ";"
) %>%
  dplyr::mutate(
    dtRep = as.Date(Date,format="%d/%m/%Y")
  ) %>%
  dplyr::filter(
    dtRep >= as.Date("2007-02-01",format="%Y-%m-%d"),
    dtRep <= as.Date("2007-02-02",format="%Y-%m-%d")
  ) %>% 
  dplyr::mutate(
    dtRepTime = strptime(
      stringr::str_c(Date,Time,sep=" "),
      format = "%d/%m/%Y %H:%M:%OS"
    ),
    aGlobal_active_power = as.double(Global_active_power),
    aVoltage = as.double(Voltage)
  )
