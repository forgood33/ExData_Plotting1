temp <- tempfile()
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, temp, method = "wget", mode = "wb")
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE, nrows = 69516)
unlink(temp)
data <- data[66637:69516, ]
data$TD <- strptime(paste(data[, 1], data[, 2], sep=","), format="%d/%m/%Y,%H:%M:%S")
data[, 3] <- as.numeric(as.character(data[, 3]))
data[, 4] <- as.numeric(as.character(data[, 4]))
data[, 5] <- as.numeric(as.character(data[, 5]))
data[, 7] <- as.numeric(as.character(data[, 7]))
data[, 8] <- as.numeric(as.character(data[, 8]))
data[, 9] <- as.numeric(as.character(data[, 9]))

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data[, 10], data[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", pch = NA_integer_)
lines(data[, 10], data[, 3])

plot(data[, 10], data[, 5], xlab = "datetime", ylab = "Voltage", pch = NA_integer_)
lines(data[, 10], data[, 5])

plot(data[, 10], data[, 7], xlab = "", ylab = "Energy sub metering", pch = NA_integer_)
points(data[, 10], data[, 8], pch = NA_integer_)
points(data[, 10], data[, 9], pch = NA_integer_)
lines(data[, 10], data[, 7], col = "black")
lines(data[, 10], data[, 8], col = "red")
lines(data[, 10], data[, 9], col = "blue")
legend("topright", pch = '-', bty = "n", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data[, 10], data[, 4], xlab = "datetime", ylab = "Global_reactive_power", pch = NA_integer_)
lines(data[, 10], data[, 4])
dev.off()