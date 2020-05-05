xvar <- xvarb  #read backup from [xy]varb
yvar <- yvarb

#defining pred() to operationalise the regression equation
pred <- function(x){return(summary(reg)$coefficient[[1]] + x * summary(reg)$coefficient[[2]])}
p <- cbind(c(minx,maxx),c(pred(minx),pred(maxx)))
for (i in 1:length(xvarb)){
  #uses maptools::nearestPointOnSegment to compute the shortest distance from point i to line
  rv<-nearestPointOnSegment(p,c(xvarb[i],yvarb[i]))

  meanx=(2*rv[[1]]+xvarb[i])/3              #biased mean
  distx=rv[[3]]
  meany=(2*rv[[2]]+yvarb[i])/3
  disty=rv[[3]]

  for (j in 1:4){             #'4' <- (Target sample size[100])/20 - 1
    tx=-rnorm(1,meanx,distx)
    ty=-rnorm(1,meany,disty)
    while (tx<minx||tx>(maxx)||ty<miny||ty>(maxy)){
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

#regression table created by stargazer::stargazer()
stargazer(reg,type="html",out = "out.html",dep.var.labels = ylabel,covariate.labels = xlabel,style = "all")

#prints the R2 value and p value of the new graph
print(c(summary(reg)$r.squared,summary(reg)$coefficients["xvar","Pr(>|t|)"]))
