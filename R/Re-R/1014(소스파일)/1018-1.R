# 실습 데이터 확인하기
nrow(mtcars)
str(mtcars)

# dplyr 패키지 불러오기
library(dplyr)

# filter함수로 추출하기
filter(mtcars, cyl == 4)

filter(mtcars, cyl >= 6 & mpg > 20)

# arrange함수로 정렬하기
head(arrange(mtcars, wt))

# arrange(데이터셑, 정렬한 열1). desc(정렬할 열2))
head(arrange(mtcars, mpg, desc(wt)))

# select함수로 변수 선택하기
head(select(mtcars, am, gear))

# mutate함수로 열을 추가하기
head(mutate(mtcars, years="1974"))

head(mutate(mtcars, mpg_rank = rank(mpg)))

# distinct함수로 중복 값을 제거한다.
distinct(mtcars, cyl)
distinct(mtcars, gear)
distinct(mtcars, cyl, gear)


# summarise함수로 데이터 요약하기
summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))

summarise(mtcars, mean(cyl), min(cyl), max(cyl))

# 그룹별로 요약하기 group_by(데이터, 묶을 열)
gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n_distinct(gear))

# 데이터에서 샘플을 추출하기 sample_n, sample_frac
sample_n(mtcars, 10)

sample_frac(mtcars, 0.2)

# %>% 연산자
group_by(mtcars, cyl) %>% summarise(n())

# %>% 를 사용하지 않은 코드
mp_rank <- mutate(mtcars, mpg_rank = rank(mpg))
arrange(mp_rank, mpg_rank)

# %>% 를 사용한 코드
mutate(mtcars, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)
