# 엑셀을 불러오는 라이브러리 
library(readxl)

ID <- c(1, 2, 3, 4, 5)
ID

SEX <- c("F","M","M","F","M")
SEX

DATA <- data.frame(ID = ID, SEX = SEX)
View(DATA)

# RDA 파일으로 저장하기(경로 지정 가능)
save(DATA, file="C:/Users/winpc/Desktop/Re-R/1014(소스파일)/DATA.rda")

# 활용도 높은 csv or txt파일 저장하기
data_ex <- data.frame(ID = ID, SEX = SEX)
write.csv(data_ex, file="C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex30.csv")
View(data_ex30)

# txt파일으로 저장하기 write.table()
write.table(data_ex, file="C:/Users/winpc/Desktop/Re-R/sample_test1.txt")

excel_data_ex <- read_excel("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex.xls")
View(excel_data_ex)

# 탭으로 구분된 txt파일 가져오기
ex_data <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex.txt")
View(ex_data)

ex_data1 <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex.txt", header=TRUE)
View(ex_data1)

# 원하는 행부터 데이터를 가져오기 skip 기능
ex_data2 <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex.txt", header=TRUE, skip=2)
View(ex_data2)

# 원하는 행부터 데이터를 가져오기 nrows 기능
ex_data3 <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex.txt", header=TRUE, nrows=7)
View(ex_data3)


# 쉼표로 구분된 txt파일 가져오기
ex1_data <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex1.txt", header=TRUE, sep=",")
View(ex1_data) 

# 변수명을 추가하여 가져오기
varname <- c("ID","SEX","AGE","AREA")

ex2_data <- read.table("C:/Users/winpc/Desktop/Re-R/1014(소스파일)/data_ex2.txt", sep=",", col.names = varname)
View(ex2_data)
