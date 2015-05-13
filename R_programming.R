#------- Coursera - R Programming -------#
#--- Background Material 0.4 - Writing Code / Setting Your Working Directory (Windows) -------#
getwd()
dir()
ls()
setwd("/home/a737366/coursera")
dir()

#----- these 2 functions saved as mycode.R ----#
myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

second <- function(x) {
  x + rnorm(length(x))
}

myfunction()

source("mycode.R")
ls ()
second(4)

#===== Week 1 ===========#
#--------------- 1_3 R Console Input and Evaluation ------------#
x <- 1
print(x)  # explicit printing
x         # auto-printing
msg <- "hello"
x <- ## Incomplete expression
x <- 1:20
x
#--------------- 1_4 Data Types - R Objects and Attributes ------------#
#Objects:  atomic: character, numeric, integer, complex, logical (T/F)  basic: vectors (1 atomic class) or lists
# empty vectors may be created with vector()
#Numbers:  are numeric, unless explicitly defined as integer (1L, 10L);  Inf is infinity;  NaN is not a number
#Attributes:  are part of objects such as:  names, dimnames, dimensions (matrices, arrays), class, length, other user-def attribs, access with attributes()
#--------------- 1_5 Data Types - Vectors and Lists ------------#
x <- c(0.5, 0.6)
x <- c(TRUE, FALSE)
x <- c(T,F)
x <- c("a","b","c")
x <- 9:29
x <- c(1+0i,2+4i)
x <- vector("numeric",length=10)
x
# concatting different types
y <- c(1.7,"a")  ## character is least common denom
y <- c(TRUE, 2)  ## numeric
y <- c("a",TRUE) ## character
# coercion
x <- 0:6
class(x)
as.numeric(x)   # looks like integer, but actually is numeric
as.logical(x)
as.character(x)
x <- c("a","b","c")
as.numeric(x)
as.logical(x)
as.complex(x)
# lists
x <- list(1,"a",TRUE,1 + 4i)
x
#--------------- 1_6 Data Types - Matrices ------------#
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)
m <- matrix(1:6, nrow=2,ncol=3)
m
m <- 1:10
dim(m) <- c(2,5)
m
# column binding and row binding
x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)
#--------------- 1_7 Data Types - Factors ------------#
# factors are unordered or ordered, treated specially by modeling functions like lm() and glm()
x <- factor(c("yes","yes","no","yes","no"))
x
table(x)    # frequency count on each level
unclass(x)
x <- factor(c("yes","yes","no","yes","no"), levels = c("yes","no"))
x
unclass(x)

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

#===== Week 2 ===========#
#------- 2.2 Control Structures - If-Else ---#
x <- 4
if(x > 3) {
  y <- 10
} else {
  y <- 0
}
y <- if(x > 3) {
  10
} else {
  0
}
#------- 2.3 Control Structures - For Loops ---#
for(i in 1:10) {
  print(i)
}
x <- c("a","b","c","d")
for(i in 1:4) {
  print(x[i])
}
for(i in seq_along(x)) {
  print(x[i])
}
for(letter in x) {
  print(letter)
}
for(i in 1:4) print(x[i])
# Nested for loops
x <- matrix(1:6, 2, 3)
x
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print (x[i,j])
  }
}
#------- 2.4 Control Structures - While Loops ---#
count <- 0
while(count < 10){
  print(count)
  count <- count + 1
}
z <- 5
while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1,1,0.5)
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}
#------- 2.5 Control Structures - Repeat, Next, Break ---#
# repeat
x0 <- 1
tol <- 1e - 8
repeat {
  x1 <- computeEstimate()
  if(abs(x1-x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}
# next, return
for(i in 1:100) {
  if(i <= 20) {
    ## skip the first 20 iterations
    next
  }
  ## do something here
}
# return signals that a function should exit and return a given value
#------- 2.6 Your First R Function ---#
add2 <- function(x,y) {
  x + y
}
add2 (5,8)
above10 <- function(x){
  use <- x > 10
  x[use]
}
above <- function(x, n=10){
  use <- x > n
  x[use]
}
x <- 1:20
above(x)

columnmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}
columnmean(airquality)
columnmean(airquality,FALSE)
#------- 2.7 Functions - Part 1 ---#
# functions can be nested within functions or passed as args to other functions
# function args can be positional or by name
mydata <- rnorm(100)
sd(mydata)
sd(x=mydata)
sd(x=mydata,na.rm=FALSE)
sd(na.rm=F,x=mydata)
sd(na.rm=F,mydata)  # not recommended
# arguments can be partially matched
#------- 2.8 Functions - Part 2 ---#
# NULL is a common argument that can be assigned
# Lazy evaluation - only evaluated if needed
f <- function(a,b) {
  a^2
}
f(2)
f <- function(a,b) {
  print(a)
  print(b)
}
f(45)   # 45 is printed, then error message
# the ... Argument
myplot <- funtion(x,y,type="l",...) {
  plot(x,y,type=type,...)
}
# Generic functions use ... so that extra arguments can be passed as methods
mean
function (x,...)
UseMethod("mean")
# ... is necessary when number of args is not known in advance
args(paste)
function (...,sep=" ", collapse=NULL)
args(cat)
function (...,file="",sep=" ",fill=FALSE,labels=NULL,append=FALSE)
# any args appearing after ... on arg list must be named explicitly and cannot be partially matched
#------- 2.9 Scoping Rules - Symbol Binding ---#
#------- 2.10 Scoping Rules - R Scoping Rules ---#
#------- 2.11 Scoping Rules - Optimization Example ---#
#------- 2.12 Coding Standards ---#
#1. Always write code in text file/text editor
#2. Indent your code (4+ spaces)
#3. Limit width of code (80 columns?)
#4. Limit the length of your functions
#------- 2.13 Dates and Times ---#
# Date Class, Times represented by POSIXct or POSIXlt class
# dates are # of days since 1970-01-01, Times are # seconds since 1970-01-01
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))
# POSIXct is a large integer
# POSIXlt is a list and stores a bunch of otehr info like day of week, day of year, month, day of month
# functions that work on dates:  weekdays, months quarters
x <- Sys.time()
x
p <- as.POSIXlt(x)
names(unclass(p))
p$sec
p <- as.POSIXct(x)
p   # so this was already in POSIXct format
unclass(p)
p$sec
p <- as.POSIXlt(x)
p$sec
# strptime function to convert formated date/times to time object
datestring <- c("January 10, 2012 10:40","December 9, 2011 9:10")
x <- strptime(datestring,"%B %d, %Y %H:%M")
x
class(x)
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x - y
x <- as.POSIXlt(x)
x - y
# keeping track of leap years, etc
x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x - y
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz="GMT")
x - y
