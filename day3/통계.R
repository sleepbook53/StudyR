install.packages('cowsay')
library(cowsay)

say('Hello World!' , by = 'cat')

#for문을 활요한 것

byNameList=c('cat', 'ghost', 'ant')
for (byName in byNameList){
	say('drink', by=byName)
}

#------------------------------
install.packages('reshape2')
library(reshape2)
#가로 세로의 구조를 바꿔주는 패키지


#교재189
#데이터 분석
#자료 파악: 변수의 성격과 해설
#head(): 데이터가 잘 들어왔나, 목록이 무엇인가 등에 대한 파악
#unique()어떤 종류의 데이터가 있는가?
#str()간략하게 확인
#smmary()전체 요약

#해설
#tota_bill : 전체지불비용
#tip : tip비용
#sex : 성별  -상황에 따라 달라질 수 있음
#smoker : 흡연석/비흡연석
#day : 요일
#time : 방문시간
#size : 방문인원
#is.na(): 결측치 확인
	#sum(is.na()) : 


#----------------------------#
#가설 검증#

#1번 가설: 성별(독립변수, x값에다르는 tip의 비용은 같다(영가설/귀무가설)
	#검증을 통해서 비용은 같다 => 귀무가설 선택
	#비용이 다르다 => 귀무가설/대립가설 선택
	#pvalue통해서 확인함
#일반 가설: 가설검증은 데이터집계를 통해서 비교


table(tips[,3]) #성별의 빈도수, 전체데이터에서 발생횟수
#for 활용해서 깔끔하게 확인
#for에 print안넣으면 출력 안됨
#print(paste('---',names(tips)[i],'---')): 선 구분(합치기)

tips
for (i in c(3:7)){
	print(paste('---',names(tips)[i],'---'))
	print(table(tips[,i]))
}


#교재 190. 6번팁 빈도차
#테이블: 메인즈
#유니크: 변수
din=subset(tips, time == 'Dinner')
lun=subset(tips, time == 'Lunch')

table(tips$time)
table(din$day) #숫자로만 구성된 데이터
table(lun$day) #숫자로만 구성된 데이터
head(din) #실제로는 다양한 데이터가 나옴

#교재191 평균값
colMeans(din[c('total_bill', 'tip', 'size')])
colMeans(lun[c('total_bill', 'tip', 'size')])

#colsums활용
colSums(din[c('total_bill', 'tip', 'size')])
colSums(lun[c('total_bill', 'tip', 'size')])

par(mfrow=c(2,1)) #복수출력)
plot(din$tip)
plot(lun$tip)

summary(lun)
subset(lun, tip>=4)#4 이상인 사람들 보기
tmp = subset(lun, tip>=4)#많이 오는 사람 중 비흡연자 확인
summary(tmp)

subset(tips, tips$day == 'Fri') #금요일 데이터를 보자 - 2명이 많다
summary(subset(tips, tips$day == 'Fri')) #통계값을 보자

table(tmp$size)#size값을 봐보자


# 성별로 분석해보자
#가설 성별에 따라 tip의 차이 없다

#tips의 성별별 빈도수 확인
table(tips$sex)
#분할확인
S.F = subset(tips, sex == 'Female')
S.M = subset(tips, sex == 'Male')

summary(S.F)
summary(S.M)

### 최대금액은 차이가 나지만 평균금액은 별 차이가 없음

#그래
Google
R의 subset

All
ImagesVideosNewsMapsMore프로 확인해보자
par(mfrow=c(2,1))
plot(S.F$tip , main = 'F by Tips')
plot(S.M$tip , main = 'M by Tips')

#비율대비 차이가 크게 없음 -> 사이즈 및 요일에 따라 어떻게 달라지는거지?
#사이즈 보니 여성이 남성보다 더 많은 무리로 오더라 
plot(S.F$size , main = 'F- size')
plot(S.M$size , main = 'M -size')


#산점도(scatter)

tips
plot(tips[,1])
plot(tips[,1], tips[,2])

#인원수 대비 가격
plot(tips[,7],tips[,1])

str(tips)
colNum=c(1,2,7)
par(mfrow=c(3,1))

for( i  in colNum){
	plot(tips[,i], main=names(tips)[i])
} #자동화를 위한 것


#교재 347쪽 데이터: 모든 데이터가 숫자데이터
mtcars
str(mtcars)
plot(mtcars)
plot(mtcars[c(1,3,5,6)])
cor(mtcars[,c(1,3,5,6)]) #피어슨 상관계수(-1~1사이값)

#머신러닝(기계함수)
#독립변수들과 종속변수의 분석을 통한 예측, 분류
#독립변수(x)끼리는 상관도가 너무 높으면 안됨(x간의 종속성)
#상관도가 너무 높은 경우를 다중공선성이라고함
#다중공선성은 VIF(분산팽창지수)로 10이상 나오는 걸 의미
#이런경우 x변수를 제거하고, VIF보고, X변수 제거하고 VIF보고의 반복
#x가 커지면 y가 커짐 -> 상관도

#----------------
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
chart.Correlation(mtcars, histogram=TRUE, pch=19)

tmp=tips[,c(1,2,7)]
chart.Correlation(tmp, historgram=TRUE, pch=19)

#Box plot#
tt=subset(tips, tip<5)
summary(tt)
boxplot(tt$tip)

str(tt)
boxplot(tip~day, date=tt)

par(mfrow=c(2,2))
tmp=subset(tips, day =='Fri')
boxplot(tip~size, data=tmp)
boxplot(tip~sex, data=tmp)
boxplot(tip~smoker, data=tmp)
boxplot(tip~time, data=tmp)


#교재 343 box plot

mtcars
par(mfrow=c(2,1))

#중앙치 보니 낮은 값들이 많다, 이상치가 몇개 보인다 확인요망
boxplot(mtcars$mpg~mtcars$gear)

#양의 상관도를 가지고있음 
plot(mtcars$mpg~mtcars$gear) 

cor(mtcars$mpg,mtcars$gear)

#변속기 류에 따라 확인
boxplot(mtcars$mpg~mtcars$am)
plot(mtcars$mpg~mtcars$am) 
cor(mtcars$mpg,mtcars$gear)rs$mpg~mtcars$cor)


#매우 중요한 이슈(스케일링)
#값을 일정한 단위로 조정해서 간소화함(표준화, 스케일링)
#메모리도 줄여줌
boxplot(mtcars)
tmp=scale(mtcars)
summary(tmp)
boxplot(tmp)
