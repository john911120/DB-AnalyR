library(dplyr)
exam <- read.csv("C:/Users/Im Chang Hyeok/Desktop/R_Tutorial/0903/csv_exam.csv")
exam

mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg <- mpg_new

# p.133 혼자해보기
# 1.자동차 배기량이 4이하인 자동차와 5이상인 자동차 중에서 어느 자동차의 연비가 평균적으로 높은지를 나타내시오.
mpg_a <- mpg %>% filter(displ <= 4)
mpg_b <- mpg %>% filter(displ >= 5)

mean(mpg_a$hwy)
mean(mpg_b$hwy)

# 2. audi랑 toyota 중에서 어느 제조회사의 도시연비가 평균적으로 높은지를 나타내시오.

mpg_audi <- mpg %>% filter(manufacturer == "audi")
mpg_toyota <- mpg %>% filter(manufacturer == "toyota")

mean(mpg_audi$cty)

mean(mpg_toyota$cty)

# 3. chevrolet, ford, honda 자동차의 고속도로 연비 평균을 나타내기 위해, 데이터를 추출하고 hwy평균을 구하시오.

mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford","honda"))

mean(mpg_new$hwy)
 
#p.138 혼자해보기

# 1.mpg데이터에서 자동차종류, 도시연비변수를 추출하여 새로운 데이터를 만드시오. 새로 만든 데이터의 일부를 출력하여 두 변수로만 구성되어있는지도 확인하시오.
df <- mpg %>% select(class, cty)
head(df)

# 2. 앞서 추출한 데이터에서 자동차 종류가 suv인 자동차와 compact인 자동차 중에서 어떤 자동차의 도시연비가 더 높은지를 확인하세요.
df_suv <- mpg %>% filter(class == "suv")
df_compact <- mpg %>% filter(class == "compact")

mean(df_suv$cty)
mean(df_compact$cty)

# p.141 혼자해결하기
# 1. audi에서 생산한 자동차 중에서 어떤 자동차 모델의 hwy가 높은가?audi에서 생산한 자동차 중에서 hwy가 1~5위에 해당하는 자동차를 출력하시오.
mpg %>%  filter(manufacturer == "audi") %>%  
  arrange(desc(hwy)) %>% 
  head(5)

# p.144 혼자해결하기
# 1. mpg() 데이터 복사본을 만들고 cty, hwy를 더한 합산 연비 변수를 
추가하시오.
mpg_new <- mpg

mpg_new <- mpg_new %>% mutate(total = cty + hwy)

View(mpg_new)
# 2.합산 연비 변수를 2로 나누어서 평균 연비 변수를 만드시오.
mpg_new <- mpg_new %>% mutate(mean = total/2)

# 3.평균 연비 변수가 가장 높은 자동차 3종을 출력하시오.
mpg_new %>% 
  arrange(desc(mean)) %>% 
  head(3)

# 4. 1~3번의 문제를 한큐에 해결이 가능한 dplyr구문으로 만들어보시오. mpg 원문을 사용하시오.
mpg_new %>%
  mutate(total = cty + hwy,
         mean = total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)

# p.150 혼자해보기
# 1. mpg데이터의 class는 suv, compact등의 자동차를 특징에 따라 7종류로 분류한 변수이다. 어느 차종의 도시연비가 가장 높은지를 비교하려고 한다. class별 cty 평균을 구하시오.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))
# 2. 1번의 출력 결과는 class값은 알파벳 순으로 정렬이 되어있다. 어느 차종의 도시염비가 높은지 쉽게 알아 볼수 있도록 cty평균이 높은 순으로 정렬하여 출력하시오.
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))
# 3. hwy평균이 가장 높은 회사 3곳을 출력 하시오.
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
# 4. 어느 회사에서 compact 차종을 많이 생산하는지를 알아보는가를 알아보려고한다. 각 회사별 compact 차종수를 내림차순으로 정렬하여 출력 하시오.
mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count)) 

# p.157쪽 혼자하기
# 혼자하기에 사용되는 데이터 프레임
  fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                     price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                     stringsAsFactors = F)
  fuel
# 1. mpg 데이터에는 연료 종류를 나타내는 fl 변수는 존재하지만 연료가격을 나타내는 변수가 없다. fuel 데이터를 이용하여 price_fl 변수를 추가하시오.
mpg <- left_join(mpg, fuel, by = "fl")
  
# 2. model, fl, price_fl  변수를 추출하여 앞부분의 5행을 출력하시오.
mpg %>%   
  select(model, fl, price_fl) %>% 
  head(5)


# p.160 분석 도전
# midwest 데이터를 사용, midwest는 ggplot2에 들어있다.
# 1. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타낸다. midwest데이터에서 '전체 인구 대비 미성년 인구 백분율'변수 추가하세요,
midwest <- as.data.frame(ggplot2::midwest)

midwest <- midwest %>% 
  mutate(ratio_child = (poptotal - popadults)/poptotal * 100)
# 2. 미성년 인구 백분율이 높은 상위 5개 country의 백분율을 출력 하세요.
midwest %>% 
  arrange(desc(ratio_child)) %>% 
  select(county, ratio_child) %>% 
  head(5)
# 3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고 각 등급에 몇 개의 지역이 있는지 알아 보시오.
midwest <- midwest %>% 
  mutate(grade = ifelse(ratio_child >= 40, "large",
                        ifelse(ratio_child >=30, "middle", "small")))

table(midwest$grade)
# 4. popasian은 해당지역의 아시아인 인구를 나타낸다. '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고 하위 10개 지역의 state, country, 아시아인 인구 백분율을 출력하시요.
midwest %>% 
  mutate(ratio_asian = (popasian/poptotal)*100) %>%
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>%
  head(10)