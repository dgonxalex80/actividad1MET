# PROCESO DE IMPUTACION 1 
# paquete para la imputacion de datos
library(mice) 

# paquete del curso Metodos y Simulacion Estadistica Ms CdeD
library(paqueteMET)

# base de datos contenida en paqueteMET
data(vivienda_faltantes) 

# grafico para visualizar los datos faltantes
md.pattern(vivienda_faltantes, rotate.names = TRUE)  


# Función para encontrar la moda
find_mode <- function(x) {
  uniq_x <- unique(x)
  mode_freq <- tabulate(match(x, uniq_x))
  uniq_x[which.max(mode_freq)]
}

# Calcular y almacenar la moda por barrio y tipo
modas <- aggregate(piso ~ barrio + tipo, vivienda_faltantes, find_mode)

# Imputar los valores de las modas en los respectivos valores faltantes de piso
for (i in 1:nrow(vivienda_faltantes)) {
  if (is.na(vivienda_faltantes$piso[i])) {
    moda <- modas$barrio == vivienda_faltantes$barrio[i] & modas$tipo == vivienda_faltantes$tipo[i]
    vivienda_faltantes$piso[i] <- moda
  }
}


md.pattern(vivienda_faltantes, rotate.names = TRUE)
# 