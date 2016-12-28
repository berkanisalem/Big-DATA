
#==========================================================#
# #nom:Berkani                                             |
#  #prénom:Salem                                           |
#  #n°Etudiant:15607880                                    |
#  #@mail:salem.berkani@gmail.com                          |
#   #Master Big-data et fouille de donées.                 |
#                                                          |
#                                                          |
#==========================================================#

#identifier le répertoire du projet et utiliser la fonction "set working directory" : setwd
setwd("D:/Tp-Final")

#le jeu de données publiées par le ministère de l’Éducation nationale intitulée Indicateurs de résultat des lycées d’enseignement général et technologique

name <- "MEN-DEPP-indicateurs-de-resultats-des-LEGT-2015.csv"

# Créez un objet (dataDIR) qui pointe vers votre dossier

dataDir <- "D:/Tp-Final/donnees"

file <- file.path(dataDir,name)

donnees<-read.csv(file, sep = ";", header = TRUE, fileEncoding = "ISO-8859-15", na.strings = c(" ", "."))
# visualisation des donnees 

View(donnees)

