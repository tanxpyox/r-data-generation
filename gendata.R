while (TRUE) {                                      # Ctrl + H to change all variable names: 'online' = IV, 'scap' = DV
  online<-sample(1:3000,size=10,replace=TRUE)       #'3000' --> change to max(x)*1000
  scap<-sample(1:3000,size=10,replace=TRUE)         #'3000' --> change to max(y)*1000
  online<-online/100
  scap<-scap/100
  reg<-lm(scap~online)
  print(c(summary(reg)$r.squared,summary(reg)$coefficients["online","Pr(>|t|)"]))
  if (summary(reg)$r.squared>0.8 && summary(reg)$coefficients["online","Pr(>|t|)"]< 0.05) break
}
onlineb<-online                                     # creates a backup dataset; allows user to run the second part (highR2.R) multiple times without disrupting the principal dataset
scapb<-scap
effect_plot(reg, pred = online, interval = TRUE, plot.points = TRUE,x.label="Online Forum Usage (h/wk)",y.label = "Social Capital Score")
# change x.label and y.label parameters to correct variable names
