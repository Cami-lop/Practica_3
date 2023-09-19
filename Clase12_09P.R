#######CLASE PRACTICA 12/09########


# Creo la matriz M indicandole que complete por filas
A <- matrix(data = c(1, 5, 8, 4, 8, 7, 9, 1, 3),
          ncol = 3, nrow = 3, byrow = T)

A#Matriz 
A[3,2]  # quiero el elemento de la fila dos columna 3


#which -> posiciomnes
velocidad<- matrix(c(10, NA, 15, 1, 5, NA, 20, NA, 50, NA, 12, 16), ncol =4 )
velocidad

which(is.na(velocidad))
#quiero saber si hay posiciones faltantes
which(is.na(velocidad), arr.ind = T)

#EJERCICIO
matriz_pp_verano<-matrix(data=c(28,130,118.9,40,153.2,135.4,43,152.9,127.2),
                         ncol=3, nrow=3)
rownames(matriz_pp_verano)<-c("pp diciembre","pp enero","pp febrero")
colnames(matriz_pp_verano)<-c("Mendoza","Jujuy","Buenos Aires")
matriz_pp_verano

Promedio<-rowMeans(matriz_pp_verano)
Promedio
verano<-cbind(matriz_pp_verano,Promedio)
verano
