while (TRUE) {
  online<-sample(1:3000,size=10,replace=TRUE)
  scap<-sample(1:3000,size=10,replace=TRUE)
  online<-online/100
  scap<-scap/100
  reg<-lm(scap~online)
  print(c(summary(reg)$r.squared,summary(reg)$coefficients["online","Pr(>|t|)"]))
  if (summary(reg)$r.squared>0.8 && summary(reg)$coefficients["online","Pr(>|t|)"]< 0.05) break
}
onlineb<-online
scapb<-scap
effect_plot(reg, pred = online, interval = TRUE, plot.points = TRUE,x.label="Online Forum Usage (h/wk)",y.label = "Social Capital Score")
