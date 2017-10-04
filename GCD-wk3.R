##Question 1
detach("package:RMySQL", unload=TRUE) ##(anders foutmelding op download.file)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl,"acs.csv")
acsdf<-read.csv("acs.csv")
head(acsdf)
library(dplyr)
agricultureLogical<-acsdf$ACR==3&acsdf$AGS==6
head(which(agricultureLogical))

##question 2
library(jpeg)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileurl,"foto.jpg",mode='wb')
img<-readJPEG("foto.jpg",native = TRUE)
quantile(img,c(0.3,0.8))

##Question 3
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
  select(CountryCode)

merge<-merge(GDPdf2,EDstatdf2,by.x = "CountryCode",by.y = "CountryCode",sort=FALSE)

#Question 4
EDstatdf3<-EDstatdf%>%
  select(CountryCode,Income.Group)

merge2<-merge(GDPdf2,EDstatdf3,by.x = "CountryCode",by.y = "CountryCode",sort=FALSE)

merge2%>%
  mutate(rnk=1:189)%>%
  group_by(Income.Group)%>%
  summarize(mean(rnk))

#question 5
merge3<-merge2%>%
  mutate(rnk=1:189)

merge3$cut=cut(merge3$rnk,breaks=quantile(merge3$rnk,probs=c(0,0.20,0.5,0.75,1)))
table(merge3$cut)
table(merge3$cut,merge3$Income.Group)
