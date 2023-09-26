# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanografica
# 2° cuatrimestre 2023
#######################################
# Clase Funciones- 26/09
#######################################
getwd()
setwd("/home/clinux01/Escritorio/CamiLabo/Practica_3/")

#entre {} lo que hace
#entre () argumentos de entrada
#nombre <- function(arg_1, arg_2, ..., arg_n) {expresión}

#args(nombre de la función)    lista de argumentos que son necesarios para ejecutar la función.
#formals(nombre de la función) a lista de argumentos y si alguno de ellos tiene valores asignados por omisión, también nos da ese valo

factorial<-function(x) prod(1:x) #producto de uno hasta x
#no pusimos la llave porque es solo un reglon pero por recomendacion lo tenemos q hacer
factorial(4)
factorial(8)

########################################

hipotenusa <- function(x, y) {     
  sqrt(x^2 + y^2)
}


hipotenusa <- function(x, y) {
  return(sqrt(x^2 + y^2))
}
#return<- "devuelve" por pantalla el resultado, no se le asigna ninguna variable

class(hipotenusa)
hipotenusa(2,3)
hipotenusa(y=3,x=2)

#########################################
ff <- function(r) {
  return(pi * r^2)
}
#Acordarse que R difiere entre Mayus. y minuscula

ff(2)

#########################################
# Ejemplo8.R
# Laboratorio de Procesamiento de Información Meteorológica
#

# Creamos una función que calcula el módulo a un vector
############################################

modulo <- function(v) {         # nombro a la función con el nombre "modulo"
  s <- 0                        # inicializo en 0 a la suma de los cuadrados
  for (e_v in v) {              # me desplazo por los elementos del vector
    s <- s + e_v^2              # incremeto la suma de los cuadrados
  }
  sqrt(s)                       # calculo la raíz cuadrado y ese es el resultado
}

# Probamos con un vector

vv <- c(-2, 3, 4, -5)

### Evaluamos la función
modulo(vv)

#OPTIMIZO la pogramación usando la función de agregación sum()
# que toma como argumento un vector y 
# suma uno a uno sus elementos y entrega esa suma como resultado

# Se simplifica la función MODULO

modulo_1 <- function(v) {sqrt(sum(v^2))}

# lo evaluamos con algún vector
modulo_1(vv)
###############################################

# Creamos una funcion que calcule el valor medio de un vector

promedio <- function(v) {
  
  suma <- 0                  # inicializo la suma en cero
  n <- 0                     # voy a contar los elementos del vector
  
  for (e_v in v) {
    suma <- suma + e_v       # sumo cada elemento del vector
    n <- n+1                 # voy contando los elementos
  }
  
(calculo <- suma/n)          # Se calcula e imprime el promedio
write(calculo,"resultado.txt")   #lo almaceno en un archivo

return(suma/n)
}

 

## utilizando las funciones para vectores sum y length optimizamos el programa

hacer_promedio <- function(v) {
  sum(v)/length(v)
}


#con el mismo vector que antes
nums <- runif(32, 10.5, 40.8)
hacer_promedio(nums)

##############################################
#Defino en la funcion un grafico
ejem.fun <- function(x, y, label = "nombre de variable"){
  plot(x, y, xlab = label) }

ejem.fun(1:5,c(2,4,6,8,10))

#para la x numeros del uno al cinco y para la y el vector ese

ejem.fun.2<-function(x){
  y<-x^2
  plot(x, y)}

ejem.fun.2(1:5)  
############################################

grande<-function(x,y){
  y.g<-y>x              #almacena un vector (logico) de T o F de los y que son mayores de x
  x[y.g]<-y[y.g]        #almacena en x el valor en las que dio T el resultado anterior  segun cada posicion correspondiente
  x
}


grande(1:5, c(1,6,2,7,3))
grande(x=1:5, y=c(1,6,2,7,3))
grande(y=c(1,6,2,7,3), x=1:5)
grande(1:5, y=c(1,6,2,7,3))

##########################################
media.total<-function(...) { mean(c(...)) } #calcula el valor medio de lo que yo te pongo,no defino argumentos 

##########################################
#Funciones de control 

hacer_promedio <- function(v) {
  sum(v)/length(v)
media.total<-function(...){
  for (x in list(...)){
    if (!is.numeric(x)) stop("No son numeros")
  }
  mean(c(...))
 }
}

###########################################
#AVISOS
myplot <- function(x,y) {
  if(missing(y)) {
    y <- x
    x <- 1:length(y)
  }
  plot(x,y)
}


myplot(1:20,11:30)
myplot(12:20)

###########################################

xln <- function(x){
  return(-x * log(x))
}
x <- 1:10000 / 10000

plot(x, xln(x), type = "l", xlab = "", ylab = "",
     main = "Funci�n -x * log(x)")


###########################################
#Por defecto compara siempore con cero

grande<-function(x,y=0*x){	
  y.g<-y>x
  x[y.g]<-y[y.g]
  x
}

grande(c(-12:3))
grande(c(1,5),2:3)

###########################################
#Funcion arreglada con avisos (warning)
grande<-function(x,y=0*x){	
  if (missing(y)) warning("Estamos comparando con 0")
  y.g<-y>x
  x[y.g]<-y[y.g]
  x
}
grande(-3:3)

############################################

DosMuestras <- function(y1, y2) {
  n1 <- length(y1); n2 <- length(y2)
  yb1 <- mean(y1); yb2 <- mean(y2)
  s1 <- var(y1); s2 <- var(y2)
  s <- ((n1-1)*s1 + (n2-1)*s2)/(n1+n2-2)
  tst <- (yb1 - yb2)/sqrt(s*(1/n1 + 1/n2))
  tst
}

altura.hombres<-(c(1.78,1.65,1.82,1.69,1.74,1.89,1.67,1.58,1.72,1.64,1.85,1.92,1.70,1.63))
altura.mujeres<-(c(1.56,1.74,1.63,1.58,1.54,1.72,1.63,1.71,1.65))
DosMuestras(altura.hombres,altura.mujeres)

###########################################

fibbonacci <- function(y) {if (y==0 | y==1)     
  return (1)
  F0 <- 1; F1 <- 1; i <- 2
  repeat {
    s <- F0 + F1                 	
    if (i == y)                    
      return (s)              	
    
    F0 <- F1
    F1 <- s
    i <- i+1                           
  } } 


fibbonacci(0) 
fibbonacci(4) 
fibbonacci(8)                  
fibbonacci(1)


#Si ya tengo un scrip que tenga todas mis funciones lo puedo lllamar asi source( mi directrorio entre "") porque sino queda mal 
