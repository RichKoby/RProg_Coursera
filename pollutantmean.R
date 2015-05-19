# Programming Assignment 1 (week 2): Air Pollution
# Part 1
setwd("/home/xxxxxxx/coursera")
pollutantmean <- function(directory, pollutant, id=1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the 
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    DF <- NULL
    for(i in id) {
        i2 <- formatC(i,width=3,format="d",flag="0")
        dirfile <- paste(directory,"/",i2,".csv",sep="")
        file <- read.csv(file=dirfile,
                         col.names=c("Date","sulfate","nitrate","id"),
                         colClasses=c("Date","numeric","numeric","integer"))
        DF <- rbind(DF,file)
    }
    print(mean(DF[[pollutant]],na.rm=TRUE))
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
}
