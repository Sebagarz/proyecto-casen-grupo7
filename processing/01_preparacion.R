
# Cargar librerías con pacman, que es más rápido
if (!require("pacman")) install.packages("pacman")
pacman::p_load(haven, dplyr, srvyr)

# Cargar la base bruta desde input
casen_2022 <- read_dta("input/data-orig/casen_2022.dta")

# Limpieza básica (filtros, nombres de variables, etc.)
# Asegúrate de aplicar los filtros que usamos para llegar al 6.5%
casen_limpia <- casen_2022 %>% 
  filter(nucleo == 1) %>% # Ejemplo de filtro
  select(id_vivienda, hogar, region, pobreza_2013, expr)


# GUARDAR el avance en la carpeta process
# Usamos .rds porque mantiene los atributos de R y es muy liviano
saveRDS(casen_limpia, "input/data-proc/data_preparada_2022.rds")

