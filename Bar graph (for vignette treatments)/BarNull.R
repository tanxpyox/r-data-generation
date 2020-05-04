averages= rnorm(length(xlabels),(maxy+miny)/2,(maxy+miny)/2*0.1)

dvnum<-rnorm((length(xlabels)-1)*eachsamplesize,(maxy+miny)/2,(maxy+miny)/2*0.1)
controldata<-rnorm(eachsamplesize,(maxy+miny)/2,(maxy+miny)/2*0.1)
dvnum<-c(controldata,dvnum)
categories<-NULL

for(i in 1:length(xlabels)){
  categories<-c(categories,rep(xlabels[i],eachsamplesize))
}


data<-data.frame(dvnum,categories)

data_summary <- data %>% # the names of the new data frame and the data frame to be summarised
  group_by(categories) %>%   # the grouping variable
  summarise(mean_num = mean(dvnum),  # calculates the mean of each group
            sd_num = sd(dvnum), # calculates the standard deviation of each group
            n_num = n(),  # calculates the samnume size per group
            SE_num = sd(dvnum)/sqrt(n()), # calculates the standard error of each group
            t_num = abs(t.test(dvnum,controldata)[[1]][[1]]),
            p_value=t.test(dvnum,controldata)[[3]])


dataplot<- ggplot(data_summary, aes(categories, mean_num)) + 
  geom_col() +  
  geom_errorbar(aes(ymin = mean_num - sd_num, ymax = mean_num + sd_num),width=0.2)
dataplot + labs(y=paste(ylabel,"± s.d.",sep=" "), x = xlabel) + theme_classic()

export<-Pandoc$new()
export$add(data_summary)
export$format <- 'html'
export$export()
