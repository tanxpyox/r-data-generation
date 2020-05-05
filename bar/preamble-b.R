#preamble
library(ggplot2)
library(dplyr)
library(pander)

eachSampleSize<-100            #The size of each treatment group
sortOrder<-TRUE                #TRUE = ascending order, FALSE = descending order

#Define the names of the control/treatment groups. Sort the names
#in the order you want the averages to be sorted. See README.md for more info.
xlabels<-c("Control","Treatment 1","Treatment 2","Treatment 3","Treatment 4")

xlabel<-"Treatment groups"   #the x-axis label, below the labels of the individual groups
ylabel<-"DV"                 #y-axis label

miny<- 0                     #range of y: [miny,maxy]
maxy<- 100
