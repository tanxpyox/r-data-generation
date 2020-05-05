#preamble
library(jtools)
library(maptools)
library(stargazer)

xlabel="IV"                        #Name of IV (for  regression table and graph)
ylabel="DV"                        #Name of DV (for regression table and graph)
xunits="(units/week)"              #Unit of IV (for the graph only)
yunits="(units/week)"              #Unit of DV (for the graph only)

#default= set to be 'DV aginst IV' (for graph only)
graphtitle<-paste(ylabel,"against",xlabel,sep=" ")

positive=FALSE                     #TRUE = the target is a positive relationship

minx=0                             #[minx,maxx] = the range of X
maxx=100
miny=0                             #[miny,maxy] = the range of Y
maxy=100
