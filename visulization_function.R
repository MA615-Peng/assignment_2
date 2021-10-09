library(tidyverse)
library(ggplot2)

color = ifelse(data_tidy1$country=="China","pink","blue")
group1 =ifelse(data_tidy1$country=="China",1,2)

plot1<- ggplot(data = data_tidy1) +
  geom_bar(aes(x=year,y=san_rural,fill = country),position="dodge",stat='identity')+
  geom_line(aes(x=year,y=pol_rural,colour = country,group=group1))+
  geom_point(aes(x=year,y=pol_rural,colour = color))+
  labs(x="Year",
      y="value",
      subtitle="Armenia VS China rural population and sanitation")
plot1

plot2<- ggplot(data = data_tidy1) +
  geom_bar(aes(x=year,y=san_urban,fill = country),position="dodge",stat='identity')+
  geom_line(aes(x=year,y=pol_urban,colour = country,group=group1))+
  geom_point(aes(x=year,y=pol_urban,colour = color))+
  labs(x="Year",
       y="value",
       subtitle="Armenia VS China urban population and sanitation")
plot2
