xvar <- xvarb
yvar <- yvarb
pred <- function(x){return(summary(reg)$coefficient[[1]] + x * summary(reg)$coefficient[[2]])} #Ctrl+H to change all 'xvar' to correct name of IV, and 'yvar' to correct name of DV
p <- cbind(c(minx,maxx),c(pred(minx),pred(maxx)))   #change 0 to lower bound of X, 30 to upperbound of x
for (i in 1:length(xvarb)){
  rv<-nearestPointOnSegment(p,c(xvarb[i],yvarb[i]))
  meanx=(2*rv[[1]]+xvarb[i])/3              #biased mean
  distx=rv[[3]]
  meany=(2*rv[[2]]+yvarb[i])/3
  disty=rv[[3]]
  for (j in 1:4){                            #'9' <- (Target sample size)/(principal dataset size) - 1
    tx=-rnorm(1,meanx,distx)
    ty=-rnorm(1,meany,disty)
    while (tx<minx||tx>(maxx)||ty<miny||ty>(maxy)){        #0,30 = bounds of DV and IV respectively 
      tx<-rnorm(1,meanx,distx)
      ty<-rnorm(1,meany,disty)
      print(c(tx, ty))
    }
    xvar<-c(xvar,tx)
    yvar<-c(yvar,ty)
  }
}
reg<-lm(yvar~xvar)
effect_plot(reg, pred = xvar, interval = TRUE, plot.points = TRUE,x.label=paste(xlabel,xunits,sep=" "),y.label = paste(ylabel,xunits,sep=" "),main.title=graphtitle)
stargazer(reg,type="html",out = "out.html",dep.var.labels = ylabel,covariate.labels = xlabel,style = "all")
print(c(summary(reg)$r.squared,summary(reg)$coefficients["xvar","Pr(>|t|)"]))
#change x.label, y.label parameters to correct DV/IV names
