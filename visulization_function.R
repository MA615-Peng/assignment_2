library(tidyverse)
library(ggplot2)

color = ifelse(data_tidy1$country=="China","pink","blue")
group1 =ifelse(data_tidy1$country=="China",1,2)

#---------
# why did you decide to convert the values to characters? 
#
# bar = proportion rural access to basic sanitary services
# line = proportion of population that is rural
#--------

plot1<- ggplot(data = data_tidy1) +
  #geom_bar(aes(x=year,y=san_rural,fill = country),position = "dodge", stat ="identity")+
  geom_line(aes(x=year,y=san_rural,colour = country,group=group1))+
  geom_point(aes(x=year,y=san_rural,colour = color))+
  #geom_line(aes(x=year,y=pol_rural,colour = country,group=group1))+
  #geom_point(aes(x=year,y=pol_rural,colour = color))+
  scale_y_continuous(name="Percent", breaks=seq(0,100,20))+
  scale_x_discrete(name="Year", breaks=seq(1999,2016,2))
  #labs(x="Year",
  #    y="value",
  #    subtitle="Armenia VS China rural population and sanitation")
plot1

plot2<- ggplot(data = data_tidy1) +
  geom_bar(aes(x=year,y=san_urban,fill = country),position="dodge",stat='identity')+
  geom_line(aes(x=year,y=pol_urban,colour = country,group=group1))+
  geom_point(aes(x=year,y=pol_urban,colour = color))+
  labs(x="Year",
       y="value",
       subtitle="Armenia VS China urban population and sanitation")
plot2
