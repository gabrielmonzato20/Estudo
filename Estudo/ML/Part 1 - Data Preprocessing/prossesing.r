data = read.csv("Data.csv")
#missing data
data$Age = ifelse(is.na(data$Age),
                  ave(data$Age,FUN  = function(x) mean(x,na.rm=TRUE)),data$Age)


data$Salary = ifelse(is.na(data$Salary),ave(data$Salary,FUN= function(g) mean(g,na.rm=TRUE)),data$Salary)
#encodin data binary country or no see the dataset
data$Country =factor(data$Country,levels = c('France',"Spain","Germany"),labels=c(1,2,3))
data$Purchased = factor(data$Purchased,levels=c("Yes","No"),labels = c(0,1))
#split data
#install libray
#install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(data$Purchased, SplitRatio = 0.8)
train = subset(data,split ==TRUE)
test = subset(data,split == FALSE)