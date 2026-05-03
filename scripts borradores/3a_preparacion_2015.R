
pacman::p_load(haven, dplyr, srvyr)

#cargamos base de datos 
casen_2015 <- read_dta("input/data/original/casen_2015.dta")

names(casen_2015)


casen_limpia_2015 <- casen_2015 %>% 
  filter(nucleo == 1) %>% 
  select(id_vivienda, hogar, region, 
    pobreza_2013,  
    varunit, varstrat, 
    expr, numper, ytotcorh)

#formual sincronización metodologia 2024

casen_limpia_2015 <- casen_limpia_2015 %>% 
  mutate(
    nae = numper^0.7,
    yae = round(ytotcorh / nae)
  )

saveRDS(casen_limpia_2015, "input/data/proc/data_preparada_2015.rds")


