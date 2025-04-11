library("plumber")
#---------------------------
# Démonstration d'interface plumber
#---------------------------
# Lancement de l'API (depuis R): 
# library("plumber")
# pr <- plumb("plumber.R"); pr$run(host='0.0.0.0', port = 8000)
# Utilisation :
# wget 127.0.0.1:8000/test?q=Bonjour -O test
# ou swagger :
# http://127.0.0.1:8000/__docs__/

#' @apiTitle API Test
#' @apiDescription Présente la création d'une API dans R
#' @apiContact list(name = "API Support", url = "https://https://corentinbarbu.agronomie.inrae.fr//", email = "corentin.barbu@inrae.fr")

#' Un "endpoint" pour tester l'API
#' @param q Something to print back
#' @get /test
function(q=""){
	 out <- paste0("Bienvenue sur l'API Test, vous avez entré:'", q, "'")
	return(out)
}

# ce qui ressemble quand même beaucoup à : 
maFonctionTest <- function(entree){
  out <- paste0("Bienvenue sur l'API Test, vous avez entré:'", entree, "'")
  return(out)
}

#' La même chose mais montrant comment on peut utiliser l'API 
#' pour simplement donner accès à une fonction déjà écrite dans R
#' @param q Something to print back
#' @get /testBis
function(q=""){
   out <- maFonctionTest(q)
   return(out)
}

