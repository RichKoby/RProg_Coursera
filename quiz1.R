setwd("~/Rich-A/Coursera_RProg")
getwd()
hw_data <- read.csv("hw1_data.csv")
hw_data[1:2,]
str(hw_data)
hw_data[152:153,]
hw_data$ozone[47,]
hw_data[47,]
is.na(hw_data$Ozone)
summary(hw_data$Ozone)
ozone <- hw_data$Ozone
mean(ozone[!is.na(ozone)])
x <- hw_data[hw_data$Ozone>31 & hw_data$Temp > 90,]
mean(x$Solar.R)
summary(x$Solar.R)
mean(hw_data$Temp[hw_data$Month==6])
x <- hw_data$Ozone[hw_data$Month==5]
summary(x)
