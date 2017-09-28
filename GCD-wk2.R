#Week2
install.packages("RMySQL")
library(RMySQL)
ucscDb<-dbConnect(MySQL(),user="root",host="127.0.0.1",password="Gmaas123")
result<-dbGetQuery(ucscDb,"show databases;");dbDisconnect(ucscDb);
mydb<-dbConnect(MySQL(),user="root",host="127.0.0.1",password="Gmaas123",db="schema_contacten")
allTables<-dbListTables(mydb)
dbListFields(mydb,"tabel_adressen")
dbGetQuery(mydb,"select count(*) from tabel_adressen")
showrijen<-dbReadTable(mydb,"tabel_adressen")
dbDisconnect(mydb)

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
install.packages("httr")
library(httr)
myoauthapp <- oauth_app("github",
                        +                    key = "0590853e4572c839f18b",
                        +                    secret = "cb4b62ff8487658aee5f836d36add6646c09e913")
github_token <- oauth2.0_token(oauth_endpoints("github"), myoauthapp)

## Quiz-question 1 run in R, not in R-studio

library(httr)
library(httpuv) #installs a local webserver on port 1410

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at 
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "0590853e4572c839f18b",
                   secret = "3889d05900f85d1c47070103494f9b4fbf2a6899")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

req2 <- GET("https://api.github.com/users/GerjanM", gtoken)
stop_for_status(req2)
content(req2)


# OR:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
content(req)

for (i in 1:30) print(content(req)[[i]]$name)
content(req)[[12]]$created_at


## question 2
##belangrijk: RmySQL package niet laden: detach("package:RMySQL", unload=TRUE), anders krijg je een foutmelding

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
acs<-read.csv(url)
str(acs)

## question 4
library(XML)
con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode=readLines(con)
close(con)
htmlcode
nchar(htmlcode[c(10,20,30,100)])

## question 5
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
widths2<-c(15,4,4,9,4,9,4,9,4)
fixed <- read.fwf(url, widths2, header = FALSE, skip = 4)
sum(fixed$V4)

a<-read.fwf(url2,widths=100)
