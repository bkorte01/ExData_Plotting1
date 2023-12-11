setwd("C:/Users/bkorte/Desktop/R_working_directory/Exploratory_Data_Analysis")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %T", tz = ""), "%Y-%m-%d %T", tz = "")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
df <- data[data$DateTime >= "2007-02-01 00:00:00" & data$DateTime < "2007-02-03 00:00:00",]
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Voltage <- as.numeric(df$Voltage)
tick_positions <- pretty(df$DateTime, n = 2)

par(mfrow = c(2,2), mar = c(5, 4, 2, 1))
with(df, plot(DateTime, Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power"))
axis(1, tick = TRUE,
     at = tick_positions, 
     format(tick_positions, "%a"))

with(df, plot(DateTime, Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global Active Power"))
axis(1, tick = TRUE, at = tick_positions, format(tick_positions, "%a"))

with(df, plot(DateTime, Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering"))
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", bty = "n", cex = 0.8, pch = "_____", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, tick = TRUE,
     at = tick_positions, 
     format(tick_positions, "%a"))

with(df, plot(DateTime, Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_rective_power"))
axis(1, tick = TRUE,
     at = tick_positions, 
     format(tick_positions, "%a"))