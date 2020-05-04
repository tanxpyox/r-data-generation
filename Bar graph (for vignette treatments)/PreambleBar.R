#preamble
library(truncnorm)
library(ggplot2)
library(dplyr)
library(pander)
grps<-4
eachsamplesize<-25
controllower<-TRUE
xlabels<-c("Control","C+no","C+tax red","C+Cash","C+Economic Development","C+Sanction","C+ambiguous threat")
xlabel<-"Treatment groups"
ylabel<-"Percentage approval"
miny<- 0
maxy<- 100
graphtitle<-paste(ylabel,"against",xlabel,sep=" ")