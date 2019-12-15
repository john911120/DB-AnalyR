# KoNLP패키지와 wordCloud2 패키지 설치 rJava 패키지를 설치한다.
install.packages("wordCloud2")
install.pakages("rJava")

# java가 설치된 파일 경로로 들어가서 지정해준다.
# 메인 컴퓨터의 java설치 경로이다.
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_211")

# 실습에 필요한 라이브러리 기능 불러오기
library(rJava)
library(KoNLP)
library(wordcloud2)


# 사전 설정 및 한글 처리 과정 
useSystemDic()

useSejongDic()

useNIADic()

# txt파일 불러와서 특정 변수에 저장한다.
word_data <- readLines("C:/Users/winpc/Desktop/Re-R/Data/애국가(가사).txt")
Sys.setlocale("LC_COLLATE", "ko_KR, UTF-8")

# 불러온 파일 열어보기
View(word_data)

# 명사만 추출하기
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

# 단어 추가시키기
add_words <- c("백두산", "남산", "철갑", "가을", "하늘", "달")
buildDictionary(user_dic = data.frame(add_words,rep("ncn",length(add_words))),replace_usr_dic = T)

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

# 행렬을 벡터로 변환하기
undata <- unlist(word_data2)
undata

# 단어 사용빈도 확인하기
word_table <- table(undata)
word_table

# 필터링
undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

# 데이터 정렬하기
sort(word_table2, decreasing = T)
sort(word_table2, decreasing = F)

# 기본형 워드 클라우드 만들기
wordcloud2(word_table2)

# 배경 등 색상 변경하기
wordcloud2(word_table2, color = "random-light", backgroundColor = "Black")

# 모양 변경하기기
wordcloud2(word_table2, fontFamily = "맑은 고딕", size = 1.2, color = "random-light", backgroundColor = "Black", shape="star")

# 선택한 색상만 반복되는 클라우드
wordcloud2(demoFreq, size=1.6, color = rep_len(c("red","blue"), nrow(demoFreq)))
           
# 일정 방향으로 정렬된 워드클라우드
wordcloud2(demoFreq, minRotation = -pi / 6, maxRotation = -pi / 6, rotateRatio = 1)

# 원하는 이미지에 워드 클라우드 표시하기
wordcloud2(demoFreq, figPath = "peace.png")
