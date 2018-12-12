<<<<<<< HEAD
dd = read.csv("Data.csv")
dd$Age = ifelse(is.na(dd$Age),ave(dd$Age,FUN=function(x) mean(x,na.rm = TRUE)),
                dd$Age)
dd$Salary = ifelse(is.na(dd$Salary),ave(dd$Salary, FUN = function(x) mean(x,na.rm = TRUE)),dd$Salary)
#16
dd$Country = factor(dd$Country,
                    levels = c('France','Spain','Germany'),
                    labels = c(1,2,3))
dd$Purshased = factor(dd$Purchased,
                      levels = c('Yes','No'),
                      labels = c(1,0))
=======
dd = read.csv("Data.csv")
dd$Age = ifelse(is.na(dd$Age),ave(dd$Age,FUN=function(x) mean(x,na.rm = TRUE)),
                dd$Age)
dd$Salary = ifelse(is.na(dd$Salary),ave(dd$Salary, FUN = function(x) mean(x,na.rm = TRUE)),dd$Salary)
>>>>>>> e8441a1131d3495fd3b78c46edb66da8fc15841a
