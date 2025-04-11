# README #

### Objectif

Ce dépôt est le support pour un cours sur la mise en ligne de contenu scientifique. Il donne un exemple de trois grands types de mise en ligne avec R : 

* Page statique (éventuellement avec des graphiques dynamiques), avec Quarto : page.qmd et template.html
* WebApp pour plus d'interactivité, avec Shiny (app.R)
* API pour mettre à disposition des données plus ou moins traitées, avec Plumber (plumber.R)

### Utilisation
Les indications sur comment voir les différentes fonctionnalités sont en tête des documents.
Dans Rstudio, il suffit d'ouvrir le fichier, puis: 

* pour page.qmd et template.html, installer quarto, cliquer sur le bouton render en haut du fichier
* pour app.R, installer shiny et lancer en cliquant sur le bouton "Run App"
* pour plumber.R, voir la ligne pour le lancer en tête du fichier

Pour plus de détails, voir le cours en tex/pdf : [cours/presentation_cmbc.pdf](cours/presentation_cmbc.pdf).

### Comment participer ? 
Je ne souhaite pas complexifier le cours (sauf peut-être ajout sur la configuration d'NGINX) mais les corrections sont les bienvenues sous la forme de pull-request ou de propositions mail à Corentin Barbu (INRAE).
