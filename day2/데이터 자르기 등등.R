#데이터 메모리제거
#rm(list=is())


dir()
df=read.csv("전국무인교통단속카메라표준데이터.csv")

#facotor로 만들기
df=read.csv(dir()[2], stringsAsFactor = TRUE)

#df의 1~9번열만 df1에 할당
#df1=df[,c(1:9)]
#df1자료를 작업자료.csv로 저장
write.csv(df1,'작업자료.csv)

#dir()
rm(list=is())#메모리변수 모두 제거
df=read.csv#df로 작업자료.csv부르기
str(df)


#### 기술통계]
'
#결측치 패키지
install.packages('naniar')