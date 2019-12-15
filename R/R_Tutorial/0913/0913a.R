#단계 구분도 만들기 
#패키지 설치 및 로드 작업
install.packages("ggiraphExtra")
library(ggiraphExtra)

#미국 주별 범죄 데이터 준비하기
str(USArrests)
head(USArrests)

library(tibble)
crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state)

str(crime)

#미국 주 지도 데이터 준비하기
#지도 데이터 라이브러리 및 패키지 설치
library(ggplot2)
install.packages("maps")
library(maps)
install.packages("mapproj")
library(mapproj)

states_map <- map_data("state")
str(states_map)

ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map)

#인터렉티브 단계 구분도 만들기
ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map,
             interactive = T)


# 한국 시도별 인구, 결핵 환자 수 단계 구분도를 만들기
#패키지 준비 및 데이터 준비하기
install.packages("stringi")

install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)
library(dplyr)

#대한민국 시도별 인구 데이터 준비하기
str(changeCode(kormap1))
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

#대한민국 시도 지도 데이터 준비하기
str(changeCode(kormap1))

#단계 구분도 만들기
ggChoropleth(data = korpop1,
             aes(fill = pop,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)

#대한민구 시도별 결핵 환자 수 단계 구분도 만들기
str(changeCode(tbc))

ggChoropleth(data = tbc,
             aes(fill = NewPts,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)
