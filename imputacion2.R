# PROCESO DE IMPUTACION 2
# paquete para la imputacion de datos
library(mice) 
# paquete del curso Metodos y Simulacion Estadistica Ms CdeD
library(paqueteMET)
# base de datos contenida en paqueteMET
data(vivienda_faltantes) 
#----------------------------------------------------------------------------

# grafico para visualizar los datos faltantes
md.pattern(vivienda_faltantes, rotate.names = TRUE) 

# se eliminan las variables con mayor numero de NAs -------------------------
variables <- c("id", "zona", "estrato", "preciom", "areaconst", "banios",
               "habitac", "tipo", "barrio", "longitud", "latitud"  )

viviendaNA <- vivienda_faltantes[,variables]
md.pattern(viviendaNA, rotate.names = TRUE) 

# elimina todos los valores con  NA
viviendaSINA <- na.omit(viviendaNA) 

md.pattern(viviendaSINA, rotate.names = TRUE) 


