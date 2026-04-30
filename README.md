# Template reporte reproducibilidad

Link al reporte [**AQUÍ**](https://data-soc.github.io/template-repro/)

Este repositorio contiene una plantilla para el reporte de reproducibilidad del Trabajo 1 del curso [Investigación Social Abierta](https://cienciasocialabierta.cl/2026/). La plantilla está diseñada para ser clonada y modificada por cada estudiante, siguiendo el protocolo [IPO](https://lisacoes.com/protocolos/a-ipo-rep/) (IInput-Processing-Output) y utilizando el formato Quarto.

<img src="https://lisacoes.com/protocolos/a-ipo-rep/ipo-hex.png" alt="IPO" width="220" />

## Working tree del proyecto

Este proyecto se organiza de la siguiente manera: 

<!-- WORKING_TREE_START -->
```text
proyecto-casen-grupo7/
 |- .gitignore
 |- .vscode/
 |  |- settings.json
 |- 05_preparacion_2011.R
 |- README.md
 |- index.html
 |- index.pdf
 |- index.qmd
 |- input/
 |  |- bib/
 |  |- data/
 |  |  |- original/
 |  |  |- proc/
 |  |  |  |- data_preparada_2009.rds
 |  |  |  |- data_preparada_2011.rds
 |  |  |  |- data_preparada_2013.rds
 |  |  |  |- data_preparada_2015.rds
 |  |  |  |- data_preparada_2017.rds
 |  |  |  |- data_preparada_2022.rds
 |  |- images/
 |  |- original-code/
 |- libs/
 |  |- ocs.scss
 |- output/
 |  |- graphs/
 |  |- tables/
 |  |  |- tabla_pobreza_2022.rds
 |- processing/
 |  |- 01a_preparacion_2022.R
 |  |- 01b_analisis_2022.R
 |  |- 02a_preparacion_2017.R
 |  |- 04a_preparacion_2013.R
 |  |- 06_preparacion_2009.R
 |  |- 3a_preparacion_2015.R
 |  |- README-prod.md
 |  |- casen2022.R
 |  |- prod_analysis.Rmd
 |  |- prod_analysis.html
 |  |- prod_prep.Rmd
 |  |- prod_prep.html
 |- proyecto-casen-grupo7.Rproj
 |- scripts/
 |  |- update-working-tree.sh
```
<!-- WORKING_TREE_END -->

Este working tree incorpora las carpetas y archivos principales relevantes del repo (omite algunas) y se actualiza automáticamente al hacer commit mediante una github action que se encuentra definida en el archivo `.github/workflows/update-working-tree.yml`. El propósito de esta acción es mantener un registro actualizado de la estructura del proyecto, lo que facilita la navegación y organización de los archivos para los estudiantes.


