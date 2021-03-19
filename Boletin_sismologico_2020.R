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

# En QGIS fue utilizada la herramienta clip (Toolbox -> Vector overlay -> Clip), para extraer los sismos que tuvieron lugar sobre la superficie del territorio dominicano.




