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

# Plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(fin.df$Global_active_power, main = "Global Active Power", col = "red", xlab="Global Active Power (kiolwatts)", ylab = "Frequency")
dev.off()
