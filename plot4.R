source("ReadData.R")

vXAxisTicks = as.POSIXct(
  c("2007-02-01 00-00-00","2007-02-02 00-00-00","2007-02-03 00-00-00"),
  format="%Y-%m-%d %H-%M-%OS")

par(mfrow=c(2,2))

# Top left chart
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

# Top right plot
plot(
  x = dfTmp$dtRepTime,
  y = dfTmp$aVoltage,
  xaxt = "n",
  type = "S",
  main = "",
  ylab = "Voltage", xlab = "datetime"
)
axis(
  side=1,
  at = vXAxisTicks,
  labels = weekdays(vXAxisTicks,abbreviate = TRUE)
)

# Bottom left plot
plot(
  x = dfTmp$dtRepTime,
  y = dfTmp$Sub_metering_1, col = "black",
  xaxt = "n",
  type = "S",
  main = "",
  ylab = "Energy Sub metering", xlab = ""
)
lines(
  x = dfTmp$dtRepTime,
  y = dfTmp$Sub_metering_2, col = "red",
)
lines(
  x = dfTmp$dtRepTime,
  y = dfTmp$Sub_metering_3, col = "blue",
)
axis(
  side=1,
  at = vXAxisTicks,
  labels = weekdays(vXAxisTicks,abbreviate = TRUE)
)
legend(
  "topright", 
  lty = c(1, 1,1),
  col = c("black","blue", "red"), 
  legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
  cex = 0.75,
  bty="n"
)

# Bottom right plot 
plot(
  x = dfTmp$dtRepTime,
  y = dfTmp$Global_reactive_power,
  xaxt = "n",
  type = "S",
  main = "",
  ylab = "Global_reactive_power", xlab = "datetime"
)
axis(
  side=1,
  at = vXAxisTicks,
  labels = weekdays(vXAxisTicks,abbreviate = TRUE)
)

# Export to png
dev.copy(png, file = "plot4.png",units="px",height = 480, width = 480) ## Copy my plot to a PNG file
dev.off() ## Close the PNG device!
