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

plot(din$tip)
plot(lun$tip)