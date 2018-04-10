install.packages("C50")
library(C50)

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
estimated_ytest <- predict(model, xtest, type="class")
