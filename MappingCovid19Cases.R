# 
# install.packages("raster")
# install.packages('maptools')
# install.packages("RODBC")
# install.packages("sf")
library(RODBC)
library(tidyverse)
library(raster)
library(sf)
library(tidyverse)

######################################
########### VACCINATIONS #############
######################################
# Creates connection to the /covid19 Database in Sql Server (Server is MSI for my laptop)
dbconnection = odbcDriverConnect('driver={SQL Server};server=MSI;database=Covid19;trusted_connection=true')

# Using select statement in SQL by using 'paste'
# cases
covid.vaccinateddata <- sqlQuery(dbconnection,paste("select * from FullyVaccinated;"))


#pop data
covid.popdata <- sqlQuery(dbconnection,paste("select * from PopulationData;"))


odbcClose(dbconnection)

View(covid.vaccinateddata)# now join pop data

max_vaccinated_by_prov <- covid.vaccinateddata %>% group_by(Province) %>% 
  summarize(vaccinated_max= max(CumulativeVaccinated)) %>% 
  inner_join(covid.popdata, by = "Province")  %>% 
  mutate(percPopPositive=(vaccinated_max/Population)*100)%>% 
  rename("PRENAME"="Province")

canada.provs <- read_sf('E:/4-Data Analytics Fall 2023/DBAS3017 - User Experience Techniques/ICE/ICE 5/DataViz2023/MappingData')

mapdata.Cases <- sp::merge(canada.provs , max_vaccinated_by_prov, by="PRENAME", all=F)

map=ggplot(mapdata.Cases,aes(fill = percPopPositive)) +
  geom_sf()

map_out = map + scale_fill_gradient(name = "% cases", low = "green",  high =  "red", na.value = "grey50")+
  
  labs(x = NULL, y = NULL,
       title = "Covid Vaccinated By Province",
       caption = "Data: Boundary Data (StatsCan).")+
  theme(
    # axis.text.x = element_blank(),
    # axis.text.y = element_blank(),
    # axis.ticks = element_blank(),
    axis.title.y=element_blank(),
    axis.title.x=element_blank(),
    rect = element_blank(),
    panel.border = element_rect(color = "black", 
                                fill = NA, 
                                size = 1))
map_out


ggsave("E:/4-Data Analytics Fall 2023/DBAS3017 - User Experience Techniques/ICE/ICE 5/DataViz2023/figures/canada_vaccinated.pdf", map_out, height = 12, width = 15)



######################################
##########     CASES     #############
######################################
# # Creates connection to the /covid19 Database in Sql Server (Server is MSI for my laptop)
# dbconnection = odbcDriverConnect('driver={SQL Server};server=MSI;database=Covid19;trusted_connection=true')
# 
# # Using select statement in SQL by using 'paste'
# # cases
# covid.casedata <- sqlQuery(dbconnection,paste("select * from cases;"))
# 
# 
# #pop data
# covid.popdata <- sqlQuery(dbconnection,paste("select * from PopulationData;"))
# 
# 
# odbcClose(dbconnection)
# 
# View(covid.casedata)# now join pop data
# 
# max_cases_by_prov <- covid.casedata %>% group_by(Province) %>% 
#   summarize(cases_max= max(CumulativeCases)) %>% 
# inner_join(covid.popdata, by = "Province")  %>% 
#   mutate(percPopPositive=(cases_max/Population)*100)%>% 
#   rename("PRENAME"="Province")
# 
# canada.provs <- read_sf('E:/4-Data Analytics Fall 2023/DBAS3017 - User Experience Techniques/ICE/ICE 5/DataViz2023/MappingData')
# 
# mapdata.Cases <- sp::merge(canada.provs , max_cases_by_prov, by="PRENAME", all=F)
# 
# map=ggplot(mapdata.Cases,aes(fill = percPopPositive)) +
#   geom_sf()
# 
# map_out = map + scale_fill_gradient(name = "% cases", low = "green",  high =  "red", na.value = "grey50")+
#   
#   labs(x = NULL, y = NULL,
#        title = "Covid Cases By Province",
#        caption = "Data: Boundary Data (StatsCan).")+
#   theme(
#     # axis.text.x = element_blank(),
#     # axis.text.y = element_blank(),
#     # axis.ticks = element_blank(),
#     axis.title.y=element_blank(),
#     axis.title.x=element_blank(),
#     rect = element_blank(),
#     panel.border = element_rect(color = "black", 
#                                 fill = NA, 
#                                 size = 1))
# map_out
# 
# 
# ggsave("E:/4-Data Analytics Fall 2023/DBAS3017 - User Experience Techniques/ICE/ICE 5/DataViz2023/figures/canada_cases.pdf", map_out, height = 12, width = 15)


