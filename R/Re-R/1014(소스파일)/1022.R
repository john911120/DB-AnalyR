library(ggplot2)
library(dplyr)
str(airquality)
ggplot(airquality, aes(x = Day, y = Temp))

# 산점도그래프 그리기, 3의 크기, 색상은 빨강으로 선점도 그래프를 나타내기
ggplot(airquality, aes(x = Day, y = Temp)) + geom_point(size = 3, color = "red")

# 꺾은선 그래프 그리기
ggplot(airquality, aes(x = Day, y = Temp)) + geom_line(size = 1, color = "black")

# 그래프에 또다른 그래프를 넣자
ggplot(airquality, aes(x = Day, y = Temp)) + geom_point() + geom_line()

# 막대그래프 그리기
ggplot(mtcars, aes(x = cyl)) + geom_bar(width=0.5)

# 막대그래프의 비어있는 범주를 제외하고 cyl종류별 빈도수 확인하기
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(width=0.5)

# 누적 막대그래프 그리기
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear)))

# 누적 막대그래프 선버스트 차트 그리기
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear))) + coord_polar()


# 상자그림과 히스토그램 그리기
ggplot(airquality, aes(x = Day, y = Temp, group = Day)) + geom_boxplot()

ggplot(airquality, aes(Temp)) + geom_histogram(binwidth = 1)

# 직선 그리기
str(economics)

ggplot(economics, aes(x = date, y = psavert)) + geom_line() + geom_abline(yintercept = mean(economics$psavert))


# 꺾은선 그래프에 평행선 그리기
ggplot(economics, aes(x = date, y = psavert)) + geom_line() + geom_abline(intercept = 12.18671, slope = -0.0005444)

ggplot(economics, aes(x = date, y = psavert)) + geom_line() + geom_hline(yintercept = mean(economics$psavert))

# 꺾은선 그래프에 수직선 그리기

x_inter <- filter(economics, psavert == min(economics$psavert))$date
ggplot(economics, aes(x = date, y = psavert)) + geom_line() + geom_vline(xintercept = x_inter)


# 텍스트 입력 및 도형 그리기
ggplot(airquality, aes(x = Day, y = Temp)) + geom_point() + geom_text(aes(label = Temp, vjust = 0, hjust = 0))


# 도형 및 화살표 그래프
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() + annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax=21, alpha = 0.5, fill = "skyblue") + annotate("segment", x = 2.5, xend = 3.7, y = 10, yend = 17, color="red", arrow = arrow()) + annotate("text", x = 2.5, y = 10, label = "point")

# 그래프 및 축 제목, labs함수
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar() + labs(x = "기어수", y = "자동차수", title = "변속기 기어별 자동차수")

# googleVis패키지 설치 및 로드
install.packages("googleVis")
install.packages("reprex")
library(reprex)
library(googleVis)

motion <- gvisMotionChart(economics, idvar = "psavert", timevar = "date")

plot(motion)


install.packages("ggmap")
library(ggmap)

gg_seoul <- get_googlemap("seoul", maptype="roadmap")
