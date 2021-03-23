### Boletin sismologico 2020

## Autor: WJLV0425
## Fecha: 19/03/21

# Mandato

# Crear una base de datos que contenga las provincias por separado
# Hacer un mapa de densidad sísmica del 2019 por provincias
# Establece correlación entre la cantidad de sismos por provincias y la densidad de fallas geológicas. 


  
# Convertir archivo .txt a CSV: Abrir libro de excel -> ir a "Datos" (barra superior) -> Obtener datos externos -> abrir el archivo .txt -> guardar como archivo CSV.

#Abrir archivo CSV.
  #Actualizar paquetes para importar datos CSV: 'readr', 'Rcpp'.

install.packages("readr", "Rcpp")
library(readr)
Sismos2020 <- read_csv("Sismos2020.csv")
View(Sismos2020)

# En QGIS fue utilizada la herramienta clip (cortar) (Toolbox -> Vector overlay -> Clip), para extraer los sismos que tuvieron lugar sobre la superficie del territorio dominicano.
# Fue utilizado el proceso "sumar longitud de líneas" para sumar todas las fallas acorde  los polígonos en que se encuentran contenidas, luego fueron creadas y adjuntadas las columnas "Distancia (lenght) y cantidad de fallas" a la informaciñon contenida en la matriz de atributos de la capa "PROVCenso2010", creando la capa "SFP". Por último, fue sumada la información de los sismos sucedidos en tierra firme dominicana para el año 2020 a la capa "SFP", mediante el proceso `Unir atributos por localización`. (Se puede acceder a los procesos de forma directa a través de la caja de herramientas de procesos).

#Proceso 1:  Barra superior -> Vectorial -> Herramientas de análisis -> Sumar longitud de líneas. (Insertar imagen proceso1)

#Proceso 2: Barra superior -> Vectorial -> Herramientas de gesión de datos -> Unir atributos por localización. (Insertar imagen proceso2)




