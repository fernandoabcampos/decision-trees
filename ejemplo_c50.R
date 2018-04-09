library(C50)

# ABRIR FICHERO CON LOS DATOS IRIS
iris_data <- read.csv("iris.csv", header=FALSE)

# OBTENER LOS CONJUNTOS DE TRAIN (80%) Y TEST (20%)
n      <- nrow(iris_data)
ntrain <- round(n*0.8)            # number of training examples
tindex <- sample(n,ntrain)        # indices of training samples (random)
xtrain <- iris_data[tindex,1:4]   # data are in columns 1:4
xtest  <- iris_data[-tindex,1:4]  # data are in columns 1:4
ytrain <- iris_data[tindex,5]     # labels are in column 5
ytest  <- iris_data[-tindex,5]    # labels are in column 5

# ENTRENAMOS EL MODELO CON LOS DATOS DE ENTRENAMIENTO
model <- C50::C5.0(xtrain, ytrain)

# OBTENEMOS INFORMACIÓN SOBRE EL MODELO ENTRENADO
# Ojo, con summary obtenemos una estimación del error usando solo los datos
# de entrenamiento. Esta estimación se tiene que tomar como una aproximación muy
# optimista del error que se obtendrá al predecir muestras de test
summary(model)

# MOSTRAR EL ARBOL OBTENIDO
plot(model)

# ESTIMAR LA ETIQUETA DE LAS MUESTRAS DE TEST
# estimared_ytest serán las etiquetas que el modelo entrenado predice
estimated_ytest <- predict(model, xtest, type="class")

# CALCULAMOS LA EFICACIA DEL MODELO
# la exactitud será el número de muestras para las que la etiqueta predicha es la misma
# que la etiqueta que realmente tiene, dividido por el número de muestras de test.
accuracy <- sum(ytest==estimated_ytest)/length(ytest)
error <- 1- accuracy
print(accuracy)
print(error)

# NOTA: si se ejecuta el código varias veces, el error será ligeramente diferente, 
# pues depende de las muestras que se han usado para entrenar el modelo. En cada ejecución, 
# dichas muestras cambian.
# Sería más correcto usar la técnica de Cross-validation que nos dará una estimación más realista
# del error que se obtendrá en el futuro


