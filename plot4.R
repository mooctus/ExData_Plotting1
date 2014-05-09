Sys.setlocale(category = "LC_ALL", locale = "C")
df <- read.table(file="household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
df$Time <- strptime(
  paste0(df$Date, " ", df$Time),
  format=paste0("%d/%m/%Y %H:%M:%S")
)
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
#df$Time <- strptime(df$Time,format=paste0(df$Date, " ", "%H:%M:%S")
df1 <- df[df$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]


png(filename="plot4.png",width=480, height=480)
par(mfrow=c(2,2), mar=c(5,5,2,1))

#1,1
with (df1,
      plot(Time, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
)

with (df1,
      lines(Time, Global_active_power)
)

#1,2
with (df1,
      plot(Time, Voltage, type="n", xlab="datetime", ylab="Voltage")
)

with (df1,
      lines(Time, Voltage)
)

#2,1
with (df1,
      plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")     
)
with (df1,
      lines(Time, Sub_metering_1, col="black")
)
with (df1,
      lines(Time, Sub_metering_2, col="red")
)
with (df1,
      lines(Time, Sub_metering_3, col="blue")
)

legend("topright", 
       col = c("black","red", "blue"), 
       lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"),
       bty="n"
)

#2,2
with (df1,
      plot(Time, Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
)

with (df1,
      lines(Time, Global_reactive_power)
)
dev.off()
