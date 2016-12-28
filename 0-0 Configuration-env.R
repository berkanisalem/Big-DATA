
#==========================================================#
# #nom:Berkani                                             |
#  #prénom:Salem                                           |
#  #n°Etudiant:15607880                                    |
#  #@mail:salem.berkani@gmail.com                          |
#   #Master Big-data et fouille de donées.                 |
#                                                          |
#                                                          |
#==========================================================#
  
  
  # la 1er chose a faire et de configurer le dossier de travail du projet :
  #identifier le répertoire du projet et utiliser la fonction "set working directory" : setwd
  
setwd("D:/Tp-Final")

  #------------------------------------------------------------------
  #   installer les packages R dont en as besoin
  #   datamining en R avec le packages Rattle 
  #   syntax ===>install.packages ("name_of_the_package")
  #------------------------------------------------------------------


#-------------------------------------------------------------------------------------
#   Interface graphique prenant en charge les fonctions d'exploration de données
#
#     Pour l'utiliser, exécutez l'instruction ===> rattle ()
#-------------------------------------------------------------------------------------

install.packages ("gtk")
install.packages ("rattle")

#------------------------------------------------------------------------------------------------
#   install.packages ("fBasics")
#   Il s'agit d'un environnement d'enseignement «Ingénierie financière et finances informatiques».
#-------------------------------------------------------------------------------------------------
  
   install.packages ("fBasics")

#---------------------------------------------------------------------------------------------------------------------------
#   install.packages ("party")	
#   Comprend les arbres de décision CART. Partition récursive pour les arbres de classification, de régression et de survie.
#---------------------------------------------------------------------------------------------------------------------------

   install.packages ("party")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("ada")		
#   Le paquet ada fournit une routine simple, bien documentée et large pour la classification, idéale pour les ensembles de données de petite à moyenne taille.
#--------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("ada")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("randomForest") 		
#   Classification et régression basées sur une forêt d'arbres à l'aide d'intrants aléatoires.
#--------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("randomForest") 

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("caret")			
#   Fonctions diverses pour la formation et le traçage des modèles de classification et de régression.
#--------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("caret")			

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("kernlab")			
#    Méthodes d'apprentissage mécanique basées sur le noyau pour la classification, la régression, le regroupement, la détection de nouveauté, la régression quantile et la réduction de dimensionnalité.
#    Parmi d'autres méthodes, «kernlab» comprend les machines à vecteur de soutien, le regroupement spectral, le noyau PCA, les processus gaussiens et un solveur QP.
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("kernlab")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("e1071")			
#   Fonctions pour l'analyse des classes latentes, transformations de Fourier à courte durée, clustering flou, machines à vecteurs de support, calculs de chemins les plus courts, clustering ensaché, classificateur Bayes naïf,
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("e1071")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("doParallel")			
#   Fournit un backend parallèle pour la fonction% dopar% en utilisant le package parallèle.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


install.packages ("doParallel")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages("ROCR")			
#   Pour évaluer la performance d'un modèle
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages("ROCR")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages("Hmisc")			
#   Contient de nombreuses fonctions utiles pour l'analyse de données, des graphiques de haut niveau, des opérations de service, des fonctions pour calculer la taille et la puissance de l'échantillon
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


install.packages("Hmisc")

#|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#|   Liste des outils de visualisation pour R et datamining		
#| 
#|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ('cairoDevice')		
#    Cet appareil utilise le Caire et GTK pour dessiner à l'écran, le fichier (png, svg, pdf et ps) ou la mémoire (GdkDrawable arbitraire ou le contexte du Caire). Le dispositif d'écran peut être incorporé dans les interfaces RGtk2 et prend en charge toutes les fonctionnalités interactives d'autres périphériques graphiques, y compris getGraphicsEvent ().install.packages ('cairoDevice')
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ('cairoDevice')

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("colorspace") 		
#   Effectue une cartographie entre les espaces de couleurs assortis, y compris RVB, HSV, HLS, CIEXYZ, CIELUV, HCL (CIELUV polaire), CIELAB et CIELAB polaire.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("colorspace") 

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("ellipse") 		
#   Ce package contient diverses routines pour dessiner les ellipses et les régions de confiance en forme d'ellipse, en mettant en œuvre les tracés décrits dans Murdoch et Chow (1996),
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("ellipse")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   
#   Divers outils de programmation R pour tracer des données (barplot, lignes de courbe, ...)
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("gplots")     
install.packages("ggplot2")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   install.packages ("vcd")
#   Les techniques de visualisation, les ensembles de données, les procédures de synthèse et d'inférence visent en particulier les données catégorielles.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

install.packages ("vcd")

#|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#|   Pour activer la bibliothèque,
#|   Syntax ===> library(name_of_the_package)
#|
#|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/factoextra")



install.packages("cluster")
#Si nous voulons utiliser l'interface graphique de ratlle
library (RGtk2)
library(rattle)
# c est pour imoprte toutes les biblioteque dont en as besoin pour le traitement, analyser de données
library(Hmisc)
library(fBasics)		
library(rpart)	
library(ROCR)		
library(party)	
library(ada)
library(randomForest)   
library(caret)	
library(kernlab)
library(e1071)	
library(doParallel)
library(colorspace)
library(cairoDevice)
library(gplots)     
library(vcd)		
library(ellipse)
library(cluster)
library(factoextra)
