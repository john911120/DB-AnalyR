a <- 1
a

b <- 2
b

c <- 3
c

d <- 3.5
d

a+b
a+b+c
a-b+c
4/b
2*b

var1 <- c(1, 3, 5, 7, 9)
var1

var2 <- c(1:5)
var2

var3 <- seq(1, 10)
var3

var4 <- seq(1, 10, by = 2)
var4

var5 <- seq(1, 10, by = 3)
var5

var1 + var2

str1 <- "app"
str1

str2 <- "le"
str2

str1+str2

paste(str1, str2)

str3 <- c("a", "c", "D")
str3

str4 <- c("Hello", "R World")
str4


x <- c(1, 2, 3, 4)
x

mean(x)
max(x)
min(x)

paste(str3, collapse = " ")

x_mean <- mean(x)
x_mean

install.packages("ggplot2")

library(ggplot2)

x <- c("a", "c", "b", "d", "f")
x

qplot(x)

qplot(data = mpg, x = hwy)

qplot(data = mpg, x = cty)

qplot(data = mpg, x = drv, y = hwy)

qplot(data = mpg, x = drv, y = hwy, geom="line")

qplot(data = mpg, x = drv, y = hwy, geom="boxplot")

qplot(data = mpg, x = drv, y = hwy, geom="boxplot", colour = drv)

?qplot
