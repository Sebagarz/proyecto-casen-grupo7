
library(dplyr)
library(ggplot2)

# 1. Cargar los resultados oficiales (previamente calculados)
res_09 <- readRDS("output/res_09.rds")
res_11 <- readRDS("output/res_11.rds")
res_13 <- readRDS("output/res_13.rds")
res_15 <- readRDS("output/res_15.rds")
res_17 <- readRDS("output/res_17.rds")
res_22 <- readRDS("output/res_22.rds")

# 2. Unir y preparar para el gráfico
tabla_final <- bind_rows(res_09, res_11, res_13, res_15, res_17, res_22) %>%
  filter(pobreza_cat != "No pobres") %>%
  mutate(pobreza_cat = factor(pobreza_cat, 
                              levels = c("Pobreza no extrema", "Pobreza extrema")))

# 3. Gráfico Final (Estética oficial Grupo 7)[cite: 1]
ggplot(tabla_final, aes(x = ano, y = porcentaje, fill = pobreza_cat)) +
  geom_bar(stat = "identity", position = "stack", width = 0.7) +
  # Etiquetas con el primer decimal oficial
  geom_text(aes(label = paste0(round(porcentaje, 1), "%")), 
            position = position_stack(vjust = 0.5), 
            color = "white", fontface = "bold", size = 3.5) +
  # Colores institucionales definidos por el equipo[cite: 1]
  scale_fill_manual(values = c("Pobreza extrema" = "#003366", 
                               "Pobreza no extrema" = "#3399FF")) +
  labs(title = "Evolución de la Pobreza en Chile (2009-2022)",
       subtitle = "Porcentaje de personas en situación de pobreza por ingresos",
       x = "Año de la Encuesta Casen",
       y = "Porcentaje (%)",
       fill = "Categoría",
       caption = "Fuente: Elaboración propia basada en microdatos Casen (MDSF)") +
  theme_minimal() +
  theme(legend.position = "bottom", plot.title = element_text(face = "bold"))




