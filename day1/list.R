#f리스트를 어떻게 바라봐야 하는가?
#R에는 내장데이터를 많이 제공
# 자동차 연비와 관려된 mtcars를 사용 (read없는 자료는 내장자료)

mtcars
str(mtcars) #데이터 구조 확인
head(mtcars,3) #위에서 n개까지 보자
#인덱스열: 매트릭스 구조로 쓸 때,열 값이 있으면  불편해짐(인덱스키를 사용하는 이유)
summary(mtcars)
plot(mtcars$mpg)

#f리스트 구조화를 해야하는 이유
mtcars
summary(factor(mtcars$cyl))#실린더 개수 확인 #그룹으로서의 의미를 가지려면: factor # 데이터 자동정렬

names(summary(factor(mtcars$cyl))) #특정한 값 찾기
levels(factor(mtcars$cyl)) #같은 명령/ 데이터 자동 정렬
 unique(mtcars$cyl#같은 명령/ 가장 위에서부터 하나씩 정렬

tmp=summary(factor(mtcar&cyl)
tmp
names(tmp)=c('cyl:4', 'cyl :6', 'cyl :8')
str(tmp)
tmp[1]

#### split(자료, 기준) 작업하면 리스트화됨
tmp= split(mtcars, mtcars$cyl)
str(tmp)
tmp[[1]]
split(tmp[[1]], tmp[[1]]$am)
