while (TRUE) {
  xvar<-sample(1:((maxx-minx)*100),size=20,replace=TRUE)
  yvar<-sample(1:((maxy-miny)*100),size=20,replace=TRUE)
  xvar<-xvar/100+minx
  yvar<-yvar/100+miny
  reg<-lm(yvar~xvar)
#  print(c(summary(reg)$r.squared,summary(reg)$coefficients["xvar","Pr(>|t|)"])) #(debug, prints the R^2 value and p value of each dataset)
  if (summary(reg)$r.squared>0.4 && summary(reg)$coefficients["xvar","Pr(>|t|)"]< 0.05 && (positive==(summary(reg)$coefficient[[2]]>0))) break
}
 # creates a backup dataset; allows user to run the second part (interpolate-reg.R) multiple times without disrupting the principal dataset
xvarb<-xvar
yvarb<-yvar

# graph is generated using jtools::effect_plot()
effect_plot(reg, pred = xvar, interval = TRUE, plot.points = TRUE,x.label=paste(xlabel,xunits,sep=" "),y.label = paste(ylabel,yunits,sep=" "),main.title=graphtitle)
