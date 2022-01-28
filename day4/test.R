#유통 비즈니스 데이터의 기초특성 분석

rm(list=ls())

dir()
df=read.csv("cust_order_data.csv")'
df


#일부 데이터에 *가 들어가 있는 경우, 사용할수 없는 데이터로 간주, 제거
df=df[df$SEX !="*",]

#윗부분10까지 데이터 확인
head(df,10)

#구매일자, 성별, 구매건수만 추출하여 별도의 데이터프레임 생성
sex1 = subset(df,select=c(ORDER_DATE, SEX, QTY))

sex1 #확인

#구매일자에서 월 정보만 추출하기 위한 라이브러리
install.packages('lubridate')
library(lubridate)

#ORDER_DATE열에 저장되어 있는 날자를 이용하여 month함수로 월만 추출하여 month라는 새로운 열을 추가
sex2 = cbind(sex1, month=month(sex1$ORDER_DATE)) #cbind: 컬럼 추가(열추가)
head(sex2, 5) #확인


#데이터 조작을 위한 라이브러리 설치
install.packages('reshape2')
library(reshape2)

@성별로 구분, 월별 구매건수의 총합 확인
dcast(sex2, SEX ~ month, value.var="QTY", sum)

#F나 M대신 female, male,라고 표시하기 위해 변환 함수 사용, gender라는 열추가
changeGender = function(x) {if(x[2] == "M"} {return("male")} else{return("female")}


changeGender <- function(x) { if (x[2] == “M”) { return("male") }  else { return("female") } }


sex2$gender = apply(sex2,2,changeGender)
head(sex2)




#성별로 월별 구매 건수를 누적 막대그래프로 표시
install.packages('gplot')
gplot(month, data=sex2, geom= "bar",fill=gender)

#성별 별로 월별 구매 건수를 별도의 막대 그래프로 표시
ggplot(sex2, aes(month) + geom_bar() + facet_wrap(~gender)


#구매일자, 나이, 구매 건수만 추출하여 별도의 데이터 프레임 구성
Age1 = subset(df, select=c(ORDER_DATE, AGE, QTY))
head(age1)


#ORDER_DATE 옆에
