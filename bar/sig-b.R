averages<- rnorm(length(xlabels),(maxy+miny)/2,(maxy+miny)/2*0.2)
averages<-sort(averages, decreasing = !sortOrder)

dvnum<-NULL
categories<-NULL
for(i in 1:length(xlabels)){
  temp<-rnorm(eachSampleSize,averages[i],sd=(maxy+miny)/2*0.1)
  dvnum<-c(dvnum,temp)
  if (xlabels[i]=="Control") controldata<-temp
  categories<-c(categories,rep(xlabels[i],eachSampleSize))
}


data<-data.frame(categories,dvnum)

data_summary <- data %>% # the names of the new data frame and the data frame to be summarised
  group_by(categories) %>%   # the grouping variable
  summarise(Mean = mean(dvnum),  # calculates the mean of each group
            StdDev = sd(dvnum), # calculates the standard deviation of each group
            Population = n(),  # calculates the samnume size per group
            StdErr = sd(dvnum)/sqrt(n()), # calculates the standard error of each group
            t = abs(t.test(dvnum,controldata)[[1]][[1]]),
            p_value=t.test(dvnum,controldata)[[3]])


export<-Pandoc$new()
export$add(data_summary)
export$format <- 'html'
export$export()


dataplot<- ggplot(data_summary, aes(categories, Mean)) +
  geom_col() +
  geom_errorbar(aes(ymin = Mean - StdDev, ymax = Mean + StdDev),width=0.2)
dataplot + labs(y=paste(ylabel,"± s.d.",sep=" "), x = xlabel) + theme_classic()
