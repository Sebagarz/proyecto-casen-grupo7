
install.packages("srvyr") 
install.packages("tinytex")

library(srvyr)
library(haven)   
library(dplyr)

casen <- read_dta("input/casen_2022.dta")

casen_diseno <- casen %>%
  filter(nucleo != 0) %>% # Filtro fundamental según el manual
  as_survey_design(weights = expr) # Usamos el factor de expansión de personas
#cambiamos probeza por pobreza 2013, debido a que los datos no eran similares con los mostrados en la CASEN

tabla_pobreza_real <- casen_diseno %>%
  group_by(pobreza_2013) %>% # <-- Aquí el cambio clave
  summarize(porcentaje = survey_mean(na.rm = TRUE) * 100)


print(tabla_pobreza_real)






