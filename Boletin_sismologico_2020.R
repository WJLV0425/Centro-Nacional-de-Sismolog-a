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

#Proceso 1:  Barra superior -> Vectorial -> Herramientas de análisis -> Sumar longitud de líneas. (Insertar imagen proceso1).

#Proceso 2: Barra superior -> Vectorial -> Herramientas de gesión de datos -> Unir atributos por localización. (Insertar imagen proceso2).

#Proceso 3 (contar puntos por polígono): Barra superior -> Vectorial -> Herramientas de análisis -> Contar puntos en un polígono.

# Para realizar cambios en la tabla de atributos (convertir distancias m a km, por ejemplo): Caja de herramientas de procesos -> Tabla vectorial -> Caluculadora de campos.

#Para realizar cambios de cualquier tipo a la tabla de atributos, ir a "Tabla Vectorial" en la caja de herramientas (QGIS).



#Instalando rmarkdown y lo necesario para bregar documentos en PDF::


install.packages('rmarkdown')
install.packages('tinytex')
tinytex::install_tinytex()  # install TinyTeX
rmarkdown::pandoc_version()

#Un doc Rmarkdown está compuesto por metadata (YAML), código y texto. La metadata va dentro de tres barras ``----``.  https://bookdown.org/yihui/bookdown/r-markdown.html #Para más info, compa.



# Para subir archivos de gran tamaño a github. "El Tali recomienda usar otra plataforma".
#1) Descargar e instalar la extension de comandos Git desde https://git-lfs.github.com/



Correr en la consola de Git:
  
git lfs install #Para actualizar mi cuenta.
git lfs track "*.tipo de archivo (KML, SHAPEFILE, gpkg, etc" #Para seleccionar en cada uno de los repositorios en que quiero utilizar Git Large Files Storage (LFS) para trabajar un archivo.

git add .gitattributes #Para asegurarse de que git LFS está en cadena 

#Para eliminar el último commit lioso sin afectar los demás.

git reset --soft HEAD~1 #Para eliminar el commit lioso sin afectar los posteriores a este.
git revert HEAD # Para devolver la cuestión si ya hemos realizado push.
git reset --hard HEAD~1 #Para eliminar el commit pendiente y todos los posteriores.






