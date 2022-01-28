#read.csv로 한글이 있는 자료 open
df=read.csv("cust_order_data.csv")


#[미션1-1] 데터 읽기전 메모리 모두 제거
##--메모리 제거dt <-read.csv("cust_order_data.csv", encoding="UTF-8", stringsAsFactors=FALSE)

rm(list=is())
##--메모리에 있는 변수 확인
memory.size()


##불러오기
dir()
df=read.csv("cust_order_data.csv",sep='\t',encoding='ANSI')


#[미션1-2]총데이터 갯수와 변수 성격 확인
df
dim(df) #차원반환 510470 16
length(df) #길이 16
nrow(df) # 행의 수 510470
ncol(df)# 열의 수 16

str(df) #각변수의 성격확인
head(df,3)#위로 3개의 자료만 읽기
names(df)#변수명(필드명)만 출력


#[미션1-3] 아래의 2개 변수(필드)외에 나머지 변수에 대하여 해석
tmp = df(select(-CUST_SERIAL_NO: 고객번호 , SEX: 고객성별))
str(tmp)
head(tmp)






##########################3
#강사님해석

#불러오기
dt <-read.csv("cust_order_data.csv", encoding="UTF-8", stringsAsFactors=TRUE)

#분석
str(df)
help(read.csv) #is.table 때문에 팩터 트루로


#데이터 얼만지 보여줘(좀 더 쉽게 보려고 데이터 프레임으로 바꿔봄)
tmp = data.frame(table(df[,1]))
head(tmp)
summary(tmp$Freq)
boxplot(tmp$freq)

#1년간의 구매기록 - 연 평균 1.2회 정도 구매한 것으로 보임
table(df[,5]) #유니크나 써머리 가능)

##고민 방문횟수 높은데 저게 구매 vs 적게 방문, 많은 구매

#물건구매 수량확인 -> 재고 및 배송관리 등을 어떻게 신경 쓸 수 있는가?
boxplot(df[,16])

#히스토그램 확인-> 빈도수

#** 뭐지?
str(df)
#name -> na로 대체하는것
tmp<-df$GOODS_NAME
str(tmp)
tmp[tmp=='#NAME?']<-NA
tmp<-tmp[complete.cases(tmp)]

str(tmp)

##factor: 조작안됨, 스플릿 등등. 조작하면 데이터는 없어도 계속 존재함
#그걸 캐릭터로 바꾼다음 없애야함 이후 다시 팩터로
tmp[tmp==#

#sort빈도 높은거 확인 