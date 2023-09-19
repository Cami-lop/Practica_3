
##################################################################
# # Laboratorio de Procesamiento de Informacion Meteorologica/Oceanografica
#
# 2º cuatrimestre 2023

##################################################################

setwd("/home/clinux01/Escritorio/CamiLabo/Practica3/")



##### Clase LISTAS Alumnos
#List es una clase de datos que puede contener cero o más elementos, cada uno de los cuales puede ser de una clase distinta  
#no hace falta que tengan mismas dimensiones 

#dataframe puede ser una lista pero una lista no puee ser un dataframe
pp=rnorm(120,mean=20, sd=7)  #120 datos distintos , media=20 , desvio=7
hist(pp)         #calculo histograma 
result=hist(pp)  #lo guardo en una variable
result           #cuando lo pido por patalla me arroja muchos datos
                 # breaks=intervaos / counts=frecuencia / mids=media d cada intervalo
#es una lista, los resultados de las funciones suelen almacenarse en listas 
is.list(result)  #prgunto si es lista


hist(pp,freq=TRUE)
hist(pp,Freq=FALSE)

result=hist(pp)
###################################
familia <- list("Maria", "Juan", 10, c("Hugo", "Paula"), c(8,6))
familia #aparece [[numero]], posiciones en las qu esta cada elemento 
#el $ es cuando le asgino nombres a los elmentos de la lista
lista.ABC <- c(lista.A, lista.B, lista.C)  #puedo unir lisa pero tienen que estar definidas conn anterioridad 


familia <- list(madre="Maria", padre="Juan", casados=10,hijos=c("Hugo", "Paula"), edades=c(8, 6)) #nombre = lo que va adentro
familia  #scon el nombre que le asigne a acada elemento, conviene ponerles nombres para identificar lo que tengo adentro


length(familia)           #5 elemento pero no me importa la ongitud de cada uno
length(familia$casados)   #tamaño de un elemento puntual, tiene una sola cosa guardado
length(familia$hijos)     #tiene dos cosas guardadas en ese elemento    


familia$madre		          #accedo al elemento, metete en familia y despues en madre 
familia[["madre"]] 	      #accedo al elemento
familia[[4]]              #elemento de la posicion 4
familia[[4]][1]           #primer elemento de la posicion 4 
familia[["padre"]] <- "Juan Pedro"  # le cambia el nombre al padre , asigne juan pedro a la columna de padre 
familia$padre   		
##############################    ejemplo  ####################################
familia[[4]][3]<-"Ana"    #agregue un elemento a la "columna" 4
familia$edades[3]<-1      #me paro en la posicion tres y le agrego un elemento 
familia[4]                #todos los elementos de la posicion 4
familia[[4]][2:3]         #posicion 4 y elemento 2 y 3


################################################################################

familia$cumple<-c("3mar","15oct","31dic","7feb","21sep") #le agrego un elemento mas a la lista 

################################################################################

mi.lista <- list(a = 1:3, b = c("hola", "adios"),z=matrix(1:4,2,2))  
#lista a= 123 / b= hola y adios / z= matriz del uno al 4 de 2x2

mi.lista[1:2]         #todos los elementos de a y b

mi.lista[2]           #muestra elementos de b con el titulo
mi.lista[[2]]         # muestra elementos de b peros i el nobre porque ya estoy adentro de b  

is.list(mi.lista[2])  #lista que tiene un nombre con dos elementos
is.list(mi.lista[[2]])#no es una lista ya que es un vector con dos caracteres 

#############################################

air<-airquality

lapply(airquality[, 1:4], mean, na.rm = TRUE) #apply para listas no puedo aplicar la comun porque no tengo dimensiones
#si llegas a ver un valor a no l mires, saltalo 
#me lo devuele como una lista

sapply(airquality[, 1:4], mean, na.rm = TRUE)  #lo devuelve en otro formato pero hace lo mismo que lapply




#########EJERCICI0 EN CLASE################
la_lista<-list(aa=rbinom(10,30,0.5),bb=runif(100,-8-4))
la_lista
media1<-lapply(la_lista, mean, na.rm=TRUE)
media1
media2<-sapply(la_lista,mean)
media2

sum1<-lapply(la_lista,sum, na.rm=TRUE)
sum1
sum2<-sapply(la_lista,sum,.na.rm=TRUE)
sum2



############EJERCICIO 2 EN CLASE##########

datos<-read.table("datos_lista.txt",header = TRUE) #Abrir datos, header=TRUE lo quiero con encabezdo
#seteo el directorio

datos1<-as.list(read.table("datos_lista.txt",header = TRUE))
datos1
corr_BOYA_ErSST<-cor.test(datos$BOYA,datos$ErSST)
# si no le asigno nada,aparece todo.Hace correlacion de Pearson x default
#df=grados de libertad
#int de confianza

x<-corr_BOYA_ErSST$estimate  #busco a variable que quiero de la lista de antes
y<-corr_BOYA_HadSST$estimate
if(x>y){
  print("Corre ErSST es mayor que HadSST")
} else {
  print("Corr HadSSt es mayor que ErSST")
}
corr_BOYA_HadSST<-cor.test(datos$BOYA,datos$HadSST)

#quiero correlacion de los años de LN Y EN para un modelo
datos$obs

corr_BOYA_EN<-cor.test(datos1$BOYA[datos1$obs=="EN"],datos1$ErSST[datos$obs=="EN"])

corr_BOYA_LN<-cor.test(datos1$BOYA[datos1$obs=="LN"],datos1$ErSST[datos$obs=="LN"])

x1<-corr_BOYA_EN$estimate  #busco a variable que quiero de la lista de antes
y2<-corr_BOYA_LN$estimate
if(x1>y2){
  print("Corre EN es mayor que LN")
} else {
  print("Corr LN es mayor que EN")
}

