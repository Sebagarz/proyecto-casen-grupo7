
pacman::p_load(haven, dplyr, srvyr)

#cargamos base de datos 
casen_2013 <- read_dta("input/data/original/casen_2013.dta")

casen_limpia_2013 <- casen_2013 %>% 
  filter(nucleo == 1) %>% 
  select(
    id_vivienda, 
    hogar = folio,  # cambio de nombre para que concuerde con las otras bases
    region, 
    pobreza_2013, 
    varunit, 
    varstrat, 
    expr, 
    numper, 
    ytotcorh
  )

#formula armonizar metodologia 2024
casen_limpia_2013 <- casen_limpia_2013 %>% 
  mutate(
    nae = numper^0.7,
    yae = round(ytotcorh / nae)
  )

saveRDS(casen_limpia_2013, "input/data/proc/data_preparada_2013.rds")


