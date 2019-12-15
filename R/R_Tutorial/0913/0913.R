#패키지 설치 및 로드

install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

library(KoNLP)
#자바가 설치된 폴더의 경로를 설정하는 코드를 실행하고 다시 로드 하시오.
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk1.8.0_211/")
library(dplyr)

useNIADic()

#데이터 불러오기
txt <- readLines("C:/Users/Im Chang Hyeok/Desktop/R_Tutorial/0913/hiphop.txt")

head(txt)


#특수문자 제거하기
install.packages("stringr")
library(stringr)

txt <- str_replace_all(txt, "\\W", " ")

#명사 추출하기
extractNoun("대한민국 영토는 한반도와 그 부속도서로 한다")

#가사에서 명사를 추출하기
nouns <- extractNoun(txt)

#추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

#데이터프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

#변수이름 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

#2글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)

top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

top_20

#워드 클라우드 만들기
#패키지 설치 및 로드 작업
install.packages("wordcloud")

library(wordcloud)
library(RColorBrewer)

#Dark2 색상 목록에서 8개의 색상을 추출한다.
pal <- brewer.pal(8, "Dark2")

#난수 고정하기
set.seed(1234)

#워드 클라우드
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          color = pal)

#워드 클라우드 색상 변경하기
pal <- brewer.pal(9, "Blues")[5:9]
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          color = pal)

#국정원 텍스트 마이닝
twitter<-read.csv("C:/Users/Im Chang Hyeok/Desktop/R_Tutorial/0913/twitter.csv",
                  header = T,
                  stringsAsFactors = F,
                  fileEncoding = "UTF-8")

#변수명 수정
twitter <- rename(twitter,
                  no = 번호,
                  id = 계정이름,
                  date = 작성일,
                  tw = 내용)

#특수문자 제거
twitter$tw <- str_replace_all(twitter$tw, "\\W", " ")
head(twitter$tw)

#단어 빈도표 만들기
#트윗에서 명사 추출하기
nouns <- extractNoun(twitter$tw)

#추출한 명사 리스트를 문자열 벡터로 변환, 단어별 빈도표 생성하기
wordcount <- table(unlist(nouns))

#데이터프레임으로 변환하기
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

#변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

#2글자 이상 단어만 추출
df_word <- filter(df_word, nchar(word) >= 2)

#상위 20개의 단어 추출
top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)
top_20

#단어 빈도 막대 그래프 만들기
library(ggplot2)

order <- arrange(top_20, freq)$word

ggplot(data = top_20, aes(x = word, y = freq)) + ylim(0, 2500) + geom_col() +
  coord_flip() + scale_x_discrete(limit = order) + geom_text(aes(label = freq), hjust = -0.3)

#워드 클라우드 만들기
pal <- brewer.pal(8, "Dark2")
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 10,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(6, 0.2),
          color = pal)


pal <- brewer.pal(9, "Blues")[5:9]
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 10,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(6, 0.2),
          color = pal)
