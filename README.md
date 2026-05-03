# Template reporte reproducibilidad

Link al reporte [**AQUÍ**](https://data-soc.github.io/template-repro/)

Este repositorio contiene una plantilla para el reporte de reproducibilidad del Trabajo 1 del curso [Investigación Social Abierta](https://cienciasocialabierta.cl/2026/). La plantilla está diseñada para ser clonada y modificada por cada estudiante, siguiendo el protocolo [IPO](https://lisacoes.com/protocolos/a-ipo-rep/) (IInput-Processing-Output) y utilizando el formato Quarto.

<img src="https://lisacoes.com/protocolos/a-ipo-rep/ipo-hex.png" alt="IPO" width="220" />


Para comenzar, el working tree fue eliminado debido a que surgieron erroes al cambiar nombres de algunas carpetas especificas. Con esto haremos una revisión de las carpetas principales del proyecto:


repositorio que cuenta con las bases sincronizadas de la casen desde el año 2009 al año 2022, regida mediante la nueva metodologia de 2024.

las carpetas principales de trabajo son las siguientes:

input/data/original: acá estan las bases de datos brutas de la casesn, estas no están subidas a github debido a que son muy pesadas.

input/data/proc: acá están los archivos .rds ya procesados y filtrados, estos archivos permiten la renderización de los resultados de una manera rapida sin tener que cargar las bases de datos brutas.

processing: script de R utilizados para la limpieza y la salida de resultados, el primero "Limpieza final" es basicamente la limpieza de las bases y la armonizacón de estas con la carga de las .dta, el otro script "resultados finales" es el que se utilizará para renderizar los resultados, debido a que toma los .rds ya procesados y los une. 

output/graph: acá se encuentra la tabla realizada.

scripts borradores: acá se encuentras script que no se utilizaron finalmente, fueron parte del aprendizaje y error, ya que finalmente encontramos una manera más facil de limpiar los datos sin que sean varios scripts.


INSTRUCCIONES PARA REPRODUCCIÓN.

1. CLONAR REPOSITORIO: Descargue la carpeta o use el git clone
2. ENTORNO DE R: Asegurese de tener instaladas las librerias dplyr y ggplot 2
3. RENDERIZAR: Abrir el archivo index.qmd en visual code y presione el boton de preview, el codigo detectará automaticamente los archivos input/data/proc y generará el grafico final sin la necesidad de tener que procesar todas las bases brutas.





METODOLOGIA LIMPIEZA

Se hicieron algunas operaciones que son fundamentales para la reproducción del grafico.

Dado que la casen es una encuesta con diseño muestral complejo se utilizó la libreria svyr.
Se diseñó una función que autonomiza la limpieza de datos para cada año de la serie (2009-2022)
Filtros de Calidad: Se eliminan casos con valores perdidos (NA) en la variable de pobreza y se aseguran factores de expansión (expr) mayores a cero.
Recodificación: La variable original pobreza_2013 se transforma de valores numéricos a categorías conceptuales (Pobreza extrema, Pobreza no extrema y No pobres).
Inferencia: Se define el diseño de encuesta (as_survey_design) utilizando las variables de conglomerado (ids) y estratificación (strata) específicas de cada año

Para concluir, el script de limpieza no solo termina generando el grafico, si no que exporta los resultados de cada año como archivos .rds, haciendo que se pueda saltar la fase de procesamiento de bases brutas.













