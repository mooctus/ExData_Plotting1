Sys.setlocale(category = "LC_ALL", locale = "C")
df <- read.table(file="household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
df$Time <- strptime(
  paste0(df$Date, " ", df$Time),
  format=paste0("%d/%m/%Y %H:%M:%S")
)
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df1 <- df[df$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

png(filename="plot2.png",width=480, height=480)
with (df1,
      plot(Time, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
)

with (df1,
      lines(Time, Global_active_power)
)
dev.off()
