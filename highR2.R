online <- onlineb
scap <- scapb
for (i in 1:length(onlineb)){
  rv<-nearestPointOnSegment(p,c(online[1],scap[1]))
  meanx=(2*rv[[1]]+online[i])/3
  distx=abs(rv[[1]]-online[i])
  meany=(2*rv[[2]]+scap[i])/3
  disty=abs(rv[[2]]-scap[i])
  for (j in 1:4){
    tx=-1
    ty=-1
    while (tx<0||tx>30||ty<0||ty>30){
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



