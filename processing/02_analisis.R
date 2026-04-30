pacman::p_load(dplyr, srvyr)

casen_diseno <- readRDS("input/data/proc/data_preparada_2022.rds") %>% 
  as_survey_design(ids = varunit, strata = varstrat, weights = expr)

# 2. Cálculo con desglose (Cambiamos summarise por group_by)
tabla_pobreza <- casen_diseno %>% 
  group_by(pobreza_2013) %>% 
  summarise(
    porcentaje = survey_mean(na.rm = TRUE) * 100
  ) %>% 
  filter(pobreza_2013 %in% c(1, 2)) # Nos quedamos solo con los dos tipos de pobreza

# 3. Guardar y ver resultados
saveRDS(tabla_pobreza, "output/tables/tabla_pobreza_2022.rds")

print(tabla_pobreza)



