
pacman::p_load(haven, dplyr, srvyr)

#cargamos base de datos 
casen_2011 <- read_dta("input/data/original/casen_2011.dta")

casen_limpia_2011 <- casen_2011 %>% 
  filter(nucleo == 1) %>% 
  select(
    id_vivienda, hogar, region, pobreza_2013, varunit, varstrat, expr, numper,          
    ytotcorh)

# Armonización 2024
casen_limpia_2011 <- casen_limpia_2011 %>% 
  mutate(
    nae = numper^0.7,
    yae = round(ytotcorh / nae)
  )

saveRDS(casen_limpia_2011, "input/data/proc/data_preparada_2011.rds")

