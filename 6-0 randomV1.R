#==========================================================#
# #nom:Berkani                                             |
#  #prénom:Salem                                           |
#  #n°Etudiant:15607880                                    |
#  #@mail:salem.berkani@gmail.com                          |
#   #Master Big-data et fouille de donées.                 |
#                                                          |
#                                                          |
#==========================================================#

lycee<-donnees 

nometab <- paste(lycee$Etablissement, lycee$Code.Etablissement)# fair une 
nometab <- gsub("LYCEE ", "", nometab)# remplacer lycee par une chain vide

row.names(lycee) <- nometab # ajoute une colon dans le jeu de données


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   select() ====> fair une selection des variable dant en as besoin 	
#   et les mettre dans une table apar 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


lycee2 <- select(lycee, Secteur.Public.PU.Privé.PR, Académie, Sructure.pédagogique.en.7.groupes, 
                 Taux.Brut.de.Réussite.Total.séries, Taux.Réussite.Attendu.toutes.séries, 
                 Effectif.de.seconde, Effectif.de.première, Effectif.de.terminale)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   Ensuite on fait une petite boucle pour que R reconnaisse les variables quantitatives comme telles. 	
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

print(as.numeric("salem"))

for (i in 4:ncol(lycee2)) {
  print(lycee2[, i])
  lycee2[, i] <- as.numeric(as.character(lycee2[, i])) 
}


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#     syntax====> str(Object)
#     La fonction str() affiche un résumé compact des informations sur un objetc R	
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

str(lycee2)


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#     On va utiliser Random Forest pour expliquer la variable publique/privée en fonction des autres variables. 
#     Il s’agit de répondre à la question quelles sont les variables de notre modèle qui discriminent le mieux les établissements publics des établissements privés ?
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

set.seed(123)#la fonction par défaut . On utilise une seule option pour le moment qui concerne les données non disponibles na.action = na.roughfix 
fit <- randomForest(Secteur.Public.PU.Privé.PR ~ .,
                    data = lycee2,
                    na.action = na.roughfix)# na.roughfix ==> permet de remplacer les variable manquant par des valeur médian 
varImpPlot(fit)# pour voir les variables importantes dans mon modèle dans un graphe
dev.print(device = png, file = "graphiques/fig7.png", width = 800)# sauvgarde le graphe sous forme de img


fit$importance  #On trouve les mêmes informations dans un tableau avec les commandes suivantes :

fit$importance[order(fit$importance[, 1], decreasing = TRUE), ]# classé les varibable par ordre d'importance


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#    
#     Dans le modèle que l’on a calculé, les 2 critères qui comptent le plus pour distinguer privé et public sont le taux de réussite au Bac et le nombre d’élèves en seconde. On peut examiner graphiquement ces éléments
#                    FIG8
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


plot(Secteur.Public.PU.Privé.PR ~ Taux.Brut.de.Réussite.Total.séries,
     data = lycee2)
dev.print(device = png, file = "graphiques/fig8.png", width = 800)# sauvgarde le graphe sous forme de img

plot(Secteur.Public.PU.Privé.PR ~ Effectif.de.seconde, data = lycee2)
dev.print(device = png, file = "graphiques/fig9.png", width = 800)# sauvgarde le graphe sous forme de img

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#                  améliorer la prédiction de Random Forest
#     Chaque arbre de la forêt est construit sur une fraction (“in bag”) des données (c’est la fraction qui sert à l’entraînement de l’algorithme. Alors pour chacun des individus de la fraction restante (“out of bag”)
#     l’arbre peut prédire une classe.
#
#     Le but du jeu est d’obtenir l’OOB le plus petit possible4. Pour minimiser cette valeur, on peut régler deux éléments : le nombre d’arbres construits par l’algorithme (ntree) et le nombre de variables testées à chaque division (mtry).
#     
#     choisir le nombre d’arbres en gardant la valeur par défaut de mtry (qui correspond à la racine carrée du nombre de variables) et de tester plusieurs valeurs en les évaluant par exemple 
#     avec la commande suivante qui affiche un graphique montrant comment réduit l’OOB en fonction du nombre d’arbres générés.
#                  
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


plot(fit$err.rate[, 1], type = "l", xlab = "nombre d'arbres", ylab = "erreur OOB")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#    
#     On choisit ensuite le nombre d’arbres lorsque la valeur se stabilise au minimum. Voyons ce que ça donne avec une forêt de 5000 arbres.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



set.seed(123)
fit <- randomForest(Secteur.Public.PU.Privé.PR ~ ., data = lycee2, ntree = 5000, 
                    mtry = 2, na.action = na.roughfix)
print(fit)

plot(fit$err.rate[, 1], type = "l",
     xlab = "nombre d'arbres", 
     ylab = "erreur OOB")
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#    
#     
#     On voit que l’OOB se stabilise à partir de 2000 arbres on va donc choisir cette valeur pour ntree.
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


dev.print(device = png, file = "graphiques/fig10.png", width = 800)# sauvgarde le graphe sous forme de img

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#    Choix du mtry
#     
#    faire tourner Random Forest 10 fois avec dix valeurs de mtry différentes et choisir celle pour laquelle le mtry est minimal et se stabilise
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



set.seed(123)
fit <- randomForest(Secteur.Public.PU.Privé.PR ~ .,
                    data = lycee2, ntree = 2000, 
                    mtry = 4,
                    na.action = na.roughfix)
print(fit)


plot(fit$err.rate[, 1], type = "l", xlab = "nombre d'arbres", ylab = "erreur OOB")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#    Choix du mtry
#     
#     C’est mieux que la première fois, mais pas franchement spectaculaire puisqu’on obtient un OOB de 12,46 % au lieu de 13,11 %.
#     dev.print(device = png, file = "graphiques/fig11.png", width = 800)# sauvgarde le graphe sous forme de img
#
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

dev.print(device = png, file = "graphiques/fig11.png", width = 800)# sauvgarde le graphe sous forme de img

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#    
#    Les “Partial Plot” sont des graphiques potentiellement intéressants, mais dont les fonctions ont l’air très bogués :
#    “Each point on the partial dependence plot is the average vote percentage in favor of the “Yes trees” class across all observations, given a fixed level of TRI.”
#
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

par(mfrow = c(1, 2))
partialPlot(fit, lycee2, 4, "PR",
            main = "Privé", 
            ylab = "Taux.Brut.de.Réussite.Total.séries")

dev.print(device = png, file = "graphiques/fig12.png", width = 800)# sauvgarde le graphe sous forme de img

partialPlot(fit,
            lycee2,
            6,
            "PR",
            main = "Privé",
            ylab = "Effectif.de.seconde")

dev.print(device = png, file = "graphiques/fig13.png", width = 800)# sauvgarde le graphe sous forme de img

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#    
#    La library CARET (pour Classification And REgression Training) facilite l’emploi des algorithmes de machine learning. Elle va nous proposer de tuner le modèle de machine learning et proposer des ntree et mtry optimales.
#    Cela ce fait en échange d’un temps de calcul beaucoup plus long donc pour les bases très conséquente il est souhaitable de faire appel à du calcul parallèle ce qui est assez facile dans R
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



set.seed(123)

mod <- train(Secteur.Public.PU.Privé.PR ~ ., data = lycee2,  method = "rf")
print(mod)
print(mod$finalModel)
