install.packages("learnr") # solo una vez#·install.packages("devtools") # solo una vez
devtools::install_github("dgonxalex80/paqueteMET")
library(paqueteMET)
data(vivienda_faltantes)

str(vivienda_faltantes)

faltantes <- colSums(is.na(datosNA))
faltantes

# install.packages("naniar")
library(naniar)
gg_miss_var(datosNA)


# install.packages("mice")
library(mice)
grafico <-md.pattern(datosNA, rotate.names = TRUE)

datosSINA <- na.omit(datosNA)  # elimina todos los valores con  NA
grafico <-md.pattern(datosSINA, rotate.names = TRUE)

media_parquea <- mean(datosNA$parquea, na.rm = TRUE)
datosNA$parquea[is.na(datosNA$parquea)] <- media_parquea

# install.packages("DescTools")
library(DescTools)
moda_piso <- Mode(datosNA$piso, na.rm = TRUE)
datosNA$piso[is.na(datosNA$piso)] <- moda_piso
grafico <-md.pattern(datosNA, rotate.names = TRUE)



vivienda2 <- vivienda_faltantes
vivienda2$parquea <- vivienda_faltantes[vivienda2$parquea= & vivienda2$tipo=="casa" & vivienda2$piso=1] <-1