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
# lm exists in the stats package, but can be redefined
lm <- function(x) {x*x}
lm
# Binding - searches through a series of packages in Environment, chooses the 
search()  # global environment is always first and base package is always last, new packages are added after Global
# R has separate namespaces for functions and non-functions, so it is possible to have an object named c and a function named c
# Scoping Rules:
# R uses lexical scoping or static scoping (not dynamic scoping)
f <- function(x,y) {
  x^2 + y / z   # z is free-variable, which was not previously mentioned in function
}
# the values of free vars are searched for in the env in which the function was defined
#  where an environment is a collection of (symbol,value) pairs
# every environment has a parent environment, it is posible to have multiple children
# a function + an environment = a closure or function closure
# if not in env where function was defined, searches in 1) parent env 2) search down the parent envs
# until hitting top-level env (usually global, or package namespace) 3) continue search until empty env, error is thrown if not found
#------- 2.10 Scoping Rules - R Scoping Rules ---#
# Key diff in R is that you can define functions inside other functions
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
cube <- make.power(3)
square <- make.power(2)
cube(3)
cube(2)
square(3)
ls(environment(cube))
get("n",environment(cube))
ls(environment(square))
get("n",environment(square))
y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x*y
}
f(3)
g <- function(x) {
  a <-3
  x+a+y
}
g(2)
y <- 3
g(2)
# Consequences of Lexical Scoping: 1) In R all objects are stored in memory
# 2) all functions must carry a pointer to their respective environments, which can be anywhere
#------- 2.11 Scoping Rules - Optimization Example ---#
make.NegLogLik <- function(data, fixed=c(FALSE,FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5*length(data)*log(2*pi*sigma^2)
    b <- -0.5*sum((data-mu)^2) / (sigma^2)
    -(a + b)
  }
}
set.seed(1)
normals <- rnorm(100,1,2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))
optim(c(mu=0,sigma=1),nLL)$par
# fixing sigma = 2
nLL <- make.NegLogLik(normals,c(FALSE,2))
optimize(nLL,c(-1,3))$minimum
# fixing mu = 1
nLL <- make.NegLogLik(normals,c(1,FALSE))
optimize(nLL,c(1e-6,10))$minimum
# Plotting the Likelihood
nLL <- make.NegLogLik(normals,c(1,FALSE))
x <- seq(1.7,1.9,len=100)
y <- sapply(x,nLL)
plot(x,exp(-(y-min(y))),type="l")
nLL <- make.NegLogLik(normals,c(FALSE,2))
x <- seq(0.5,1.5,len=100)
y <- sapply(x,nLL)
plot(x,exp(-(y-min(y))),type="l")
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

#===== Week 3 ===========#
#------- 3.1 Loop Functions - lapply ---#
# lapply: Loop over a list and evaluate a function on each element
lapply
# lapply always returns a list
x <- list(a=1:5, b=rnorm(10))
lapply(x,mean)
x <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(x,mean)
x <- 1:4
# runif generates a number of random uniform vars
lapply(x,runif)
lapply(x, runif, min=0,max=10)  # passes min and max elements through ... in lapply
# annonymous functions
x <- list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
x
lapply(x,function(elt) elt[,1])  # function to capture first column of matrices
# sapply: Same as lapply but try to simplify result
# if result is list where every element is length 1, then a vector is returned
# if result is list where every element is vector of same length (>1), a matrix is returned
# a list is returned if sapply can't establish a pattern
x <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(x,mean)
sapply(x,mean)
mean(x)    # calling mean on list does not apply, so returns NA with warning
#------- 3.2 Loop Functions - apply ---#
# apply: Apply a function over the margins of an array
# usually annonymous function, usually applied to rows or columns of matrix
# can be used with general arrays - not really faster than loop, but easier to type
str(apply)   # function (X, MARGIN, FUN, ...)
# X is an array, MARGIN is int vector indicating which margins should be retained
# FUN is function to be applied
x <- matrix(rnorm(200),20,10)   # 20 rows, 10 columns
apply(x,2,mean)    # takes mean of columns (2nd dimension)
apply(x,1,mean)    # takes mean of rows (1st dimension)
# col/row sums and means - optimized (much faster) functions for calculations:
# rowSums = apply(x,1,sum)    rowMeans = apply(x,1,mean)
# colSums = apply(x,2,sum)    colMeans = apply(x,2,mean)
apply(x,1,quantile,probs=c(0.25,0.75))  # calc 25th and 75# for all 20 rows
a <- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)
rowMeans(a,dims=2)
#------- 3.3 Loop Functions - mapply ---#
# mapply: Multivariate version of lapply
str(mapply)
#function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
#MoreArgs is a list of other arguments to FUN
#SIMPLIFY indicates whether the result should be simplified
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1)    # does same thing as line before
noise <- function(n,mean,sd) {rnorm(n,mean,sd)}
noise(5,1,2)
noise(1:5,1:5,2)   # does not do what I want with these vectors
mapply(noise,1:5,1:5,2)
list(noise(1,1,2),noise(2,2,2),noise(3,3,2),noise(4,4,2),noise(5,5,2))  # same as last line
#------- 3.4 Loop Functions - tapply ---#
# tapply: Apply a function over subsets of a vector
str(tapply)
#function (X, INDEX, FUN = NULL, ..., simplify = TRUE)
#INDEX is a factor or list of factors
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
f
tapply(x,f,mean)
tapply(x,f,mean,simplify=FALSE)
tapply(x,f,range)
#------- 3.5 Loop Functions - split ---#
# split: auxiliary function also useful, particularly with lapply
str(split)
# function (x, f, drop = FALSE, ...)
# x is a vector (or list) or data frame
# f is a factor (or coerced to one) or a list of factors
# drop indicates whether empty factor levels should be dropped
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
split(x,f)
lapply(split(x,f),mean)   # exact same as tapply example above
library(datasets)
head(airquality)
s <- split(airquality,airquality$Month)  # splits data frame by month
lapply(s,function(x) colMeans(x[, c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[, c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[, c("Ozone","Solar.R","Wind")],na.rm=TRUE))
# splitting on more than one level
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
f1
f2
interaction(f1,f2)
str(split(x,list(f1,f2)))    # will automatically call interaction function
str(split(x,list(f1,f2),drop=TRUE))
#------- 3.6 Debugging Tools - Diagnosing the Problem ---#
log(-1)  # Warning
printmessage <- function(x) {
    if(x > 0)
        print("x is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)
}
printmessage(1)
printmessage(NA)   # Error
printmessage2 <- function(x) {
    if(is.na(x))
        print("x is a missing value!")
    else if(x > 0)
        print("x is greater than zero")
    else
        print("x is less than or equal to zero")
    invisible(x)
}
x <- log(-1)
printmessage2(x)
#------- 3.7 Debugging Tools - Basic Tools ---#
# traceback - prints function call stack after error occurs, nothing if no error
# recover - allows modification of error behavior to browse the function call stack
# debug - flags function for debug mode, allowing step through execution 1 line/time
# browser - suspends execution of function and puts function in debug
# trace allows insertion of debugging code into function in specific places
#------- 3.8 Debugging Tools - Using the Tools ---#
mean(x)
traceback()
lm(y-x)
traceback()
debug(lm)
lm(y-x)  # hit n for next until you get to error line
options(error = recover)
read.csv("nosuchfile")

#===== Week 4 ===========#
