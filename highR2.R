pred <- function(x){return(summary(reg)$coefficient[[1]] + x * summary(reg)$coefficient[[2]])} #Ctrl+H to change all 'online' to correct name of IV, and 'scap' to correct name of DV
p <- cbind(c(0,30),c(pred(0),pred(30)))   #change 0 to lower bound of X, 30 to upperbound of x
online <- onlineb
scap <- scapb
for (i in 1:length(onlineb)){
  rv<-nearestPointOnSegment(p,c(online[1],scap[1]))
  meanx=(2*rv[[1]]+online[i])/3              #biased mean
  distx=abs(rv[[1]]-online[i])
  meany=(2*rv[[2]]+scap[i])/3
  disty=abs(rv[[2]]-scap[i])
  for (j in 1:9){                            #'9' <- (Target sample size)/(principal dataset size) - 1
    tx=-1
    ty=-1
    while (tx<0||tx>30||ty<0||ty>30){        #0,30 = bounds of DV and IV respectively 
      tx<-rnorm(1,meanx,distx/4)
      ty<-rnorm(1,meany,disty/4)
    }
    online<-c(online,tx)
    scap<-c(scap,ty)
  }
}
reg<-lm(scap~online)
print(c(summary(reg)$r.squared,summary(reg)$coefficients["online","Pr(>|t|)"]))
effect_plot(reg, pred = online, interval = TRUE, plot.points = TRUE,x.label="Online Forum Usage (h/wk)",y.label = "Social Capital Score")
#change x.label, y.label parameters to correct DV/IV names
