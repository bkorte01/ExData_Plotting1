setwd("C:/Users/bkorte/Desktop/R_working_directory/Exploratory_Data_Analysis")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y", tz = ""), "%Y-%m-%d", tz = "")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

data_sub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

hist(data_sub$Global_active_power, breaks = (12), freq = TRUE, main = paste("Global Active Power"), col = "red", xlim = c(0, 6), xlab = paste("Global Active Power (kilowatts)"))

