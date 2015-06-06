#create plot1.png


#compute the value for the "skip" parameter in read.table
ind1<-grep('1/2/2007', readLines("household_power_consumption.txt")); 
skip_until<-ind1[1]-1; #index of first entry of "1/2/2007" - 1 (skip until this point)


#compute the value for the "nrows" parameter in read.tabel
ind2<-grep('3/2/2007', readLines("household_power_consumption.txt")); 
nr_lines<-ind2[1]-ind1[1]; #number of rows to read from ind1


#read table extracting only the elements of interest
a=read.table("household_power_consumption.txt", skip=skip_until, nrows=nr_lines, sep=";");


#reassign names of columns to dataframe a
names(a)<-names(read.table("household_power_consumption.txt", nrows=1, sep=";", header=TRUE));

#create and save plot 1.png
png("plot1.png", width=480, height=480)
hist(a$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)");
dev.off()
