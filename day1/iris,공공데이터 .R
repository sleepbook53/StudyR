'Hello World!' #세상과 조우하다'
#쉬우면 느리다 판다스 vs 넘파이, 넘파이 승


#두 개 이상의 자료를 갖는 리스트 구조에서
#파이썬에서는 직업명 =[' ' , ' '], 파이썬에서는 초기화 => |직업명 =[]
R에서는 직업명c=(' ' , ' ', ' '), ㄲdptjsms fltmxm chrlghksms => 직업명=c( )
직업명=c('데이터 과학자' , '엔지니어', '세금 관리자 ' , '분석관리자')
채용수=c(4.184, 2,725, 2.599, 3.317, 1.958)
평균급여=c(110, 110, 106, 110, 112)
직업만족도=c(4.4, 4.0, 4.3, 4.0, 4.1)

str(직업명)
summary(직업명)
plot(평균급여) #산점도 
#plot(직업명)

직업명fa=as.factor(직업명)
직업명fa #Levels: 중복되지 않은 값, 인덱싱 가능함
직업명
summary(직업명fa) #factor은 알아서 집계를 해줌
#plot(직업명fa)

data=data.frame('직업명', '채용수', '평균급여', '직업만족도')
data
str(data)

#strsplit(변수, 글자를 나눌기눌)
a=c('파이썬-20, 데이터분석가-20, 인공지능', 'R, 데이터분석가, 빅데이터')
tmp=strsplit(a,"/") #a를 나누는 것
tmp #tmp 노출
summary(tmp) #캐릭터가 아닌 상태
tmp1=unlist(tmp) #리스트 해제
tmp1

tmp2 = as.factor(tmp1) #facotr화
tmp2
summary(tmp2)
plot(tmp2)

strsplit(tmp2,'-'), #Facotr는 strsplit안됨
strsplit(as.character(tmp),'-') #캐릭터로 만들고, - 에서 자름
plot(a) #에러

#리스트
cafe <- list (espresso = c(4, 5, 3, 6, 5, 4, 7),
	americano = c(63, 68, 64, 68, 72, 89, 94),
	latte = c(61, 70, 59, 71, 71, 92, 88),
	price = c(2.0, 2.5, 3.0),
	menu = c('espresso', 'americno', 'latte'))

cafe

str(cafe)


#cafe[[5]] 이런식으로 작업해도 됨

#인덱스열과 네임즈행 구분 잘 해야함

cafe

str(cafe)
cafe$menu=factor(cafe$menu)
str(cafe)

cafe$price
names(cafe$price)=cafe$menu
cafe$price
names(cafe$price)
str(cafe)

str(cafe$price)
cafe$price[1]

#서로다른 셋을 가지고 있는 list 구조가 있다
#그 구조를 확인하는 구조를 위한 것이 str



