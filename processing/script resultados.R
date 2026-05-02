
BASE DE DATOS 2022


# Cargar librerías con pacman, que es más rápido
if (!require("pacman")) install.packages("pacman")

pacman::p_load(haven, dplyr, srvyr)

# Cargar la base bruta desde input
casen_2022 <- read_dta("input/original/casen_2022.dta") # se demora en cargar, es normal por el tamaño

# 1. Filtramos y seleccionamos
casen_limpia_2022 <- casen_2022 %>%
  filter(!is.na(pobreza_2013)) %>%
  filter(!is.na(expr), expr > 0) %>%
  # select de las variables a utilizar
  select(region, pobreza_2013, varunit, varstrat, expr, numper, ytotcorh)

# 2. Aplicamos mutate sobre la base ya filtrada
casen_limpia_2022 <- casen_limpia_2022 %>% 
  mutate(
    pobreza_cat = case_when(
      pobreza_2013 == 1 ~ "Pobreza extrema",
      pobreza_2013 == 2 ~ "Pobreza no extrema",
      pobreza_2013 == 3 ~ "No pobres",
      TRUE ~ NA_character_
    )
  )

# 3. Creamos el objeto de diseño (IMPORTANTE: Hay que guardarlo en una variable)
diseno_2022 <- casen_limpia_2022 %>%
  as_survey_design(
    ids = varunit,
    strata = varstrat,
    weights = expr,
    nest = TRUE
  ) 

# 4. Cálculo final
resultado_2022 <- diseno_2022 %>%
  group_by(pobreza_cat) %>%
  summarize(porcentaje = survey_mean(na.rm = TRUE) * 100)

print(resultado_2022) # ver los resultados

# GUARDAR el avance en la carpeta process (carpeta + nombre del archivo)
# Usamos .rds porque mantiene los atributos de R y es muy liviano 
saveRDS(resultado_2022, "input/proc/resultado_2022.rds")
saveRDS(diseno_2022, "input/proc/diseno_2022.rds")


BASE DE DATOS 2017


# Primero forzamos la carga de la librería
library(haven)
  
# Cargar la base bruta desde input
casen_2017 <- read_dta("input/original/casen_2017.dta")

# 1. Filtramos y seleccionamos
casen_limpia_2017 <- casen_2017 %>%
  filter(!is.na(pobreza_2013)) %>%
  filter(!is.na(expr), expr > 0) %>%
  # select de las variables a utilizar
  select(region, pobreza_2013, varunit, varstrat, expr, numper, ytotcorh)

# 2. Aplicamos mutate sobre la base ya filtrada
casen_limpia_2017 <- casen_limpia_2017 %>% 
  mutate(
    pobreza_cat = case_when(
      pobreza_2013 == 1 ~ "Pobreza extrema",
      pobreza_2013 == 2 ~ "Pobreza no extrema",
      pobreza_2013 == 3 ~ "No pobres",
      TRUE ~ NA_character_
    )
  )

# 3. Creamos el objeto de diseño (IMPORTANTE: Hay que guardarlo en una variable)
diseno_2017 <- casen_limpia_2017 %>%
  as_survey_design(
    ids = varunit,
    strata = varstrat,
    weights = expr,
    nest = TRUE
  ) 

# 4. Cálculo final
resultado_2017 <- diseno_2017 %>%
  group_by(pobreza_cat) %>%
  summarize(porcentaje = survey_mean(na.rm = TRUE) * 100)

print(resultado_2017) # ver los resultados

# GUARDAR el avance en la carpeta process (carpeta + nombre del archivo)
# Usamos .rds porque mantiene los atributos de R y es muy liviano 
saveRDS(resultado_2017, "input/proc/resultado_2017.rds")
saveRDS(diseno_2017, "input/proc/diseno_2017.rds") # guardamos esto por si acaso


BASE DE DATOS 2015

# Primero forzamos la carga de la librería
library(haven)

# Cargar la base bruta desde input
casen_2015 <- read_dta("input/original/casen_2015.dta") # recuerda que es normal si se demora en cargar

# 1. Filtramos y seleccionamos
casen_limpia_2015 <- casen_2015 %>%
  filter(!is.na(pobreza_2013)) %>%
  filter(!is.na(expr), expr > 0) %>%
  # select de las variables a utilizar
  select(region, pobreza_2013, varunit, varstrat, expr, numper, ytotcorh)

# 2. Aplicamos mutate sobre la base ya filtrada
casen_limpia_2015 <- casen_limpia_2015 %>% 
  mutate(
    pobreza_cat = case_when(
      pobreza_2013 == 1 ~ "Pobreza extrema",
      pobreza_2013 == 2 ~ "Pobreza no extrema",
      pobreza_2013 == 3 ~ "No pobres",
      TRUE ~ NA_character_
    )
  )

# 3. Creamos el objeto de diseño (IMPORTANTE: Hay que guardarlo en una variable)
diseno_2015 <- casen_limpia_2015 %>%
  as_survey_design(
    ids = varunit,
    strata = varstrat,
    weights = expr,
    nest = TRUE
  ) 

# 4. Cálculo final
resultado_2015 <- diseno_2015 %>%
  group_by(pobreza_cat) %>%
  summarize(porcentaje = survey_mean(na.rm = TRUE) * 100)

print(resultado_2015) # ver los resultados

# GUARDAR el avance en la carpeta process (carpeta + nombre del archivo)
# Usamos .rds porque mantiene los atributos de R y es muy liviano 
saveRDS(resultado_2015, "input/proc/resultado_2015.rds")
saveRDS(diseno_2015, "input/proc/diseno_2015.rds") # guardamos esto por si acaso


BASE DE DATOS 2013


# Primero forzamos la carga de la librería
library(haven)

# Cargar la base bruta desde input
casen_2013 <- read_dta("input/original/casen_2013.dta") # recuerda que es normal si se demora en cargar

# 1. Filtramos y seleccionamos
casen_limpia_2013 <- casen_2013 %>%
  filter(!is.na(pobreza_2013)) %>%
  filter(!is.na(expr), expr > 0) %>%
  # select de las variables a utilizar
  select(region, pobreza_2013, varunit, varstrat, expr, numper, ytotcorh)

# 2. Aplicamos mutate sobre la base ya filtrada
casen_limpia_2013 <- casen_limpia_2013 %>% 
  mutate(
    pobreza_cat = case_when(
      pobreza_2013 == 1 ~ "Pobreza extrema",
      pobreza_2013 == 2 ~ "Pobreza no extrema",
      pobreza_2013 == 3 ~ "No pobres",
      TRUE ~ NA_character_
    )
  )

# 3. Creamos el objeto de diseño (IMPORTANTE: Hay que guardarlo en una variable)
diseno_2013 <- casen_limpia_2013 %>%
  as_survey_design(
    ids = varunit,
    strata = varstrat,
    weights = expr,
    nest = TRUE
  ) 

# 4. Cálculo final
resultado_2013 <- diseno_2013 %>%
  group_by(pobreza_cat) %>%
  summarize(porcentaje = survey_mean(na.rm = TRUE) * 100)

print(resultado_2013) # ver los resultados

# GUARDAR el avance en la carpeta process (carpeta + nombre del archivo)
# Usamos .rds porque mantiene los atributos de R y es muy liviano 
saveRDS(resultado_2013, "input/proc/resultado_2013.rds")
saveRDS(diseno_2013, "input/proc/diseno_2013.rds") # guardamos esto por si acaso


BASE DE DATOS 2011


# Primero forzamos la carga de la librería
library(haven)

# Cargar la base bruta desde input
casen_2011 <- read_dta("input/original/casen_2011.dta") # recuerda que es normal si se demora en cargar

# 1. Filtramos y seleccionamos
casen_limpia_2011 <- casen_2011 %>%
  filter(!is.na(pobreza_2013)) %>%
  filter(!is.na(expr), expr > 0) %>%
  # select de las variables a utilizar
  select(region, pobreza_2013, varunit, varstrat, expr, numper, ytotcorh)

# 2. Aplicamos mutate sobre la base ya filtrada
casen_limpia_2011 <- casen_limpia_2011 %>% 
  mutate(
    pobreza_cat = case_when(
      pobreza_2013 == 1 ~ "Pobreza extrema",
      pobreza_2013 == 2 ~ "Pobreza no extrema",
      pobreza_2013 == 3 ~ "No pobres",
      TRUE ~ NA_character_
    )
  )

# 3. Creamos el objeto de diseño (IMPORTANTE: Hay que guardarlo en una variable)
diseno_2011 <- casen_limpia_2011 %>%
  as_survey_design(
    ids = varunit,
    strata = varstrat,
    weights = expr,
    nest = TRUE
  ) 

# 4. Cálculo final
resultado_2011 <- diseno_2011 %>%
  group_by(pobreza_cat) %>%
  summarize(porcentaje = survey_mean(na.rm = TRUE) * 100)

print(resultado_2011) # ver los resultados

# GUARDAR el avance en la carpeta process (carpeta + nombre del archivo)
# Usamos .rds porque mantiene los atributos de R y es muy liviano 
saveRDS(resultado_2011, "input/proc/resultado_2011.rds")
saveRDS(diseno_2011, "input/proc/diseno_2011.rds") # guardamos esto por si acaso


BASE DE DATOS 2009 # Ojo con esta base

# Solución al error de un solo PSU por estrato (una sola unidad en un estrato)
options(survey.lonely.psu = "adjust")

# Primero forzamos la carga de la librería
library(haven)

# Cargar la base bruta desde input
casen_2009 <- read_dta("input/original/casen_2009.dta")

names(casen_2009)[grep("pob", names(casen_2009))] # confirmar que no es la metodología antigua

# 1. Filtramos y seleccionamos
casen_limpia_2009 <- casen_2009 %>%
  filter(!is.na(pobreza_2013)) %>%
  filter(!is.na(expr), expr > 0) %>%
  # select de las variables a utilizar
  select(region, pobreza_2013, segmento, estrato, expr, numper, ytotcorh) # ya que es base 2009, varunit es segmento y varstrat es estrato

# 2. Aplicamos mutate sobre la base ya filtrada
casen_limpia_2009 <- casen_limpia_2009 %>% 
  mutate(
    pobreza_cat = case_when(
      pobreza_2013 == 1 ~ "Pobreza extrema",
      pobreza_2013 == 2 ~ "Pobreza no extrema",
      pobreza_2013 == 3 ~ "No pobres",
      TRUE ~ NA_character_
    )
  )

# 3. Creamos el objeto de diseño
diseno_2009 <- casen_limpia_2009 %>%
  as_survey_design(
    ids = segmento,
    strata = estrato,
    weights = expr,
    nest = TRUE
  ) 

# 4. Cálculo final
resultado_2009 <- diseno_2009 %>%
  group_by(pobreza_cat) %>%
  summarize(porcentaje = survey_mean(na.rm = TRUE) * 100)

print(resultado_2009) # ver los resultados

# GUARDAR el avance en la carpeta process (carpeta + nombre del archivo)
# Usamos .rds porque mantiene los atributos de R y es muy liviano 
saveRDS(resultado_2009, "input/proc/resultado_2009.rds")
saveRDS(diseno_2009, "input/proc/diseno_2009.rds") # guardamos esto por si acaso

UNIR LAS BASES DE DATOS (2009 - 2022)

library(dplyr) # cargamos estas librerías para poder hacer el gráfico sin problema
library(ggplot2)

# 1. Cargamos y etiquetamos cada año (previamente guardados)
res_09 <- readRDS("input/proc/resultado_2009.rds") %>% mutate(ano = "2009") # mutate para asignarle año a los datos
res_11 <- readRDS("input/proc/resultado_2011.rds") %>% mutate(ano = "2011")
res_13 <- readRDS("input/proc/resultado_2013.rds") %>% mutate(ano = "2013")
res_15 <- readRDS("input/proc/resultado_2015.rds") %>% mutate(ano = "2015")
res_17 <- readRDS("input/proc/resultado_2017.rds") %>% mutate(ano = "2017")
res_22 <- readRDS("input/proc/resultado_2022.rds") %>% mutate(ano = "2022")

# 2. Aqui se unen en una sola base para el gráfico
tabla_final <- bind_rows(res_09, res_11, res_13, res_15, res_17, res_22) %>%
  filter(pobreza_cat != "No pobres") # Solo queremos graficar a los pobres (como en el gráfico original)

CREACIÓN DEL GRÁFICO

library(ggplot2) # cargar la librería para no tener problemas

# 1. Aquí se unen todas las bases en una sola
tabla_final <- bind_rows(res_09, res_11, res_13, res_15, res_17, res_22) %>%
  # Filtramos para no mostrar a los "No pobres" (ya que en el gráfico no se muestran los "no pobres")
  filter(pobreza_cat != "No pobres") %>%
  # Aseguramos que el orden de las categorías sea el correcto en la leyenda (tomamos como ref el gráfico orig)
  mutate(pobreza_cat = factor(pobreza_cat, levels = c("Pobreza no extrema", "Pobreza extrema")))

# 2. Creamos el gráfico
grafico_pobreza <- ggplot(tabla_final, aes(x = ano, y = porcentaje, fill = pobreza_cat)) +
  # Barras apiladas
  geom_bar(stat = "identity", position = "stack", width = 0.7) +
  # Añadimos los números arriba de cada sección (redondeados a 1 decimal)
  geom_text(aes(label = paste0(round(porcentaje, 1), "%")), 
            position = position_stack(vjust = 0.5), 
            color = "white", fontface = "bold", size = 3.5) +
  # Colores oficiales (Azul oscuro para extrema, azul medio para no extrema)
  scale_fill_manual(values = c("Pobreza extrema" = "#003366", 
                               "Pobreza no extrema" = "#3399FF")) +
  # Etiquetas y títulos
  labs(title = "Evolución de la Pobreza en Chile (2009-2022)",
       subtitle = "Porcentaje de personas en situación de pobreza por ingresos",
       x = "Año de la Encuesta Casen",
       y = "Porcentaje (%)",
       fill = "Categoría",
       caption = "Fuente: Elaboración propia basada en microdatos Casen (Metodología 2013)") +
  # Estilo visual limpio
  theme_minimal() +
  theme(
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold", size = 14),
    axis.text = element_text(size = 10)
  )

# 3. Mostrar el gráfico
print(grafico_pobreza)

