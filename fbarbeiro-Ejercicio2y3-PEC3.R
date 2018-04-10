install.packages("C50")
library(C50)


##################### EJERCICIO 2. TITANIC ##########################################################

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

#Eliminando caracteres com problemas
levels(df$AGE)[levels(df$AGE)=="Ni�o"] <- "Niño"

# Obtain train set (80%) and test set (20%)
lines  <- nrow(df)
colnames(df )
ntrain <- round(lines * 0.8)      # number of training examples
tindex <- sample(lines, ntrain)   # indices of training samples (random)
xtrain <- df[tindex,1:3]          # data are in columns 1:3 - "CLASS", "AGE", "SEX"
xtest  <- df[-tindex,1:3]         # data are in columns 1:3 - "CLASS", "AGE", "SEX"
ytrain <- df[tindex,4]            # labels are in column 4 - "SURVIVED"
ytest  <- df[-tindex,4]           # labels are in column 4 - "SURVIVED"

summary(xtest)
summary(xtrain)

model_titanic <- C50::C5.0(xtrain, ytrain)
summary(model_titanic)

# MOSTRAR EL ARBOL OBTENIDO
plot(model_titanic)


estimated_ytest <- predict(model_titanic, xtest, type="class")
accuracy <- sum(ytest==estimated_ytest)/length(ytest)
error <- 1- accuracy
print(accuracy)
print(error)

# Mirando las reglas del modelo
mod <- C50::C5.0(ytrain ~ ., data = xtrain, rules = TRUE)
summary(mod)
cat(mod$rules)

########################################  FIN EJERCICIO 2 ########################################


##################### EJERCICIO 3. CAR EVALUATION ##########################################################
library(C50)

cars <- read.csv("car.csv", header=TRUE, encoding = "UTF-8")
head(cars)
colnames(cars)
sapply(cars,class)
str(cars)
summary(cars) 


# Obtain train set (80%) and test set (20%)
lines  <- nrow(cars)
colnames(cars )

chosen_x <- c("buying", "persons", "safety")
ntrain <- round(lines * 0.8)      # number of training examples
tindex <- sample(lines, ntrain)   # indices of training samples (random)
# Cambiado 1:6 por chosen_x para probar con 3 y 4 atributos
xtrain <- cars[tindex,1:6]          # data are in columns 1:6
xtest  <- cars[-tindex,1:6]         # data are in columns 1:6
ytrain <- cars[tindex,7]            # labels are in column 7 
ytest  <- cars[-tindex,7]           # labels are in column 7

summary(xtest)
summary(xtrain)

# Intento con pode y boosting
# model_cars <- C50::C5.0(xtrain, ytrain, prunen = 7, trials = 20)

# Intento de boosting
# model_cars <- C50::C5.0(xtrain, ytrain, trials = 3)

model_cars <- C50::C5.0(xtrain, ytrain)
summary(model_cars)

# MOSTRAR EL ARBOL OBTENIDO
plot(model_cars)


estimated_ytest <- predict(model_cars, xtest, type="class")
accuracy <- sum(ytest==estimated_ytest)/length(ytest)
error <- 1- accuracy
print(accuracy)
print(error)


mod <- C50::C5.0(ytrain ~ ., data = xtrain, rules = TRUE)
summary(mod)
cat(mod$rules)


