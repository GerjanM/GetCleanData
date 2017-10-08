#question 1
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl,"acs.csv")
acsdf<-read.csv("acs.csv")
head(acsdf)
a<-strsplit(names(acsdf),"wgtp")
a[123]

#question 2
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl,"GDP.csv")
GDPdf<-read.csv("GDP.csv",skip = 4)
a<-GDPdf[1:190,]
b<-gsub(",","",a$X.4)
c<-as.numeric(b)
d<-is.na(c)
mean(c[!d])

#question 3
grep("^United",GDPdf$X.3)

#question 4
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl,"GDP.csv")
GDPdf<-read.csv("GDP.csv",skip=4)
fileurl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileurl2,"EDstat.csv")
EDstatdf<-read.csv("EDstat.csv")

GDPdf2<-GDPdf%>%
  rename(CountryCode=X,Rank=X.1,Country=X.3)%>%
  select(CountryCode,Rank,Country)%>%
  filter(Rank!=c("")&CountryCode!=c(""))

EDstatdf2<-EDstatdf%>%
  select(CountryCode,Special.Notes)

merge<-merge(GDPdf2,EDstatdf2,by.x = "CountryCode",by.y = "CountryCode",sort=FALSE)
grep("Fiscal year end: June",merge$Special.Notes)
grep("Fiscal year end: June",merge$Special.Notes,value = TRUE)
merge[grep("Fiscal year end: June",merge$Special.Notes),]

#question5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
nr2012<-length(sampleTimes[year(sampleTimes)==2012])
nr2012monday<-length(sampleTimes[year(sampleTimes)==2012&weekdays(sampleTimes)=="Monday"])

