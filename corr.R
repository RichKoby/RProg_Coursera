# Programming Assignment 1 (week 2): Air Pollution
# Part 3
setwd("/home/xxxxxx/coursera")
corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    myfiles <- list.files(directory,pattern="*.csv")    
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    corx = NULL
    for(f in myfiles) {
        dirfile <- paste(directory,"/",f,sep="")
        file <- read.csv(file=dirfile,
                         col.names=c("Date","sulfate","nitrate","id"),
                         colClasses=c("Date","numeric","numeric","integer"))
        id <- max(file$id)
        nobs <- sum(!is.na(file$sulfate)&!is.na(file$nitrate))
        if(nobs >= threshold) {
            tempfile <- file[complete.cases(file),]
            corx = c(corx,cor(tempfile$sulfate,tempfile$nitrate))
        }
    }
    return(corx)
}
