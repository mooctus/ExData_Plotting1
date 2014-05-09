Sys.setlocale(category = "LC_ALL", locale = "C")
df <- read.table(file="household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
df$Time <- strptime(
  paste0(df$Date, " ", df$Time),
  format=paste0("%d/%m/%Y %H:%M:%S")
)
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df1 <- df[df$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

png(filename="plot1.png",width=480, height=480)
with (df1,
      hist(Global_active_power, 
           col="red",
           xlab="Global Active Power (kilowatts)",
           ylab="Frequency", main="Global Active Power")
)
dev.off()
