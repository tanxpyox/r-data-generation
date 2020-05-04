while (TRUE) {                                      # Ctrl + H to change all variable names: 'xvar' = IV, 'yvar' = DV
  xvar<-sample(1:((maxx-minx)*100),size=20,replace=TRUE)       #'3000' --> change to max(x)*1000
  yvar<-sample(1:((maxy-miny)*100),size=20,replace=TRUE)         #'3000' --> change to max(y)*1000
  xvar<-xvar/100+minx
  yvar<-yvar/100+miny
  reg<-lm(yvar~xvar)
  print(c(summary(reg)$r.squared,summary(reg)$coefficients["xvar","Pr(>|t|)"]))
  if (summary(reg)$r.squared>0.4 && summary(reg)$coefficients["xvar","Pr(>|t|)"]< 0.05 && (positive==(summary(reg)$coefficient[[2]]>0))) break
}
xvarb<-xvar                                     # creates a backup dataset; allows user to run the second part (highR2.R) multiple times without disrupting the principal dataset
yvarb<-yvar
effect_plot(reg, pred = xvar, interval = TRUE, plot.points = TRUE,x.label=paste(xlabel,xunits,sep=" "),y.label = paste(ylabel,xunits,sep=" "),main.title=graphtitle)
# change x.label and y.label parameters to correct variable names
