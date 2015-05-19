# Programming Assignment 1 (week 2): Air Pollution
# Part 1 - running the function
source("pollutantmean.R")
pollutantmean("specdata","sulfate",1:10)
pollutantmean("specdata","nitrate",70:72)
pollutantmean("specdata","nitrate",23)

test <- read.csv(file="specdata/001.csv",
                 col.names=c("Date","sulfate","nitrate","id"),
                 colClasses=c("Date","numeric","numeric","integer"))
class(test)
summary(test)
str(test)
mean(test$sulfate,na.rm=TRUE)
pollutantmean("specdata","sulfate",1:3)
directory <- "specdata"
i <- 10
i2 <- formatC(i,width=3,format="d",flag="0")
dirfile <- paste(directory,"/",i2,".csv",sep="")
file <- read.csv(file=dirfile,
                 col.names=c("Date","sulfate","nitrate","id"),
                 colClasses=c("Date","numeric","numeric","integer"))
pollutant <- "sulfate"
var <- paste("file$",pollutant,sep="")
mean(file[[pollutant]],na.rm=TRUE)

# Part 2 - running the function
source("complete.R")
complete("specdata",1)
complete("specdata",c(2,4,8,10,12))
complete("specdata",c(30:25))
complete("specdata",3)
         
# Part 3 - running the function
source("corr.R")
cr <- corr("specdata",150)
head(cr)
summary(cr)
cr <- corr("specdata",400)
head(cr)
summary(cr)
cr <- corr("specdata",5000)
head(cr)
summary(cr)
length(cr)
cr <- corr("specdata")
head(cr)
summary(cr)
length(cr)

source("submitscript1.R")
submit()
