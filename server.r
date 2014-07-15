library(shiny)
library(googleVis)
source("analysis.r")

games <- read.csv(textConnection(rawToChar(getBinaryURL("https://raw.githubusercontent.com/codecentric/soccer-prediction-2014/master/1-merge-data/output/games.csv"))),sep = ";")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  countryStatsData <- reactive({
    countryStats(input$country,games)
  })
  
  output$goals <- renderText({
    sum <- sum(countryStatsData()$goals)
    paste("Total number of goals: ",sum)
  })
  
  output$plot.goals <- renderPlot({
    plot(table(countryStatsData()$goals),lwd = 20,xlab = "Goals",ylab = "Frequency",
         col="blue",
         main = "Frequency of goals"
         )
  })
  
  output$points <- renderText({
    points <- countryStatsData()$points
    sum <- sum(sapply(as.character(points),switch,"Lost" =0,"Draw" = 1,"Won" = 2,USE.NAMES = F))
    paste("Total number of points: ",sum)
  })
  
  
  output$plot.points <- renderPlot({
    plot(table(countryStatsData()$points),lwd = 50,xlab = "Points",ylab = "Frequency",
         col = c("red","yellow","green"),
         main =  "Frequency of game results"
         )
  })
  
})