############### CLASE PRACTICA 19/09################
          ######## DATA FRAME #########

#Ejercicio en clase
rm(list=ls())
getwd()
df_parcela<-data.frame(
  "Base"=1:4,
  "Altura" =4:7,
  row.names=c("Parcela 1","Parcela 2", "Parcela 3", "Parcela 4")
  )
df_parcela
sup<-df_parcela[,1]*df_parcela[,2] 
df_parcela1<-data.frame(df_parcela,sup)
df_parcela1
