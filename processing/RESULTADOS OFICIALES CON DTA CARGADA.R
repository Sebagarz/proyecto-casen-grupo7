library(haven)
library(dplyr)
library(srvyr)
library(ggplot2)

# evitar error con estratos 
options(survey.lonely.psu = "adjust")


calcular_pobreza_oficial <- function(ruta_dta, anio, v_ids = "varunit", v_strata = "varstrat") {
  
  cat("Procesando resultados oficiales año:", anio, "...\n")
  base <- read_dta(ruta_dta)
  
  # limpieza estandar
  resultado <- base %>%
    filter(!is.na(pobreza_2013), !is.na(expr), expr > 0) %>%
    # filtro opcional: Solo si la variable de parentesco existe, excluimos servicio doméstico
    mutate(pobreza_cat = case_when(
      pobreza_2013 == 1 ~ "Pobreza extrema",
      pobreza_2013 == 2 ~ "Pobreza no extrema",
      pobreza_2013 == 3 ~ "No pobres",
      TRUE ~ NA_character_
    )) %>%
    as_survey_design(ids = !!sym(v_ids), strata = !!sym(v_strata), weights = expr, nest = TRUE) %>%
    group_by(pobreza_cat) %>%
    summarize(porcentaje = survey_mean(na.rm = TRUE) * 100) %>%
    mutate(ano = as.character(anio))
  
  return(resultado)
}


res_22 <- calcular_pobreza_oficial("input/data/original/casen_2022.dta", 2022)
res_17 <- calcular_pobreza_oficial("input/data/original/casen_2017.dta", 2017)
res_15 <- calcular_pobreza_oficial("input/data/original/casen_2015.dta", 2015)
res_13 <- calcular_pobreza_oficial("input/data/original/casen_2013.dta", 2013)
res_11 <- calcular_pobreza_oficial("input/data/original/casen_2011.dta", 2011)
res_09 <- calcular_pobreza_oficial("input/data/original/casen_2009.dta", 2009, "segmento", "estrato")

tabla_final <- bind_rows(res_09, res_11, res_13, res_15, res_17, res_22) %>%
  filter(pobreza_cat != "No pobres") %>%
  mutate(pobreza_cat = factor(pobreza_cat, levels = c("Pobreza no extrema", "Pobreza extrema")))

# creamos el grafico
ggplot(tabla_final, aes(x = ano, y = porcentaje, fill = pobreza_cat)) +
  geom_bar(stat = "identity", position = "stack", width = 0.7) +
  geom_text(aes(label = paste0(round(porcentaje, 1), "%")), 
            position = position_stack(vjust = 0.5), color = "white", fontface = "bold") +
  scale_fill_manual(values = c("Pobreza extrema" = "#003366", "Pobreza no extrema" = "#3399FF")) +
  theme_minimal() +
  labs(title = "Evolución de la Pobreza en Chile (2009-2022)", caption = "Fuente: Ministerio de Desarrollo Social y Familia")



ggsave("output/graphs/grafico_evolucion_pobreza.png", 
       width = 10, 
       height = 7, 
       dpi = 300)

#guardamos rds para evitar procesar todas las bases brutas

saveRDS(res_09, "input/data/proc/res_09.rds")
saveRDS(res_11, "input/data/proc/res_11.rds")
saveRDS(res_13, "input/data/proc/res_13.rds")
saveRDS(res_15, "input/data/proc/res_15.rds")
saveRDS(res_17, "input/data/proc/res_17.rds")
saveRDS(res_22, "input/data/proc/res_22.rds")









