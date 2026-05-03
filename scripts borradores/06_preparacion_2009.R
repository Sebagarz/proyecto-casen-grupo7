
pacman::p_load(haven, dplyr, srvyr)

#cargamos base de datos 
casen_2009 <- read_dta("input/data/original/casen_2009.dta")

names(casen_2009)

# 2. Selección de variables (usando guiones bajos)
casen_limpia_2009 <- casen_2009 %>% 
  filter(nucleo == 1) %>% 
  select(
    id_vivienda,      
    hogar,           
    region,           
    pobreza_2013,     
    varunit = r0,     
    varstrat = estrato, # cambiamos nombre para que coincidan con los otros años
    expr,             
    numper,           
    ytotcorh          
  )

# 3. Armonización 2024
casen_limpia_2009 <- casen_limpia_2009 %>% 
  mutate(
    nae = numper^0.7,
    yae = round(ytotcorh / nae)
  )


diseno_2009 <- casen_limpia_2009 %>% 
  as_survey_design(
    ids = varunit, 
    strata = varstrat, 
    weights = expr, 
    nest = TRUE  
  )


saveRDS(casen_limpia_2009, "input/data/proc/data_preparada_2009.rds")




