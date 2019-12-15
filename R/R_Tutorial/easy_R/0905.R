library(dplyr)
exam <- read.csv("C:/Users/Im Chang Hyeok/Desktop/R_Tutorial/0903/csv_exam.csv")
exam

mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg <- mpg_new

df <- data.frame(sex = c("M", "F", NA, 'F', "M"),
                 score = c(3, 5, 4, 2, NA))
df

is.na(df)

table(is.na(df))

table(is.na(df$sex))

table(is.na(df$score))

mean(df$score)

sum(df$score)

df %>% filter(is.na(score))

df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)

sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

mean(df$score, na.rm = T)

sum(df$score, na.rm = T)

exam[c(3, 8, 15), "math"] <- NA
exam

exam %>% summarise(mean_math = mean(math))

exam %>% summarise(mean_math = mean(math, na.rm = T))

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),                                                median_math = median(math, na.rm = T))

mean(exam$math, na.rm = T)

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

exam

mean(exam$math)

outlier <- data.frame(sex = c(1, 2, 1, 2, 2, 1),
                      score = c(5, 5, 4, 2, 3, 6))
outlier

table(outlier$sex)

table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 2, NA, outlier$sex)
outlier


outlier$score <- ifelse(outlier$score == 6, NA, outlier$score)
outlier

outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))

boxplot(mpg$hwy)

boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))


library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy))
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + xlim(3, 6) + ylim(10, 30)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
df_mpg
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + xlim(3, 6) + ylim(10, 30)