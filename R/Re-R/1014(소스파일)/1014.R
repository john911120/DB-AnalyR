# 숫자형 벡터
ex_vector1 <- c(-1, 0, 1)
ex_vector1

ex_vector <- c(1, 2, 3, 4, 5)
ex_vector

ex_vector_A <- c(6, 7, 8, 9, 10)
ex_vector_A

str(ex_vector)
length(ex_vector_A)

# 문자형 벡터
ex_vector_A1 <- c("Hello", "Vector")
ex_vector_A1
ex_vector_A2 <- c("1", "2", "3")
ex_vector_A2

str(ex_vector_A1)
str(ex_vector_A2)

# 논리형 벡터
ex_vector_B <- c(TRUE, TRUE, FALSE, FALSE)
ex_vector_B

str(ex_vector_B)

# 데이터 세트 삭제
remove(ex_vector_A2)
rm(ex_vector_A1)

# 행렬 만들기
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
matrix(x, nrow=3, ncol=3)
matrix(x, nrow=3, ncol=6)

matrix(x, nrow=3, ncol=3, byrow=T)

# 배열 생성하기
y <- c(10, 11, 12, 13, 14, 15, 16, 17, 18, 19)
array(y, dim = c(2, 2, 3))
array(y, dim = c(3, 3, 2))


# 리스트 생성하기
list1 <- list(c(701, 708, 741), "Hello list")
list1

# 은평구 서울시내버스(연신내 지역) 데이터프레임 만들기
버스번호 <- c(701, 704, 705, 708, 741, 761, 773, 774)
노선 <- c("S", "OS", "S", "S", "S", "S", "OS", "OS")
출발지 <- c("진관동", "양주시", "진관동", "진관동", "진관동", "진관동", "파주 교하", "문산 선유리")
도착지 <- c("을지로2가", "서울역/광화문","남대문시장","서울역/경복궁","세곡동", "영등포역","녹번역","불광역")

dataframe_ex <- data.frame(버스번호, 노선, 출발지, 도착지)
dataframe_ex

str(dataframe_ex)

# 은평구를 지나가는 경기도시내버스 데이터프레임 만들기
시내버스 <- c(17, 30, 34, 55, 360, 567, 790, 799, 9710)
노선 <- c("G", "G", "G", "G", "G", "G", "G", "G", "G")
출발지 <- c("서영대학교", "적성", "의정부", "일산", "의정부", "금촌" ,"고양동", "금촌", "문산읍")
회차지 <- c("불광역", "불광역", "불광역", "불광역","불광역", "신촌역국철", "광화문", "광화문", "서울역")

dataframe_ex1 <- data.frame(시내버스, 노선, 출발지, 회차지)
dataframe_ex1

# view함수로 데이터를 확인하기
View(dataframe_ex)
View(dataframe_ex1)


# 예제용 데이터베이스
# ID <- c("1", "2", "3", "4", "5")
# MID_EXAM <- c(10, 25, 100, 75, 30)
# CLASS <- c("1반", "2반", "3반", "1반", "2반")

# dataframe_test <- data.frame(ID, MID_EXAM, CLASS)
# dataframe_test

# 엑셀 파일 불러오기
library(readxl)

# Main Computer file location
excel_data_ex <- read_excel("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/1014.xlsx")
View(excel_data_ex)

# txt 파일 가져오기
ex_data <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex.txt", header=TRUE, nrows=7)
View(ex_data)

ex_data2 <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex.txt", header=TRUE, skip=2)
View(ex_data2)

ex_data3 <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex1.txt", header=TRUE, sep =",")
View(ex_data3)

# 변수명 추가 가져오기
varname <- c("ID", "SEX", "AGE", "AREA")
varname

ex2_data <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex2.txt", sep=",", col.names = varname)
View(ex2_data)

# rda파일 저장하고 불러오기
ID <- c(1, 2, 3, 4, 5)
SEX <- c("F", "M", "F", "M", "M")
data_ex1 <- data.frame(ID = ID, SEX = SEX)
write.csv(data_ex1, file="C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex1.csv")
write.table(data_ex1, file="C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex1.txt")


save(data_ex1, file="data_ex1.rda")
load("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex.rda")
View(data_ex)
