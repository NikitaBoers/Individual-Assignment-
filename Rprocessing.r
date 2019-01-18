library ('tidyverse')
library ('ggplot2')
library ('ggthemes')

all_conflicts <- read.csv('all_conflicts.csv') #read in data

ggplot(data = all_conflicts) + 
  geom_bar(mapping= aes(x= type_of_conflict))

ggplot(data = all_conflicts) + 
  geom_bar(mapping= aes(x= type_of_conflict, fill= country ), position= "dodge")

facor(as.character(all_conflicts$type_of_conflict))



# <GEOM_FUNCTION>(
#  mapping = aes(<MAPPINGS>),
# stat = <STAT>, 
#position = <POSITION>
#) +
#<COORDINATE_FUNCTION> +
#<FACET_FUNCTION>

#Making maps of conflicts
library('maps')
russia_data <- all_conflicts%>% filter(country%in%'Russia (Soviet Union)')
russiamap<-map_data('world')%>% filter(region=="Russia")
ggplot() +
  geom_polygon(data = russiamap, mapping = aes(x=long, y=lat, group=group))+
  geom_point(data = russia_data, mapping= aes(x= longitude ,y= latitude ,color=as.character(type_of_conflict)),alpha=0.4)+ 
  coord_fixed(1)
  

turkey_data <- all_conflicts%>% filter(country%in%'Turkey')
turkeymap<-map_data('world')%>%filter(region=="Turkey")
ggplot() +
  geom_polygon(data = turkeymap, mapping = aes(x=long, y=lat, group=group))+
  geom_point(data = turkey_data, mapping= aes(x= longitude ,y= latitude ,color=as.character(type_of_conflict)),alpha=0.4)+ coord_fixed()+
  coord_fixed(1)+
  theme_map()

library('ggthemes')

