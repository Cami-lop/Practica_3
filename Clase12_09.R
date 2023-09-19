
##################################################################
# # Laboratorio de Procesamiento de Informaci?n Meteorol?gica/Oceanogr?fica

# 2º cuatrimestre 2023
##################################################################

# Clase_Array_2 alumnos  Clase 12/09
##############################

#primer reglon e cada seccion son formas de hacer matrices
rm(list=ls())

matrix(8,ncol=2,nrow=4)  
matrix(NA,ncol=2,nrow=4)  #matriz llena de Na
matrix(Inf,ncol=2,nrow=4) #Matriz llena de inf
matrix(NaN,ncol=2,nrow=4) #Matriz llena de, Nan 

b=matrix(runif(6),nrow=3,ncol=2) #Runinf (20) me da 20 valores aleatorios del 0 al 1, pero si quiero de otro intervalo hay que ver como

sample(3:14,4)  # 4 valores aletorios entre 3 y 14
rnorm(4) #4 valores aleatorios de la distribucion normal

#############################################
J=matrix(NA,nrow=3,ncol=1) #matriz con 3 casilleros vacion que se llenan despus 

J[1,1]=readline('Ingrese su edad ')  # se llena x pantalla
J[2,1]=readline('Ingrese su peso ')
J[3,1]=readline('Ingrese su altura ')

########################################
m2 <- matrix(1:15, nrow=5, ncol= 3)
m3<-rbind(1:3,3:1,c(1,1,1),c(2,2,2),c(3,3,3)) # pega x filas

m2 * m3       # por efecto multiplica elemento a elemento

#######################################
x <- 1:4      # x es un vector que multiplica a otra vector
x

z <- x %*% x	#producto interno, me arroja un numero 

drop(z) 		  #resultado del producto interno
y <- diag(x) 	#matriz con diagonal de los valores de x, el resto llena de ceros

y

g <- matrix(1:12, ncol = 3, nrow = 4) #lena x columna
g

y %*% g		#primer fila x primer colunma y asi, consectivamente
y %*% x   #producto matriial entre matriz y vector 
x %*% g		#producto matricial entre vector y matriz

#######################################
A=matrix(c(1:2,3:4), ncol=2,byrow=TRUE)  

det(A) #determinante		

solve(A)  #inversa de a   	

A%*%solve(A) #matriz identidad
#######################################

B=matrix(c(1,8,5,3,0,2,3,6,1), ncol=3,byrow=TRUE)

L=B # 2 matrices iguales, uso  L para modifocar la matriz
# La que cambia es L
L[lower.tri(B)]=0  #triangulo inferior de ceros,  de la diagonal para abajo
L
L[lower.tri(B,diag=TRUE)]=5    # incluye la diagonal, ls elementos que estan en la matriz b la lleno de cero
#Lo usams por ejemloo para la matriz de correlacion, la diagonal de 1 espeja los resultados 
U=B

U[upper.tri(B,diag=TRUE)]=10
U
M=B
M[upper.tri(B,diag=TRUE)]->pp #TRINGULO SUPERIOR, TODOS LOS DATOS QUE TENGAS AHI Y ASIGNALOS A VARIABLE PP
M
####################################

a<-matrix(c(1,1,1,2,2,2,3,3,3,4,4,4),nrow=3,ncol=4)
a
mean(a)               #MEDIA DE TODA LA MATRIZ

colMeans(a,dims=1)		#MEDIA X COLUMNAS, DIMS UNO NO HACE FALTAS EN ESTA FUNCION 
rowMeans(a,dims=1)	  #MEDIA X FILAS 


b<-matrix(c(4,4,4,5,5,5,6,6,6,7,7,7),nrow=3,ncol=4)
b
c=abind(a,b,along=3)          #tenemos que ener a libreria para abind
c                             #ya es un array, dos dimensions 1 tiempo matriz a y segundo tiempo a mi mariz b 
media_1<-apply(c,c(1,3),mean) #nombre de la matriz,a quien ,a lo largo  d quien 
                              #para cada fila dim=1 y c/ tiempo=3, promedio 2 columnas 
#primer columna el promedio de cada fila (asi consecutivamente)


media_2<-apply(c,c(2,3),mean)
#para cada columna  y cada tiempo promeio cada columna 
media_3<-apply(c,c(1,2),mean)
#p. cada column y cada fila ,tengo el valor medio de cada uno de los tiempos

desvio_1<-apply(c,c(1,3),sd) 
desvio_2<-apply(c,c(2,3),sd)
desvio_3<-apply(c,c(1,2),sd)
#sd-> desvio estandar
################################################################################
#Ejemplo clase
#aa matriz
#table(aa)       # te devuelve una tabla
#mm<- table(aa)  # devuelve una tabla con frecuencia d cada valor 
#match(4,2) dado un array te dice donde estan loos valores donde se encuentra el numero/letra
                                 #el de la primera posicion  es 1 y el segundo poscion es  2





## ejemplo de datos de pp en clase
DATA<-"/home/clinux01/Escritorio/CamiLabo/Practica_2/" #llamo desde tal lado 
datos<-read.table(paste(DATA,"juntas_1960-2018.txt", sep= ""), header=TRUE ,sep="", fill=TRUE)
#Header le dio que la primer fila son titulos y no los tomo como variables
datos<-read.table("juntas_1960-2018.txt") #tiene que estar en el mismo lado que el directorio 
datos[datos== -99.9]<-NA  #no puedo yener datos de pp negativos
getwd() # veo donde estoy parada

#Faltaron algunas funciones

