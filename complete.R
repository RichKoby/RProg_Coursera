# Programming Assignment 1 (week 2): Air Pollution
# Part 2
setwd("/home/xxxxxxx/coursera")
complete <- function(directory, id=1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    myfiles <- list.files(directory,pattern="*.csv")
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    DF = data.frame()
    for(i in id) {
        i2 <- formatC(i,width=3,format="d",flag="0")
        dirfile <- paste(directory,"/",i2,".csv",sep="")
        file <- read.csv(file=dirfile,
                         col.names=c("Date","sulfate","nitrate","id"),
                         colClasses=c("Date","numeric","numeric","integer"))
        id2 <- max(file$id)
        nobs <- sum(!is.na(file$sulfate)&!is.na(file$nitrate))
        DF <- rbind(DF,c(id2,nobs))
    }
    colnames(DF) <- c("id","nobs")
    class(DF)
    return(DF)
}
