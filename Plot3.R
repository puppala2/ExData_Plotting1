# Coursera assignment  - Exploratory Data Analysis - First Week


# Reading data
pd.df <- read.table(file = "C:/R study material/Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
datetime <- paste(pd.df$Date, pd.df$Time)
pd.df$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
pd.df$Date <- NULL
pd.df$Time <- NULL
pd.df <- na.omit(pd.df)
fin.df <- pd.df[as.Date(pd.df$DateTime) >= "2007-02-01" & as.Date(pd.df$DateTime) <= "2007-02-02", ]
rm(pd.df)

# plot3
png(filename = "plot3.png", width = 480, height = 480)
plot(fin.df$DateTime, fin.df$Sub_metering_1, ylab = "Energy Sub Metering", xlab = "", type = "l", col="black")
lines(fin.df$DateTime, fin.df$Sub_metering_2, type = "l", col="red")
lines(fin.df$DateTime, fin.df$Sub_metering_3, type = "l", col="blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

