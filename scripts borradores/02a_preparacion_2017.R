
pacman::p_load(haven, dplyr, srvyr)

#cargamos base de datos 
casen_2017 <- read_dta("input/data/original/casen_2017.dta")

names(casen_2017)

#limpieza de variables 
casen_limpia_2017 <- casen_2017 %>% 
  filter(nucleo == 1) %>% 
  select(
    id_vivienda, hogar, region, 
    pobreza_2013,  # Variable oficial para la serie histórica
    varunit, varstrat, expr, 
    numper, ytotcorh)

#formula para que sea comparable con las otras base de datos//// metodologia 2024
casen_limpia_2017 <- casen_limpia_2017 %>% 
  mutate(
    nae = numper^0.7,
    yae = round(ytotcorh / nae)
  )

saveRDS(casen_limpia_2017, "input/data/proc/data_preparada_2017.rds")

