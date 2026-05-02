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
 |  |- res_09.rds
 |  |- res_11.rds
 |  |- res_13.rds
 |  |- res_15.rds
 |  |- res_17.rds
 |  |- res_22.rds
 |  |- tables/
 |  |  |- tabla_pobreza_2022.rds
 |- processing/
 |  |- 01a_preparacion_2022.R
 |  |- 02a_preparacion_2017.R
 |  |- 04a_preparacion_2013.R
 |  |- 05_preparacion_2011.R
 |  |- 06_preparacion_2009.R
 |  |- 3a_preparacion_2015.R
 |  |- README-prod.md
 |  |- RESULTADO OFICIAL CON RDS.R
 |  |- RESULTADOS OFICIALES CON DTA CARGADA.R
 |  |- Script resultados final.R
 |  |- prod_analysis.Rmd
 |  |- prod_analysis.html
 |  |- prod_prep.Rmd
 |  |- prod_prep.html
 |  |- script resultados.R
 |- proyecto-casen-grupo7.Rproj
 |- scripts/
 |  |- update-working-tree.sh
```
<!-- WORKING_TREE_END -->

Este working tree incorpora las carpetas y archivos principales relevantes del repo (omite algunas) y se actualiza automáticamente al hacer commit mediante una github action que se encuentra definida en el archivo `.github/workflows/update-working-tree.yml`. El propósito de esta acción es mantener un registro actualizado de la estructura del proyecto, lo que facilita la navegación y organización de los archivos para los estudiantes.


repositorio que cuenta con las bases sincronizadas de la casen desde el año 2009 al año 2022, regida mediante la nueva metodologia de 2024.

las carpetas principales de trabajo son las siguientes:

input/data/original: acá estan las bases de datos brutas de la casesn, estas no están subidas a github debido a que son muy pesadas.
input/data/proc: acá están las bases de datos limpias en formato .rds, estos datos ya están armonizados y listos para analizar.
processing: scripts R de limpieza de bases, hay un script que habla sobre analisis casen 2022, este ignorarlo, debido a que solo eran pruebas para ver si funcionaba bien
luego esta será eliminada.

output: esta carpeta aún está vacia debido a que acá irán todas las tablas y graficos que se hagan.

METODOLOGIA LIMPIEZA

Para el filtro de selección se trabajó  exclusivamente con el nucleo principal de cada hogar (nucleo==1)
para el ingreso armonizado, se calculó el ingreso automono equivalente (yae) utilizando la equivalencia oficial recomendada = yae= ytotcorh/numper^07

tambien, se utilizó la varibale pobreza_2013 en todas las bases para aplicar la metodologia a los años anteriores y posteriores, así haciendo una comparacion válida

se utilizó la libreria (srvyr) para la configuracion de objetos de diseño complejo considerando factores de expansion, estratos y conglomerados
PD: para la base 2009 se implementó el ajuste nest=TRUE debio a la estructura de cluster de ese año


-----------------------------------analisis---------------------------------------


para realizar los analisis recomiendo evitar subir las bases de datos brutas, en su lugar, utilizar los archivos directamente procesados.

ejemplo: data_2022 <- readRDS("input/data/proc/data_preparada_2022.rds")

tambien, el script del analisis en un script nuevo script aparte, solamente uno para que se pueda hacer una tabla con todos los resultados y no vean probemlas.















