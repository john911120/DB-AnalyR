library(readxl)
library(dplyr)
library(reshape2)

# 1학년 중간고사 파일을 middle_exam_test으로 변수 저장하고 확인하기
middle_test_exam <- read_excel("C:/Users/Im Chang Hyeok/Desktop/Re-R/Data/middle_mid_exam.xlsx")
View(middle_test_exam)

# dcast함수를 사용하여서 반별 수학 점수와 영어 점수를 나타내기
MATHEMATICS <- middle_test_exam %>% select(CLASS, ID, MATHEMATICS)
MATHEMATICS <- dcast(MATHEMATICS, ID ~ CLASS)

ENGLISH <- middle_test_exam %>%  select(CLASS, ID, ENGLISH)
ENGLISH <- dcast(ENGLISH, ID ~ CLASS)

View(MATHEMATICS)
View(ENGLISH)

# middle_test_exam을 활용하여 반별 영어 점수의 평균과 합계, 반별 수학 점수의 평균과 합계를 구하시오.
middle_test_exam %>% group_by(CLASS) %>% summarise(ENG_MEAN = mean(ENGLISH), ENG_SUM = sum(ENGLISH))

middle_test_exam %>% group_by(CLASS) %>% summarise(MATH_MEAN = mean(MATHEMATICS), MATH_SUM = sum(MATHEMATICS))

# MATHEMATICS 데이터 세트를 활용하여서 수학 점수가 80점 이상인 1반의 학생수를 구하시오
filter(MATHEMATICS, class1 >= 80) %>%  summarise(n())

# middle_test_exam을 활용하여서 수학 점수는 내림차순으로 정렬하고 영어점수는 오름차순으로 정렬하기
arrange(middle_test_exam, desc(MATHEMATICS), ENGLISH)

# middle_test_exam을 활용하여 수학점수가 80점 이상이고 영어 점수가 85점 이상인 학생수를 구하시오.

middle_test_exam %>% filter(MATHEMATICS >= 80 & ENGLISH <= 85) %>%  summarise(n())
