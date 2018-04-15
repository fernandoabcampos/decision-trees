library(readxl)
aec_255_2009 <- read_excel("~/Desktop/Master - Data Science/UOC/Datawarehouse/PRACs/PRA1-Datos/aec-255_2009.xls", skip = 5)
View(aec_255_2009)

colnames(aec_255_2009)[which(names(aec_255_2009) == "X__1")] <- "Comarca"

summary(aec_255_2009)
colnames(aec_255_2009)

total_2009 <- aec_255_2009[1:41,]
hombres_2009 <- aec_255_2009[51:91,]
mujeres_2009 <- aec_255_2009[101:141,]

#Podria ser un bucle o una funcion para aplicar a todos
total_2009$`0-15` <- as.numeric(total_2009$`0-15`)
total_2009$`16-24` <- as.numeric(total_2009$`16-24`)
total_2009$`25-44` <- as.numeric(total_2009$`25-44`)
total_2009$`45-64` <- as.numeric(total_2009$`45-64`)
total_2009$`65 i més` <- as.numeric(total_2009$`65 i més`)
total_2009$Total <- as.numeric(total_2009$Total)

summary(total_2009)

total_2009 <- lapply(total_2009$`0-15`, function(x) type.convert(as.numeric(x), as.is = TRUE))

