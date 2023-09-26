########## Clase Practica 26/09 #############
###########  FUNCIONES ###########

getwd() 
setwd("/home/clinux01/Escritorio/CamiLabo/")
rm(list=ls())
nudos_a_ms <- function(viento) {
  ms <- viento * 0.5144
  return(ms)          
}

#Ejercicio 1 -> de ms a nudos 

ms_a_nudos <-function(viento1){
  ns<-viento1/0.5144
  return(ns)                 
}

ms_a_nudos(viento1 = 1)

#Ejemplo1.bis- Hago mas detallado el codigo
# la función primero revise si el o los elementos de entrada cumplen con determinadas condicion
# si no es numerico para la funcion
nudos_a_ms <- function(viento) {
  if (!is.numeric(viento)) stop("viento no es numérico")
  ms <- viento * 0.5144
  return()
}
# Para R >= 4.0
# stopifnot("No es numerico" = is.numeric(viento))
# ¿Es de tipo numérico?
#Ejercicio 2-ventajas de usar funnciones
datos_viento <- data.frame(hora = seq(0, 9),
                           viento = c(21.58, 18.08, 7.19, 7.19, 7.19, 7.19, 7.19,
                                      3.69, 3.69, 7.19))
head(datos_viento)

datos_viento$viento_ms <- nudos_a_ms(datos_viento$viento)
head(datos_viento)
class(datos_viento$viento)
#datos_viento$viento <- es un vector, es lo que sea es variable en el dataframe


#Ejercicio 3-Argumentos por defectos
nudos_a_ms <- function(viento, conversion = 0.51) {
  if (!is.numeric(viento)) stop("viento no es numérico")
  ms <- viento * conversion
  return(ms)
}


#Ejercicio en grupo
convertir_viento<-function(viento){
  if(unidad=="nudos"){
    ms <- viento * 0.5144
    return(ms)          
  }else if(unidad=="metros"){
    ns<-viento/0.5144
    return(ns)
}else(unidad!="metros" & unidad!="nudos")
  print("ERROR")
}  
unidad<-readline("Ingrese en que unidad va a estar el dato de viento (nudos o metros)")
convertir_viento(1)    


########################### CLASE LISTA 26/09 ##############################

familia <- list("Maria","Juana", 10, c("Hugo", "Paula"),
                c(8,7)) #genero la lista familia
familia

#Agrego nombres 
familia <- list(madre = "Maria", tia = "Juana",
            casados = 10,hijos = c("Hugo","Paula"),
            edades = c(8, 6))

#Veo el conteiner de afuera
familia[2]

familia["tia"]

familia[c(2,4)]

familia[c("tia", "hijos")]

#Accedo al contenido de cada elemento 

familia[[2]]  #la clase ya no es un alista como en lo anterior, sino que es un caracater

familia$tia

familia[["tia"]]

#Agregar coponentes
familia$mascotas <- "Gato"

familia[7] <- "Auto"

#Eliminar componente

familia$edades <-NULL

familia[[5]] <-NULL

#Concatenacion de listas

familia_2 <- list(mascotas = "Gato",
                  vacaciones_favoritas = c("Mar del Plata"),
                      familia_concatenada <- c(familia, familia_2))
familia_concatenada

#Operaciones  avanzadas
mi_lista <- list(x = c(1, 3, 5), y = c(2, 2, 3))
lapply(mi_lista, function(x) mean(x))



#Ejercicio 

alumnas<-list(nombres=c("Maite","Cande","Cami"),
              edad=as.numeric(c(22,22,21)))
prom_edades<-mean(alumnas$edad)

alumnas$promedio_edades<-prom_edades
alumnas
