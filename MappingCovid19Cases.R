
install.packages("RODBC")
library(RODBC)
library(tidyverse)

# Creates connection to the /covid19 Database in Sql Server (Server is MSI for my laptop)
dbconnection = odbcDriverConnect('driver={SQL Server};server=MSI;database=Covid19;trusted_connection=true')

# Using select statement in SQL by using 'paste'
# cases
covid.casedata <- sqlQuery(dbconnection,paste("select * from cases;"))



#pop data
covid.popdata <- sqlQuery(dbconnection,paste("select * from PopulationData;"))


odbcClose(dbconnection)

View(covid.casedata)# now join pop data

max_cases_by_prov <- covid.casedata %>% group_by(Province) %>% 
  summarize(cases_max= max(CumulativeCases)) %>% 
inner_join(covid.popdata, by = "Province") 



