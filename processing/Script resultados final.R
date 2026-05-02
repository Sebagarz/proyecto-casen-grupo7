
#cargamos librerias

pacman::p_load(haven, dplyr, srvyr, ggplot2)

# Ajuste para estratos con una sola unidad (evita errores en bases antiguas)
options(survey.lonely.psu = "adjust")


# acá se abren los RDS, ( data prerada) y aplicamos la logica del script anterior)
obtener_resumen <- function(ruta_rds, anio, u_ids = "varunit", u_strata = "varstrat") {
  
  cat("Calculando resultados para el año:", anio, "\n")
  
  # Cargar la base preparada 
  data <- readRDS(ruta_rds)
  
  # cración de categorias
  data <- data %>%
    mutate(pobreza_cat = case_when(
      pobreza_2013 == 1 ~ "Pobreza extrema",
      pobreza_2013 == 2 ~ "Pobreza no extrema",
      pobreza_2013 == 3 ~ "No pobres",
      TRUE ~ NA_character_
    ))
  
  # Aplicar diseño muestral y cálculo de porcentajes
  resultado <- data %>%
    as_survey_design(
      ids = !!sym(u_ids), 
      strata = !!sym(u_strata), 
      weights = expr, 
      nest = TRUE
    ) %>%
    group_by(pobreza_cat) %>%
    summarize(porcentaje = survey_mean(na.rm = TRUE) * 100) %>%
    mutate(ano = as.character(anio)) 
  
  return(resultado)
}

# ejecución de cada año 
res_09 <- obtener_resumen("input/data/proc/data_preparada_2009.rds", 2009)
res_11 <- obtener_resumen("input/data/proc/data_preparada_2011.rds", 2011)
res_13 <- obtener_resumen("input/data/proc/data_preparada_2013.rds", 2013)
res_15 <- obtener_resumen("input/data/proc/data_preparada_2015.rds", 2015)
res_17 <- obtener_resumen("input/data/proc/data_preparada_2017.rds", 2017)
res_22 <- obtener_resumen("input/data/proc/data_preparada_2022.rds", 2022)



# preparación de grafico.

tabla_grafico <- bind_rows(res_09, res_11, res_13, res_15, res_17, res_22) %>%
  filter(pobreza_cat != "No pobres") %>% 
  mutate(pobreza_cat = factor(pobreza_cat, 
                              levels = c("Pobreza no extrema", "Pobreza extrema")))

#visualización Final 
grafico_pobreza <- ggplot(tabla_grafico, aes(x = ano, y = porcentaje, fill = pobreza_cat)) +
  geom_bar(stat = "identity", position = "stack", width = 0.7) +
  geom_text(aes(label = paste0(round(porcentaje, 1), "%")),
            position = position_stack(vjust = 0.5),
            color = "white", fontface = "bold", size = 3.5) +
  #colores oficiales
  scale_fill_manual(values = c("Pobreza extrema" = "#003366", 
                               "Pobreza no extrema" = "#3399FF")) +
  # títulos y fuente
  labs(title = "Evolución de la Pobreza en Chile (2009-2022)",
       subtitle = "Porcentaje de personas en situación de pobreza por ingresos",
       x = "Año de la Encuesta Casen",
       y = "Porcentaje (%)",
       fill = "Categoría",
       caption = "Fuente: Elaboración propia basada en microdatos Casen (Metodología 2013)") +
  theme_minimal() +
  theme(legend.position = "bottom",
        plot.title = element_text(face = "bold", size = 14))

#mostrar Gráfico
print(grafico_pobreza)




