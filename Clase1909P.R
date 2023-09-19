################CLASE PRACTICA 19/09###############
###########          ARRAYS             #########
getwd()
setwd("/home/clinux01/Escritorio/CamiLabo/Practica3/")
datos<-array(data = c(1:120), dim = c(5,6,4))   #le doy datos y dimesiones
datos  #cinco filas , 6 columnas, cuatro tiempos, llena por columnas
dia_2<-datos[,,2] #datos de tiepo 2

dim(dia_2) #dim del tiempo 2
#dim- lon /lat/tiempo/nivel 
promedio_datos<-apply(datos,c(1,2),mean)
promedio_datos # me hace prom de todos los dias= tiempos/ promedio temporal




# Ahora en vez de tener 5 longitudes (filas), 6 latitudes (columnas) y 4 dias,
# reacomodemos para que sean 30 filas (lon*lat) y 4 columnas (dias)
datos_2<- matrix(data= datos, ncol = 4, nrow = 30) #mismo datos con dim (lon 1,lat 1)/(lon 2,lat1)-> punto de reeticula 
datos_2
## Si ahora usamos la funcion rowMeans obtendriamos el promedio en los dias para cada lon-lat,
## y el resultados seria similar al que obtuvimos en promedio_dias
promedio_filas_datos2<- rowMeans(datos_2)
promedio_filas_datos2    #promedio de cada dia



################EJERCICIO EN CLASE####################
rm(list=ls())
 
load("/home/clinux01/Escritorio/CamiLabo/Practica3/datos_viento.RData")  #leer dats o levantarlos 
load("/home/clinux01/Escritorio/CamiLabo/Practica3/datos_dimensiones_viento.RData")
#Obtener el promedio de la temperatura de diciembre para cada nivel y punto de retícula 
datos_viento

viento
dim(viento) #72 filas, 89 columnas , 31 tiempo , 2 niveles (1ºdim=filas/long,2ºdim=colum/lat,3ºdim=tiempos,4ºdim=niveles)

prom_vientos<-apply(viento,c(1,2,4), mean) #mantuve cte lat, lon y los niveles 
prom_vientos                               #para los dos tiempos tengo una matriz 72x89


#Seleccione el nivel de 850hPa y guardar en una matriz el promedio de temperatura sobre el dominio

prom_viento_850<-prom_vientos[,,1] # del prom de diciembre me quedo con el nivel de 850 que es el primero por como estan mis datos  
#dominio = todas lat y long
prom_850_dominio<-mean(prom_viento_850)  #prom de todas las lat y lon para el nivel de 850


#Para el promedio de le temperatura de diciembre del nivel de 200 hPa, sumar todos los valores del dominio y guardarlos en un vector
prom_viento_200<-prom_vientos[,,2]
prom_200_dominio<-sum(prom_viento_200)




