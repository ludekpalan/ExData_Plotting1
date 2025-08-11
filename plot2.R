source("ReadData.R")

par(mfrow=c(1,1))

vXAxisTicks = as.POSIXct(
  c("2007-02-01 00-00-00","2007-02-02 00-00-00","2007-02-03 00-00-00"),
  format="%Y-%m-%d %H-%M-%OS")

plot(
  x = dfTmp$dtRepTime,
  y = dfTmp$aGlobal_active_power,
  xaxt = "n",
  type = "S",
  main = "",
  ylab = "Global Active Power (kilowats)", xlab = ""
)
axis(
  side=1,
  at = vXAxisTicks,
  labels = weekdays(vXAxisTicks,abbreviate = TRUE)
)

dev.copy(png, file = "plot2.png",units="px",height = 480, width = 480) ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!
