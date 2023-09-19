rm(list=ls())
getwd()
setwd("/home/clinux01/Descargas/CamiLabo/Practica_2/")



##################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanogr�fica
#
# 2� cuatrimestre 2023
##################################################################

###########  CLASE data.frame ALUMNOS#############################

#########################################################
#dataframe es una "matriz" q tiene distintas cosas pero la unica condicion es que tengan la misma dimensiones


iris    #aparece TODA la infomación
print(iris)   #idem iris
plot(iris) 		#representa graficamente
summary(iris) #resumen estadistico basico de las columnas (media, mediana, cuartiles,max, min)
str(iris) 		#"repre textual" del objeto
head(iris) 	  #primeras seis filas
tail(iris)    #ultimas seis filas

########################################

m <- cbind(ord=1:3, edad=c(30L, 26L, 9L))  #creo matriz
v <- c(1.80, 1.72, 1.05) 

ff <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v)
ff <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v,row.names=1)

#############################
WORKDIR <- "/home/clinux01/Descargas/CamiLabo/Practica_2/"   #quiero que la inforrmacion  este en le  mismo lugar donnde guardado mis cosas

setwd (WORKDIR)

mitabla <- read.table("Leer_tabla.txt") 
mitabla
is.data.frame(mitabla) #le pregunto si es o no un dataframe
colnames(mitabla)      #nombre columnas
rownames(mitabla)      #nombre filas

mitabla$Piso  #accedi a la segunda columna

mitabla[[2]]  #accedi a la segunda columna 

mitabla[2]    #accedi a todo la  informacion, fila, columna y datos de la misma, rreseta la informacion 

mitabla[3, 2] #fila 3, columna 2         

mitabla[3, 2] <- 106    #cambie el valor de la fila 3 columna dos 
mitabla$Total <- mitabla$Precio * mitabla$Area  #genere una nueva variable por ende, una nueva variable
mitabla
#######################################################################################################


datosimp <- data.frame(anyos=c(1.3,0.4,1.1,2.3,3.1,1.3),
                       tipo=c(2,3,3,1,3,1),edad=c(22,21,34,42,17,43),
                       sexo=c("H","M","H","H","M","H"))  #distintas cosas pero misma cantidad de elemento
datosimp
attach(datosimp)      #Para poder “llamar” a cada componente utilizo attach( )  
detach(datosimp)      #la operación inversa

datos.hombre.filtrados <- datosimp$anyos[datosimp$sexo=='H']   #creo una varibale que son los anyos de los hombre
datos.hombre.filtrados


mas.peq <- subset(datosimp,anyos<2,select=c(edad,sexo))  #me quedo con algunas cosas, cndicion es que anyos sea menor a dos y ahni, me quedo con columna edad y sexo
mas.peq
attach(datosimp)
edad.final <- edad + anyos    #no afcta al data frame
datosimp <- transform(datosimp, edad.datosimp <- transform(datosimp, edad.final = edad+anyos)final = edad+anyos)  #afecta 
datosimp
datosimp <- transform(datosimp, edad = edad+1) #altera la variable



############################################
#ejercicio solos leer consigna

datos_<-airquality
#1) media de todos los dias
temp_media<-mean(airquality$Temp)
mean(airquality[[4]]) 

#2) media del mes de mayo

temp_m_mayo<-mean(airquality$Temp[airquality$Month=="5"])

#3) dia mas ventoso
max_viento<-max(airquality$Wind)
dia_mes<-subset(airquality,Wind==max_viento,select=c(Month,Day))  #poner igual igual
#hay mas opciones para hacerlo 


#4)ordenar informacion segun criterio de velocidad del vieto ascendente

orden.viento<-airquality[order(airquality$Wind,decreasing=FALSE),]  #La coma es prque le digo que quiero qque ordene todos los datos


#5 tabla adicional con dos variables para el mes de mayo
datosimp <- transform(datosimp, edad.final = edad+anyos)
datos_mayo<-subset(airquality,airquality$Month==5,select<-c(Day,Month,Solar.R))   #Un nuevo data frame del mes de mayo con dia, mes ,R.solar

#6 grafico de mayo
plot(datos_mayo$Solar.R)
############ nuevo 2023 ###################

library(reshape)

head(airquality)

original<-airquality

formato_long<-melt(airquality,id=c("Month","Day"))

formato_long_2<-melt(airquality,id=c("Month"))

formato_long_3<-melt(airquality,id=c("Ozone"))

