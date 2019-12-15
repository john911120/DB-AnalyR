library(dplyr)
exam <- read.csv("C:/Users/winpc/Desktop/0830/0903/csv_exam.csv")
exam

exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class == 3)
exam %>% filter(class == 4)
exam %>% filter(class == 5)
exam %>% filter(class != 1)
exam %>% filter(class != 2)
exam %>% filter(class != 3)

#초과, 미만, 이상, 이하 조건 걸기
exam %>% filter(math > 50)
exam %>% filter(math < 50)

#여러 조건을 충족하는 행을 추출하기
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

#여러 조건 중 하나 이상 충족하는 행 추출하기
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english <= 90 | math < 50)

#목록에 해당하는 행을 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))


#추출한 행으로 데이터를 만들기
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)

mean(class1$math)
mean(class1$science)
mean(class2$math)
mean(class2$science)

View(class1)

#변수 추출하기
exam %>% select(math)

exam %>% select(english)

exam %>% select(class, english, math)

exam %>% select(-math)

exam %>% select(-math, -english)

#dplyr 함수 조합하기
exam %>% filter(class == 1) %>% select(english)

#dplyr 라이브러리를 실행을 시켜야 인식이 가능하다.
library(dplyr)
exam %>% 
  filter(class == 1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head

exam %>% 
  select(id, math) %>% 
  head(10)

#오름차순, 내림차순으로 정렬하기
exam %>% arrange(math)
exam %>% arrange(desc(math))

exam %>% arrange(class, math)

#파생변수 추가
exam %>% 
  mutate(total = math + english + science) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>% 
  head

exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fall")) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

#집단별로 요약하기
exam %>% summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())

#dplyr 조합하기
mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

# 데이터 가로로 합치기
test1 = data.frame(id = c(1, 2, 3, 4, 5),
                   midterm = c(60, 80, 70, 90, 80))

test2 = data.frame(id = c(1, 2, 3, 4, 5),
                   final = c(70, 60, 77, 65, 85))
test1
View(test1)
test2
View(test2)

total <- left_join(test1, test2, by = "id")
total

# 다른 데이터를 활용하여 변수 추가시키기
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "park", "choi", "bae", "jin"))
name

exam_new <- left_join(exam, name, by = "class")
exam_new


#데이터를 세로로 합치기
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(50, 70, 80, 60, 55))
group_a

group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 80, 55, 65, 40))
group_b

group_all <- bind_rows(group_a, group_b)
group_all
