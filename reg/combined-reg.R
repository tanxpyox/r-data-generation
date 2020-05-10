while (TRUE) {
  xvar<-sample(1:((maxx-minx)*100),size=20,replace=TRUE)
  yvar<-sample(1:((maxy-miny)*100),size=20,replace=TRUE)
  xvar<-xvar/100+minx
  yvar<-yvar/100+miny
  reg<-lm(yvar~xvar)
  print(c(summary(reg)$r.squared,summary(reg)$coefficients["xvar","Pr(>|t|)"]))
  if (summary(reg)$r.squared>0.4 && summary(reg)$coefficients["xvar","Pr(>|t|)"]< 0.05 && (positive==(summary(reg)$coefficient[[2]]>0))) break
}
xvarb<-xvar
yvarb<-yvar

pred <- function(x){return(summary(reg)$coefficient[[1]] + x * summary(reg)$coefficient[[2]])}
p <- cbind(c(minx,maxx),c(pred(minx),pred(maxx)))
for (i in 1:length(xvarb)){
  rv<-nearestPointOnSegment(p,c(xvarb[i],yvarb[i]))
  meanx=(2*rv[[1]]+xvarb[i])/3
  distx=rv[[3]]
  meany=(2*rv[[2]]+yvarb[i])/3
  disty=rv[[3]]
  for (j in 1:4){
    tx=-rnorm(1,meanx,distx)
    ty=-rnorm(1,meany,disty)
    while (tx<minx||tx>(maxx)||ty<miny||ty>(maxy)){
      tx<-rnorm(1,meanx,distx)
      ty<-rnorm(1,meany,disty)
 #     print(c(tx, ty))
    }
    xvar<-c(xvar,tx)
    yvar<-c(yvar,ty)
  }
}
reg<-lm(yvar~xvar)
effect_plot(reg, pred = xvar, interval = TRUE, plot.points = TRUE,x.label=paste(xlabel,xunits,sep=" "),y.label = paste(ylabel,yunits,sep=" "),main.title=graphtitle)
stargazer(reg,type="html",out = "out.html",dep.var.labels = ylabel,covariate.labels = xlabel,style = "all")
print(c(summary(reg)$r.squared,summary(reg)$coefficients["xvar","Pr(>|t|)"]))
