xvar<-sample(1:((maxx-minx)*100),size=100,replace=TRUE)       #'3000' --> change to max(x)*1000
yvar<-sample(1:((maxy-miny)*100),size=100,replace=TRUE)         #'3000' --> change to max(y)*1000
xvar<-xvar/100+minx
yvar<-yvar/100+miny
reg<-lm(yvar~xvar)
effect_plot(reg, pred = xvar, interval = TRUE, plot.points = TRUE,x.label=paste(xlabel,xunits,sep=" "),y.label = paste(ylabel,xunits,sep=" "),main.title=graphtitle)
stargazer(reg,type="html",out = "out.html",dep.var.labels = ylabel,covariate.labels = xlabel,style = "all")
print(c(summary(reg)$r.squared,summary(reg)$coefficients["xvar","Pr(>|t|)"]))
