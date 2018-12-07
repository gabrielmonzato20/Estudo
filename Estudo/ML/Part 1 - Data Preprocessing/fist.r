dd = read.csv("Data.csv")
dd$Age = ifelse(is.na(dd$Age),ave(dd$Age,FUN=function(x) mean(x,na.rm = TRUE)),
                dd$Age)
dd$Salary = ifelse(is.na(dd$Salary),ave(dd$Salary, FUN = function(x) mean(x,na.rm = TRUE)),dd$Salary)