exam <- read.csv("C:/Users/winpc/Desktop/0830/0902/csv_exam.csv")
head(exam)
head(exam, 15)
tail(exam)
tail(exam, 15)
View(exam)
dim(exam)
str(exam)
summary(exam)

install.packages("ggplot2")
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)
tail(mpg)

View(mpg)

dim(mpg)

str(mpg)

?mpg

summary(mpg)



df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 4))
df_raw
View(df_raw)

install.packages("dplyr")

library(dplyr)

df_new <- df_raw
df_new

View(df_new)

df_new <- rename(df_new, v2 = var2)
df_new

df_raw

df_new

df <- data.frame(var1 = c(12, 24, 36),
                     var2 = c(10, 20, 30))
df

df$var_sum <- df$var1 + df$var2
df

df$var_sum <- df$var1 + df$var2/2
df

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

mean(mpg$total)

summary(mpg$total)

hist(mpg$total)

ifelse(mpg$total >= 20, "pass", "fall")
mpg$test <- ifelse(mpg$total >= 20, "pass", "fall")

head(mpg, 20)

table(mpg$test)

qplot(mpg$test)

mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "c"))
head(mpg, 20)


table(mpg$grade)
qplot(mpg$grade)

mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 25, "B",
                           ifelse(mpg$total >= 20, "c", "D")))
