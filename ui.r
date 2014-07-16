library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Soccer team analysis"),
  p("To get soccer statistics for the national team of a given country, please select the country in the drop down box."),
  p("It will then show some statistics on frequencies of goals and match reuslts of teh selected team"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("country", label = h3("Country"), 
                  choices = list("DEU" , 
                                 "BRA",
                                 "ARG",
                                 "NLD",
                                 "NGA",
                                 "FRA",
                                 "ITA",
                                 "KOR",
                                 "MEX",
                                 "LUX"
                                 
                  ), selected = "DEU")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      strong(textOutput("goals")),
      plotOutput("plot.goals"),
      strong(textOutput("points")),
      plotOutput("plot.points")
    )
  )
))