#Paquetes para ciencia de datos y GIS.


install.packages("Vegan", "sf","ggplot2","tmap","sp","rgdal", "GISTools", "maptools", "RColorBrewer","tidyverse")

install.packages("Rtools")

# Definimos ipak, función para instalar varios paquetes a la vez. (Repasar como crear funciones).

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# Creamos una variable con el listado de paquetes que llamaremos packages.

data_science = c("vegan", "sf","ggplot2", "tmap", "rgdal", "GISTools", "maptools", "RColorBrewer","tidyverse")

ipak(data_science)


#Para actualizar R

install.packages("installr")
library(installr)
updateR()
