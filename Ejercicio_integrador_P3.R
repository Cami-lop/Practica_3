rm(list=ls())
getwd()
setwd("/home/clinux01/Descargas/CamiLabo/Practica_3")
load("./datos.Rdata")

#Miremos que dimensiones tiene el array
dimensiones<-dim(datos_PP)
datos_PP[datos_PP==-99.9]<-NA
#Veamos cual es el valor maximo
max(datos_PP)

#Ploteamos un histograma para ver como es la variable
hist(datos_PP,breaks=500,main="Histograma de frecuencias", xlab="Precipitacion [mm]",ylab="Frecuencia")

#Cuantos valores tengo arriba de un determinado umbral
length(which(datos_PP >= 1))/(prod(dim(datos_PP))) #1 mm
length(which(datos_PP >= 5))/(prod(dim(datos_PP))) #5 mm
length(which(datos_PP >= 10))/(prod(dim(datos_PP))) #10 mm
length(which(datos_PP >= 25))/(prod(dim(datos_PP))) #25 mm
length(which(datos_PP >= 100))/(prod(dim(datos_PP))) #100 mm
length(which(datos_PP >= 250))/(prod(dim(datos_PP))) #250 mm
