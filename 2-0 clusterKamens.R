
lycee2 <- select(donnees, Secteur.Public.PU.Privé.PR, Académie, Sructure.pédagogique.en.7.groupes, 
                 Taux.Brut.de.Réussite.Total.séries, Taux.Réussite.Attendu.toutes.séries, 
                 Effectif.de.seconde, Effectif.de.première, Effectif.de.terminale)

Numvars <- lapply(lycee2,is.numeric)  		
Numdata <- na.omit(lycee2[,Numvars==TRUE])
head(Numdata)
#-----------------------------------------------------------------
# Run the kmeans algorithm
Km <- kmeans(x=Numdata, centers=2) 
# Plot the first 5 variables colored by cluster
vars <- 2:4
plot(Numdata[vars], col=Km$cluster)
title(main="Effctife",
      sub=paste(format(Sys.time(), "%Y-%b-%d %H:%M:%S"), Sys.info()["user"]))
