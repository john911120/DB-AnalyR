#112page practice

#1. ggplot2()패키지의 mpg데이터를 사용가능할수 있게 불러온 다음 복사본 만들기
#2. 복사본 데이터를 이용해서 cty는 city, hwy는 highway로 수정
#3. 변수명이 바뀌었는지 확인을 하시오.

#1.
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg

View(mpg)
View(mpg_new)

#2.

library(dplyr)

mpg_new <- rename(mpg_new, city = cty)
mpg_new <- rename(mpg_new, highway = hwy)

#3.
head(mpg_new)


# 123page try
#1. ggplot2의 midwest 데이터를 데이터프레임형태로 불러온 다음 특징을 파악하시오.

library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)

View(midwest)

#2. poptotal -> total // popasian -> asian으로 수정하세요.
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)

#3. total.asian변수로 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고 히스토그램을 만드세요.
midwest$ratio <- midwest$asian/midwest$total*100
hist(midwest$ratio)

#4. 아시아 인구 백분율 전체 평균을 구하고 평균 초과이면 'large', 그 외는 'small'로 표시하세요.

mean(midwest$ratio)
midwest$group <- ifelse(midwest$ratio > 0.4872462, "large", "small")

#5. 'large' ,'small'에 해당하는 지역이 얼마나 되는지 빈도표랑 막대 그래프로 표시하세요.

table(midwest$group)

qplot(midwest$group)
