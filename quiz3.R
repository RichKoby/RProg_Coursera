#------- R Programming - week 3 quiz ------
# question 1
library(datasets)
data(iris)
?iris
v <- subset(iris,iris$Species=="virginica")
mean(v$Sepal.Length,na.rm=TRUE)
# question 2
apply(iris, 1, mean)
apply(iris[, 1:4], 1, mean)
apply(iris[, 1:4], 2, mean)  # correct answer
colMeans(iris)
# question 3
data(mtcars)
?mtcars
tapply(mtcars$mpg, mtcars$cyl, mean)  # correct answer
tapply(mtcars$cyl, mtcars$mpg, mean)
#question 4
x = tapply(mtcars$hp, mtcars$cyl, mean)
names(x)
abs(x[["8"]]-x[["4"]])  # 8 and 4 are the labels on the vector
print(x[1])
str(x)
# question 5
debug(ls)
?ls
