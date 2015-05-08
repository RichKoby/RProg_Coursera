#------- 1.9 Data Types - Missing Values -----#
# is.na() - missing values
# is.nan() - undefined mathematical operations
# NA values have a class:  numeric, integer, char
# NaN value is also NA but converse is not true
x <- c(1,2,NA, 10, 3)
is.na(x)
is.nan(x)
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)
#------- 1.10 Data Types - Data Frames -----#
# a special type of list where every element of list has same length
# each element is a column and length is the number of rows
# special attribute called row.names, created by read.table() or read.csv()
x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
x
nrow(x)
ncol(x)
#------- 1.11 Data Types - Names Attribute -----#
x <- 1:3
names(x)
names(x) <- c("foo","bar","norf")
x
names(x)
# lists
x <- list(a=1,b=2,c=3)
x
# matrices
m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a","b"),c("c","d"))
m
#------- 1.12 Reading Tabular Data -----#
# read.table, read.csv - reads tabular data
# readLines - reading lines of text file, source - read R code
# dget - for reading R code files (R objects)
# load - read saved workspaces
# unserialize - read binary objects
# write.table, writeLines, dump, dput, save, serialize
# read.table(file,header,sep,colClasses,nrows,comment.char,skip, stringsAsFactors)
data <- read.table("foo.txt")
#------- 1.13 Reading Large Tables -----#
# read help page for read.table!!
# make rough calc of memory required, and set comment.char="" if no comments
# use colClasses arg whenever possible
initial <- read.table("datatable.txt",nrows=100)
classes <- sapply(initial,class)
tabAll <- read.table("datatable.txt,colClasses=classes")
# set nrows, a mild overestimate is ok to help with memory
# 1,500,000 rows x 120 cols x 8 bytes/numeric var
#  = 1440000000 bytes / 2**20 bytes/MB = 1,373.29MB = 1.34 GB
#------- 1.14 Textual Data Formats -----#
# dump or dput to output from R
y <- data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
newy <- dget("y.R")
newy
# dump can be used on multiple objects
x <- "foo"
y <- data.frame(a=1,b="a")
dump(c("x","y"),file="data.R")
rm(x,y)
source("data.R")
y
x
#------- 1.15 Connections to the Outside world -----#
# file, gzfile, bzfile, and url connections can read different types of connnections/files
str(file)
con <- file("foo.txt","r")
data <- read.csv(con)
close(con)
# same as:  data <-read.csv("foo.txt")
con <- gzfile("words.gz")
x <- readLines(con,10)
x
con <- url("http://www.jhsph.edu","r")
x <- readLines(con)
head(x)
#------- 1.16 Subsetting - Basics -----#
# [ always returns object of same class of orig, can select more than one element
# [[ extracts elements of list or data frame, can only extract single element, but class can vary from orig
# $ is used to extract elements of list or data frame by name
x <- c("a","b","c","c","d","a")
x[1]
x[2]
x[1:4]
x[x>"a"]
u <- x > "a"
u
x[u]
#------- 1.17 Subsetting - Lists -----#
x <- list(foo=1:4,bar=0.6,baz="hello")
x[1]
x$bar
x[["bar"]]
x["bar"]
x[c(1,3)]
name <- "foo"
x[[name]]  ## computed index for 'foo'
x$name
x$foo
x <- list(a=list(10,12,14),b=c(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]
#------- 1.18 Subsetting - Matrices -----#
x <- matrix(1:6,2,3)
x[1,2]
x[2,1]
x[1,]
x[,2]
# by default, when a single element of a matrix is retrieved, it is returned as a
# vector of length 1 rather than a 1x1 matrix.  This behavior can be turned off by
# setting drop = FALSE
x[1,2,drop=FALSE]
x[1,]
x[1, ,drop=F]
#------- 1.19 Subsetting - Partial Matching -----#
x <- list(aardvark = 1:5)
x$a    # will select aardvark if only a name
x[["a"]]
x[["a",exact=FALSE]]
#------- 1.20 Subsetting - Removing Missing Values -----#
x <- c(1,2,NA,4,NA,5)
bad <- is.na(x)
x[!bad]
y <- c("a","b",NA,"d","f",NA)
good <- complete.cases(x,y)
good
x[good]
y[good]
airquality[1:6,]
good <- complete.cases(airquality)
airquality[good,][1:6,]
#------- 1.21 Vectorized Operations -----#
x <- 1:4; y <- 6:9
x + y
x > 2
x >= 2
y == 8
x * y
x / y
x <- matrix(1:4,2,2); y<- matrix(rep(10,4),2,2)
x * y    ## element-wise multiplication
x / y
x %*% y  ## true matrix multiplication
#------- 1.22 Intro to Swirl - Stats with Interactive R Learning ---#
# swirlstats.com
