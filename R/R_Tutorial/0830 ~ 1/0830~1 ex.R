english <- c(70, 75, 80, 85, 90)
english

math <- c(50, 55, 50, 55, 50)
math

df_midterm <- data.frame(english, math)
df_midterm


class <- c(1, 2, 3, 4, 5)
class

df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english = c(70, 75, 80, 85, 90),
                         math = c(50, 55, 50, 55, 50),
                         class = c(1, 2, 3, 4, 5))
df_midterm


# 04-01 ~ 02 practice question

product <- c("apple", "strawberry", "watermelon")
product

price <- c(1800, 1500, 3000)
price

sell <- c(24, 38, 13)
sell

df_midterm <- data.frame(product = c("apple", "strawberry", "watermelon"),
                         price = c(1800, 1500, 3000),
                         sell = c(24, 38, 13))
df_midterm

mean(df_midterm$price)
mean(df_midterm$sell)


install.packages("readxl")
library(readxl)

df_exam <- read_excel("C:/Users/winpc/Desktop/0830/excel_exam.xlsx")
df_exam

mean(df_exam$english)

mean(df_exam$science)

df_exam_novar <- read_excel("C:/Users/winpc/Desktop/0830/excel_exam_novar.xlsx", col_names = F)
df_exam_novar

df_csv_exam <- read.csv("C:/Users/winpc/Desktop/0830/csv_exam.csv", stringsAsFactors = F)
df_csv_exam

df_midterm <- data.frame(english = c(70, 60, 85, 90, 55),
                         math = c(60, 50, 68, 70, 75),
                         korean = c(80, 85, 80, 75, 70),
                         japanese = c(70, 60, 65, 90, 100),
                         science = c(50, 60, 65, 50, 40),
                         class = c(2, 2, 3, 4, 4))
df_midterm

write.csv(df_midterm, file="C:/Users/winpc/Desktop/0830/df_midterm.csv")

save(df_midterm, file = "C:/Users/winpc/Desktop/0830/df_midterm.rda")

load("C:/Users/winpc/Desktop/0830/df_midterm.rda")

df_midterm
