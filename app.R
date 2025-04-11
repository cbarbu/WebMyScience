library(shiny)
library(bslib)

# cet exemple est issu de la page d'introduction de Shiny : 
# https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/
# pour lancer cette App 
# * depuis Rstudio : source en haut à droite du fichier
# * depuis la console R : 
#    + source("app.R")
#    + runApp()

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  # App title ----
  title = "Salut Shiny !",
  # Sidebar panel for inputs ----
  sidebar = sidebar(
    # Input: Slider for the number of bins ----
    sliderInput(
      inputId = "bins",
      label = "Nombre de catégories :",
      min = 1,
      max = 50,
      value = 30
    )
  )
  ,fluidPage("Bonjour ça c'est complètement statique et géré directement côté client")
  ,textOutput("testTexte")
  # Output: Histogram ----
  ,plotOutput(outputId = "distPlot")
  # il suffit d'ajouter de lignes comme :
  # ,fluidPage("Les trucs statiques que je veux mettre dedans")
  # ou
  # ,machinOutput("refDansServer")
  # pour ajouter des élèments à la page interactive$
  # pour ajouter une requête à l'API décommenter la ligne suivante mais attention, il faut lancer l'API par ailleurs (voir plumber.R)
  # ,uiOutput("testAPI")
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$testTexte <- renderText({
    out <- paste("Ca c'est généré par le serveur. 
                 Les types d'Iris dans iris sont :",paste(unique(iris$Species),collapse=","),"\n")
    out
  })
  output$distPlot <- renderPlot({
    
    x    <- iris$Petal.Length
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    out <- hist(x, breaks = bins, col = "#007bc2", border = "white",
         xlab = "Longueurs de Pétales dans iris",
         ylab = "Fréquences",
         main = "Exemple de graphique interactif")
    return(out)
  })
  output$testAPI <- renderUI({
    # attention, il peut y avoir besoin d'utiliser
    # 127.0.0.1 
    # à la place de
    # 0.0.0.0
    my_raw_result <- httr::GET("http://0.0.0.0:8000/testBis?q=truc")
    # browser()
    basic_content <- httr::content(my_raw_result, as = 'text',encoding="UTF-8")
    out <- div(p("Vous avez fait une requête à l'API qui vous a répondu:"),
               p(basic_content))
    out
  })
}
                               
shinyApp(ui = ui, server = server)
