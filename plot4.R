#create plot4.png


#compute the value for the "skip" parameter in read.table
ind1<-grep('1/2/2007', readLines("household_power_consumption.txt"));
skip_until<-ind1[1]-1; #index of first entry of "1/2/2007" - 1 (skip until this point)


#compute the value for the "nrows" parameter in read.tabel
ind2<-grep('3/2/2007', readLines("household_power_consumption.txt"));
nr_lines<-ind2[1]-ind1[1]; #number of rows to read from ind1


#read table extracting only the elements of interest
a<-read.table("household_power_consumption.txt", skip=skip_until, nrows=nr_lines, sep=";")


#reassign names of columns to dataframe a
names(a)<-names(read.table("household_power_consumption.txt", nrows=1, sep=";", header=TRUE));


#create a full date list (date and time) with POSIXlt for x axis
fulldate<-as.POSIXlt(paste(as.Date(a$Date, format="%d/%m/%Y"), a$Time, sep=" "));


#create and save plot 4.png
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2));

#first picture
plot(fulldate, a$Global_active_power, type='l', main="", xlab="", ylab="Global Active Power");

#second picture
plot(fulldate,a$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="")
points(fulldate,a$Sub_metering_2, col="red", type='l')
points(fulldate,a$Sub_metering_3, col="blue", type='l')
legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex=0.95);

#third picture
plot(fulldate, a$Voltage, type='l', main="", xlab="datetime", ylab="Voltage");

#fourth picture
plot(fulldate, a$Global_reactive_power, type='l', main="", xlab="datetime", ylab="Global_reactive_power");


dev.off()