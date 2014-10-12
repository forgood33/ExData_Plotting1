temp <- tempfile()
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, temp, method = "wget", mode = "wb")
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE, nrows = 69516)
unlink(temp)
data <- data[66637:69516, ]
data$TD <- strptime(paste(data[, 1], data[, 2], sep=","), format="%d/%m/%Y,%H:%M:%S")
data[, 3] <- as.numeric(as.character(data[, 3]))

png(file = "plot1.png", width = 480, height = 480)
hist(data[, 3], main = "Global Active Power", col = "554", xlab = "Global Active Power (kilowatts)")
dev.off()