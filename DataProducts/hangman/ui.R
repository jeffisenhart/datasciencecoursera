library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
      tags$head(tags$script(src="hangman.js")),
      tags$head(tags$script(src="js/highcharts.js")),
      # Application title
      tags$div(class="page-header text-center",HTML("<h1>Hangman</h1>")),
      tags$a(href="http://en.wikipedia.org/wiki/Hangman_(game)",HTML("Documentation/How to play"),target="_blank",class="text-center"),
      sidebarLayout(
            
            # Sidebar with a slider input
            sidebarPanel(
                  tags$div(class="",HTML("<p>To guess, click on a letter</p>")),
                  tags$div(id="alphaContainer",class=""),
                  br(),
                  tags$div(id="winLoss",class="")
                  #plotOutput("winLoss")
            ),#end sidebarPanel
            
            # Show a plot of the generated distribution
            mainPanel(
                  tags$div(class="",HTML("<p>Current word:</p>")),
                  tags$div(id="wordContainer",class=""),
                  tags$div(id="answer",class=""),
                  br(),
                  tags$img(src="hang0.png",width="300px",height="400px",id="hm"),
                  br(),
                  br(),
                  tags$button(id="newGame",
                              class="btn btn-default",
                              HTML("New Game")),
                  br(),
                 
                  tags$script('document.getElementById("newGame").onclick = function() {
                              Shiny.onInputChange("newGame", new Date());
                              };'
                  ),
                  
                  tags$script('Shiny.addCustomMessageHandler("startGameHandler",
                              function(newWord) {
                                    document.getElementById("hm").src = "hang0.png";
                                    showEmptyWord(newWord,document.getElementById("wordContainer"));
                                    resetAlpha(document.getElementById("alphaContainer"));
                                    
                              });'
                  ),
                  tags$script('document.body.onload = function() {
                              Shiny.onInputChange("newGame", new Date());
                              };'
                  )
                  
            )#end mainPanel
      )#end sidebarLayout
      )#end fluidPage
)#end shinyUI