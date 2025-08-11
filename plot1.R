source("ReadData.R")

par(mfrow=c(1,1))

hist(
  dfTmp$aGlobal_active_power,
  col = "red",
  xlab = "Global Active Power (kilowats)",
  ylab = "Frequency",
  main = "Global Active Power"
)

dev.copy(png, file = "plot1.png",units="px",height = 480, width = 480) ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!