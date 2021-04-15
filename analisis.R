#Cargar paquetes

ipak(data_science)
library(dplyr) #Para manipular el data.frame.
install.packages("vegan")
library(vegan)
library(sf)
library(tidyverse)
library(sf)
library(rgdal)
library(maptools)
library(tmap)
library(GISTools)
library(RColorBrewer)

#Leer archivo de excel, csv, etc.

readr::read_csv ("sismos2020.csv") #para obtener info sobre el archivo.
sismos2020 = read.csv("sismos2020.csv")
View(sismos2020)


d <- read_fwf('Sismos2020.csv', fwf_widths(c(11, 11, 8, 10, 6, 4), col_names = c('fecha', 'hora', 'latitud', 'longitud', 'prof', 'mc')), skip = 1)
d_sf <- d %>% st_as_sf(coords=c('longitud', 'latitud'), crs = 4326)

plot(d_sf)

#Empleo de tydiverse para análisis de datos.

sismos2020 %>% 
  select (Fecha)

class(sismos2020)

#Convertir data.frame en objeto `sf` "simple feature" para realizar análisis espacial.

s2020 = read.csv("sismos2020.csv", stringsAsFactors = FALSE) 

#Para convertir data.frame en objeto espacial.
coordinates (s2020) = c("Longitud", "Latitud")
str(s2020) 

#Para leer archivo geoespacial

RD = readOGR("C:/Users/wjlv0425.MSI/OneDrive/Documentos/ShapeFilesCenso2010", "PROVCenso2010", encoding = "UTF-8")
str(s2020)
str(RD)

#Bregando el mapa con rgdal.

choropleth(RD, as.numeric(as.factor(Mapa_RD$TOPONIMIA)))
unique(RD$TOPONIMIA) #32 valores únicos.
colors = colorRampPalette(brewer.pal(12, "Set3"))(33)
RD$TOPONIMIA = as.factor(as.character(RD$TOPONIMIA))
spplot(RD, "TOPONIMIA", main = "República Dominicana: División Administrativa de Segundo Nivel", col.regions = colors, col = "White", order(RD$TOPONIMIA))


#Bregando el mapa con tmap.

tm_shape(RD) + #shapefile usado.
  tm_borders() + #Capa de bordes.
  tm_fill(col="TOPONIMIA", ) + # Variable contenedora de la información a representar.
  tm_compass() + # This puts a compass on the bottom right of the map 
  tmap_style("white") + #Supongo que este estilo es lo que proporciona los colores del mapa, por lo que es necesario buscar otros estilos.
  tm_layout(legend.outside = TRUE) +
  tmap_options(max.categories = 33) + tm_polygons("pop_est") + tm_shape(s2020) + tm_bubbles("Mc")


plot(RD)
plot(s2020)

#Bregando el mapa con ggplot2.
