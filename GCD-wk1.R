##question 1

df<-read.csv("q1.csv")
df$VAL
million<-df[df$VAL>=14,]
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
list.files

#Question 3

library(xlsx)
library(XML)
library(stringi)
library(ggplot2)
library(jsonlite)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
setwd("D:/Users/Gerjan/R/GetCleanData")
download.file(fileurl,"q3-wk1.xlsx",mode="wb")
dat<-read.xlsx("q3-wk1.xlsx",1,startRow = 18,endRow = 23,colIndex = c(7:15))

#Question 4

fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl,"q4-wk1.xml")
xmlSApply(rootNode,xmlValue)


doc<-xmlTreeParse(fileUrl)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]][[2]][[2]]
a<-xpathSApply(rootNode,"//zipcode",xmlValue)
b<-a[a=="21231"]
str(b)

#question5
library(data.table)
DT<-fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
DT[,mean(pwgtp15),by=SEX]

