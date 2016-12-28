#==========================================================#
# #nom:Berkani                                             |
#  #prénom:Salem                                           |
#  #n°Etudiant:15607880                                    |
#  #@mail:salem.berkani@gmail.com                          |
#   #Master Big-data et fouille de donées.                 |
#                                                          |
#                                                          |
#==========================================================#

#---------------------------------------------------------------------------------------------------------------------------------
#   summary(Object) 
#   Est une fonction générique utilisée pour produire des résumés des résultats des différentes fonctions d'ajustement du modèle.
#   resum( min, median, max...........) 
#---------------------------------------------------------------------------------------------------------------------------------
summary(donnees)#


#---------------------------------------------------------------------------------------------------------------------------------
#   describe () 
#   Décrit plus en détail la trame de données statistiques sommaires.
#   peux contenire plusieur arg ( na.rm, tail, x...........) 
#---------------------------------------------------------------------------------------------------------------------------------

describe (donnees)#Décrit plus en détail la trame de données 



Dz <- summary(donnees$Secteur.Public.PU.Privé.PR)


#---------------------------------------------------------------------------------------------------
#   Crée un graphique à barres  
#   barplot2() ==>plusieur parametre peuv etre applique a ce grraphe (la taille,largeur,......)
#---------------------------------------------------------------------------------------------------

BP2 <-  barplot2(ds, beside=TRUE, 
                ylab="Frequency", #titre sur l'axe Y
                xlab="Secteur.Public.PU.Privé.PR", #titre sur l'axe X
                ylim=c(0, max(ds)+100), # limité la graduation
                col="blue") # la couleur du graphe 


#---------------------------------------------------------------------------
#   exporter le contenu d’une fenêtre déjà existante à l’aide de la fonction  
#   dev.print() ==> dev.print(forma, chemain, taille)
#   sauvgarge le graphe comme image
#---------------------------------------------------------------------------

dev.print(device = png, file = "graphiques/fig1.png", width = 800)# sauvgarde le graphe sous forme de img

#---------------------------------------------------------------------------
#   Ajoutez les fréquences réelles à chaque baton du graphe   
#   text()
#   
#---------------------------------------------------------------------------

text(BP2, Dz+50, Dz) # ajoute la frq sur chage baton du graphe


Sructurepédagogiqueen7groupes <- summary(donnees$Sructure.pédagogique.en.7.groupes)# calcule la fréquences de chaque cat
print(Sructurepédagogiqueen7groupes)
#---------------------------------------------------------------------------------------------------
#   Crée un graphique à barres  
#   barplot2() ==>plusieur parametre peuv etre applique a ce grraphe (la taille,largeur,......)
#---------------------------------------------------------------------------------------------------

Sructurepédagogiqueen7groupes <-  barplot2(Sructurepédagogiqueen7groupes, beside=TRUE, 
                         ylab="Frequency", # titre sur l'axe Y
                         xlab="Sructure.pédagogique.en.7.groupes", # titre sur l'axe X
                         ylim=c(0, max(Sructurepédagogiqueen7groupes)+10), # limité la graduation
 
                                                 col="red")# choisir une coulour du graphe
dev.print(device = png, file = "graphiques/fig2.png", width = 800)# sauvgarde le graphe sous forme de img


text(Sructurepédagogiqueen7groupes, Sructurepédagogiqueen7groupes+30, Sructurepédagogiqueen7groupes)#ajoute la frq pour chaque barre du graph 

#---------------------------------------------------------------------------------------------------
#   Crée un histogramme
#   hist() ==>plusieur parametre peuv etre applique a ce grraphe (la taille,largeur,......)
#---------------------------------------------------------------------------------------------------

Hz <- hist(donnees$Taux.accès.Brut.seconde.BAC, main="", 
           xlab="Taux.accès.Brut.seconde.BAC",# titre sur l'axe X
           ylab="Frequency", # titre sur l'axe Y
           col="grey90",
           ylim=c(0, 220),# limité la graduation 
           breaks="fd",#L'ensemble des points d'arrêt à utiliser.
           border=TRUE) # activé la bordure

dev.print(device = png, file = "graphiques/fig3.png", width = 800)# sauvgarde le graphe sous forme de img

Dens <- density(donnees$Taux.accès.Brut.seconde.BAC, na.rm=TRUE) # calcule de density

Rs <- max(Hz$counts)/max(Dens$y) 

#---------------------------------------------------------------------------------------------------
#   Crée un histogramme
#   lines ==>plusieur parametre peuv etre applique a ce grraphe (la taille,largeur,......)
#---------------------------------------------------------------------------------------------------

lines(Dens$x,
      Dens$y*Rs, # x,y
      type="l", # type lignes
      col=rainbow_hcl(1)[1]# couleur du graph
      )
dev.print(device = png, file = "graphiques/fig4.png", width = 800)# sauvgarde le graphe sous forme de img

rug(donnees$Taux.accès.Brut.seconde.BAC) # Ajoute un tapis de représentation 
title(main=paste("Distribution of","Taux.accès.Brut.seconde.BAC"))  # ajoute un titre au graphe .
dev.print(device = png, file = "graphiques/fig5.png", width = 800)# sauvgarde le graphe sous forme de img

#------------------------------------------------------------------------------------------
#   Syntax: foncton sous R 
#   nomdemafonction<-function(variable1,variable2...){           return(Variabledesortie)}
#  
#-------------------------------------------------------------------------------------------


jplot <- function(var){
  Hz <- hist(eval(parse(text=var)), main="",
             xlab=var, #titre sur l'axe X
             ylab="Frequency",#titre sur l'axe Y 
             col="grey90", # couleur du graphe 
             ylim=c(0, 280), # limité 
             breaks="fd", #L'ensemble des points d'arrêt à utiliser.  
             border=TRUE)
  Dens <- density(eval(parse(text=var)), na.rm=TRUE)# calcule la density
  Rs <- max(Hz$counts)/max(Dens$y)
  lines(Dens$x, Dens$y*Rs, type="l", col=rainbow_hcl(1)[1])
  rug(eval(parse(text=var)))		            # Add a rug to the plot
  title(main=paste("Distribution of",var))  # Add a title to the plot.
}



attach(donnees)	

#------------------------------------------------------------------------------------------
#   par() ==> une fonction qui permet de combine plusieur graphe dans un seul
#  
#-------------------------------------------------------------------------------------------



par(mfrow=c(2,2)) # c=(,)==> permet de crée une matrice
V <- c("Effectif.Présents.série.ES","Effectif.Présents.série.S","Effectif.Présents.série.L","Effectif.Présents.série.ST2S")
lapply(V,jplot)
dev.print(device = png, file = "graphiques/fig6.png", width = 800)# sauvgarde le graphe sous forme de img

detach(donnees)

