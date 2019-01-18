library ('tidyverse')
library ('ggplot2')
library ('ggthemes')

all_conflicts <- read.csv('all_conflicts.csv') #read in data

ggplot(data = all_conflicts) + 
  geom_bar(mapping= aes(x= type_of_conflict))

ggplot(data = all_conflicts) + 
  geom_bar(mapping= aes(x= type_of_conflict, fill= country ), position= "dodge")

#maps with colorcoding for type of conflict
library('maps')
library('ggthemes')
russia_data <- all_conflicts%>% filter(country%in%'Russia (Soviet Union)')
russiamap<-map_data('world')%>% filter(region=="Russia")
ggplot() +
  geom_polygon(data = russiamap, mapping = aes(x=long, y=lat, group=group))+
  geom_point(data = russia_data, mapping= aes(x= longitude ,y= latitude ,color=as.character(type_of_conflict)),alpha=0.4)+ 
  coord_fixed(1)+theme_map()
  
turkey_data <- all_conflicts%>% filter(country%in%'Turkey')
turkeymap<-map_data('world')%>%filter(region=="Turkey")
ggplot() +
  geom_polygon(data = turkeymap, mapping = aes(x=long, y=lat, group=group))+
  geom_point(data = turkey_data, mapping= aes(x= longitude ,y= latitude ,color=as.character(type_of_conflict)),alpha=0.4)+ 
  coord_fixed(1)+
  theme_map()

#maps with colorcoding for years
ggplot() +
  geom_polygon(data = russiamap, mapping = aes(x=long, y=lat, group=group))+
  geom_point(data = russia_data, mapping= aes(x= longitude ,y= latitude ,color= year),alpha=0.4)+ 
  coord_fixed(1)+
  theme_map()+
  scale_color_gradient(low="red", high="yellow")

ggplot() +
  geom_polygon(data = turkeymap, mapping = aes(x=long, y=lat, group=group))+
  geom_point(data = turkey_data, mapping= aes(x= longitude ,y= latitude ,color= year),alpha=0.4)+ 
  coord_fixed(1)+
  theme_map()+scale_color_gradient(low="red", high="yellow")


