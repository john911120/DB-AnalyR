library(readxl)

# 엑셀 파일을 불러온다.
# 노트북 저장 경로 주소
# exdata1 <- read_excel("C:/Users/Im Chang Hyeok/Desktop/Re-R/Data/Sample1.xlsx")
exdata1

# View 함수
View(exdata1)

# str함수
str(exdata1)

# dim함수
dim(exdata1)

# ls함수
ls(exdata1)

# 함수명을 변경하기 위한 dplyr라이브러리를 불러온다.
library(dplyr)

exdata1 <- rename(exdata1, Y17_AMT = AMT17, Y16_AMT = AMT16)


# 파생변수를 만들기
exdata1$AMT <- exdata1$Y17_AMT + exdata1$Y16_AMT
exdata1$CNT <- exdata1$Y17_CNT + exdata1$Y16_CNT

exdata1$AVG_AMT <- exdata1$AMT / exdata1$CNT

# 조건문의 결과에 따라 새로운 변수를 만들기
exdata1$AGE_50YN <- ifelse(exdata1$AGE >= 50, "Y", "N")

exdata1$AGE_GR10 <- ifelse(exdata1$AGE >= 50, "A1.50++",
                           ifelse(exdata1$AGE >= 40, "A2.4049",
                                  ifelse(exdata1$AGE >= 30, "A3.3039",
                                         ifelse(exdata1$AGE >=20, "A4.2029", "A5.0019"))))

# 변수를 추출하는 select
exdata1 %>% select(ID)
exdata1 %>% select(ID, AREA, Y17_CNT)

# 선택한 변수만 제외하고 추출하기(-select)
exdata1 %>% select(-AREA)
exdata1 %>% select(-AREA, -Y17_CNT)

# 조건절을 추출하는 filter
exdata1 %>% filter(AREA == '서울')
exdata1 %>% filter(AREA == '서울' & Y17_CNT >= 10)

# 오름차순 정렬 arrange
exdata1 %>% arrange(AGE)

# 내림차순 정렬 arrange(desc)
exdata1 %>% arrange(desc(AGE))

# 정렬 중첩 적용하기
exdata1 %>% arrange(AGE, desc(Y17_AMT))

# 합계를 도출하는 summarise
exdata1 %>% summarise(T0T_Y17_AMT = sum(Y17_AMT))

# 그룹별 합계를 도출하는 group_by와 summarise
exdata1 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT=sum(Y17_AMT))

# 세로 결합을 위한 bind_rows
# 엑셀 파일을 불러온다.
# 노트북에저장된 파일경로
# m_history <- read_excel("C:/Users/Im Chang Hyeok/Desktop/Re-R/Data/Sample2_m_history.xlsx")
# f_history <- read_excel("C:/Users/Im Chang Hyeok/Desktop/Re-R/Data/Sample3_f_history.xlsx")

View(m_history)
View(f_history)

# 세로 결합
exdata_bindjoin <- bind_rows(m_history, f_history)
View(exdata_bindjoin)

# 가로 결합을 위한 left_join, inner_join, full_join
# 엑셀 파일을 불러온다.
# 노트북에저장된 파일경로
# jeju_y17_history <- read_excel("C:/Users/Im Chang Hyeok/Desktop/Re-R/Data/Sample4_y17_history.xlsx")
# jeju_y16_history <- read_excel("C:/Users/Im Chang Hyeok/Desktop/Re-R/Data/Sample5_y16_history.xlsx")

View(jeju_y17_history)
View(jeju_y16_history)

bind_col <- left_join(jeju_y17_history, jeju_y16_history, by = "ID")
bind_col_inner <- inner_join(jeju_y17_history, jeju_y16_history, by = "ID")
bind_col_full <- full_join(jeju_y17_history, jeju_y16_history, by = "ID")

View(bind_col)
View(bind_col_inner)
View(bind_col_full)

# 결측값 예제
x1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 100)
x1
mean(x1)
median(x1)

x2 <- c(2, 4, 6, 8, 10)
x2
median(x2)
max(x2)
min(x2)
range(x2)

quantile(x2)
quantile(x2, probs = 0.25)
quantile(x2, probs = 0.5)
quantile(x2, probs = 0.75)
quantile(x2, probs = 0.8)
quantile(x2, probs = 1)

# psych 라이브러리
install.packages("psych")
library(psych)

var(x2)
sd(x2)
kurtosi(x2)
skew(x2)


# 빈도 분석하기
exdata1
install.packages("descr")
library(descr)

freq_test <- freq(exdata1$AREA, plot = T)
freq_test <- freq(exdata1$AREA)
freq_test

# 데이터 전체 형태를 파악하는 줄기와 잎 그림림
stem(exdata1$AGE)

# hist함수
hist(exdata1$AGE, xlim = c(0, 60), ylim = c(0, 5), main = "AGE분포")

# 수량의 많고 작음을 확인하는 막대그래프
# freq함수
freq(exdata1$SEX, plot = T, main = '성별(barplot)')

# barplot함수
dist_sex <- table(exdata1$SEX)
dist_sex
barplot(dist_sex)

# y축을 변경
barplot(dist_sex, ylim = c(0, 8))

# y축을 변경하고 그래프 명칭과 x축 제목을 변경하고 그래프 색상 넣기
barplot(dist_sex, ylim = c(0, 8), main = "BARPLOT", xlab = "SEX", ylab = "FREQUENCY", names = c("Female", "Male"), col = c("pink", "navy"))


# 분포 또는 이상치를 확인하는 상자그림
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT)

# y축을 변경하고 그래프 명칭 추가와 항목값 변경하고 색상을 넣는다.
boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, ylim = c(0, 60), main = 'boxplot', names = c("17년 건수", "16년 건수"), col = c("green", "yellow"))