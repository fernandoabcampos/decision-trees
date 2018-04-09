library(plotrix) # pie chart


# Para definir el algoritmo de lectura read.csv o read.csv2
L <- readLines("titanic.csv", n = 1) 
if (grepl(",", L)) print("English format")


df <- read.csv("~/Desktop/titanic.csv", header=TRUE, encoding = "UTF-8")
head(df)


#Mirando los nombres de columnas del dataframe y despues los tipos de variables estadisticas
colnames(df)
sapply(df,class)
str(df)
summary(df) 

levels(df$AGE)[levels(df$AGE)=="Ni�o"] <- "Niño"


not_adult <- df[!(df$AGE == "Adulto"), ]
not_adult


sexo <- table(df$SEX)
lbls <- paste(names(sexo), "\n", sexo, sep="")
pie3D(sexo
      , radius=0.9
      , labelcex= 0.8
      , labels = lbls
      , explode=0.0
      , main="Sexo de los pasajeros"
      , col = rainbow(length(lbls)
      ))

no_supervivientes <- df[(df$SURVIVED == "Muere"), ]
sexo_muertos <- table(no_supervivientes$SEX)
lbls <- paste(names(sexo_muertos), "\n", sexo_muertos, sep="")
pie3D(sexo_muertos
      , radius=0.9
      , labelcex= 0.8
      , labels = lbls
      , explode=0.0
      , main="Deaths (amount per sex)"
      , col = rainbow(length(lbls)
      ))
