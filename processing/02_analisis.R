pacman::p_load(dplyr, srvyr)

casen_diseno <- readRDS("input/data-proc/data_preparada_2022.rds") %>% 
  as_survey_design(weights = expr)

# Cálculo de la pobreza
tabla_pobreza <- casen_diseno %>% 
  summarise(
    pobreza = survey_mean(pobreza_2013 %in% c(1, 2), na.rm = TRUE) * 100
  )

# GUARDAR el resultado final en la carpeta OUTPUT
# Esto es lo que leerá tu informe de Quarto después
saveRDS(tabla_pobreza, "output/tables/tabla_pobreza_2022.rds")

# Ver el 6.5% para confirmar que todo sigue bien
print(tabla_pobreza)

