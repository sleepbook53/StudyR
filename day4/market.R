dir()

install.packages('arules') #텍스트 불러오기 가능
library(arules)
tran=read.transactions("train.txt", format="basket", sep=",") #트렌잭션 개체 생성(변동있는 파일)

tran #7개의 트랜잭션과 4개의 항목(상품)생성
#4개의 항목과 7개 중복 제거


#확인과정
str(tran)
class(tran
tran@itemInfo
tran@data #101010으로 표시/ 공식에 따른 표시 그냥 확인차


#규칙발견
	#숫자값은 자유
rule = apriori(tran, parameter = list(supp=0.3, conf=0.1)) # 18 rule
inspect(rule) #규칙보기



#시각화
install.packages("arulesViz")
library(arulesViz)

plot(rule, method='graph', control=list(type='items'))