dir()
df=read.csv("THE FLAVOR BIBLE - 시트19.csv")
head(df)
str(df)


install.packages('readxl')
library(readxl)

df

install.packages("arules")
library(arules)

df1 = subset(df, chr!="flavor

rm(list=ls())



maching=ap


tran=read.transactions("THE FLAVOR BIBLE - 시트19.csv", format="basket", sep=",")

str(tran)

rule = apriori(tran, parameter = list(supp=0.001, conf=0.001))

install.packages("arulesViz")
library(arulesViz)
plot(rule, method='graph', control=list(type='items'))