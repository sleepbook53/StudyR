#iris

iris
str(iris)
iris[,c(1:2)] #1~2열의 모든 데이터
iris[,c(1,3,5)] #1, 3, 5,열의 모든 데이터
iris[,c("Sepal.Length","Species")] #1, 5열의 모든 데이터
iris[1:5,] #1~5행의 모든 데이터
iris[1:5,c(1,3)] #1~5행의 데이터 중 1, 3열의 데이터


#공공데이터 활용

#가장 쉬운 데이터 읽어오는 방법: 디렉토리 설정
#콘솔창활성화 -> 파일 -> 디렉토리폴더 변경 -> dir()
#파이썬의 os.listdir 또는 glob와 동일

#csv자료의 가장 윗자료를 필드명으로 가져옴
df=read.csv("부산광역시_현대미술관 관람객 수_20201231.csv") #데이터 읽어오기
df #확인
str(df) #구조확인(타입, 행, 열의 갯수
head(df,10) #데이터 샘플 확인(내용 확인), 10roaks
names(df) #필드값만 확인
	#df$names(df)[1]로 볼 수도있음
summary(df)#데이터의 기본 기술 통계
summary(as.factor(df[,1] )#빈도수계산 df[,1]: 연도수

#자료 연도만 출력
str(df)
df$연도
df[,1] #행은 다 나오고 열은 제한적
max(df[,1])

#미션, 연도와 관람객수만 출력
df[,c(1,3)]
df[,c('연도','관람객수')]
df[1:36,c(1,3)]

#위로 열 두개 자료만 출력, 즉 1018년 도 자료
df[1:12,]
#아래로 12개의 자료만 출력, 즉 2020년 자료
df[-1:-12,]

#2018년도 월과 관람객 수만
df[,c("월", "관람객수")]


#구글링: R에서 N/A값(결측값) 0으로

#관람객 수df[3]
#is.na na 확인
#table: 데이터 확인 

summary(df)
#관람객의 결측값을 데이터로 표현해서 바플롯으로 출력
barplot(table(is.na(df[3])))

#복수의 값을 plot에 출력
#mafow 활용
	#par(mfrow=c(1,1)만날떄까지 유지

par(mfrow = c(3, 1))

#barplot(table(is.na(df[1]))
#barplot(table(is.na(df[2])))
#barplot(table(is.na(df[3])))

#타이틀 입력
index =1
barplot(table(is.na(df[1])),main=names(df)[index])
barplot(table(is.na(df[2])),main=names(df)[index])
barplot(table(is.na(df[3])),main=names(df)[index])

#----------------------
#여태까지 과정
	#csv자료를 읽기 위해서 작업경로 세팅
	#df= read.csv 명령어로 자료 읽음
	(별도옵션없었기 떄문에 가장상단은 제목, 문자는 factor로 읽음)
	#데이터의 구조 확인(필드명, 성격을 확인등 str)
	#데이터 샘플 확인(head, 위로 아래로 등)
	#기술 동계를 통해 데이터 셋의 분포 확인
		#summary를 통해 전체혹은 일부 확인
		#summary(df) , summary(df[,c(1,3)], df[,c(3,12)]
	#NA값을 반드시 확인(summary, is.na(), table(s.na(df), plot(ta~)
	#*시각화도 가능
	#NA값을 처리: 0으로 대체하거나 중앙값이나 평균값으로 대체, 9있는 행 모두제거, 임의값으로 대체
	#개수 확인: summary(factor(df$연도)), table(df$연도), plot(talbe(df#연도)
