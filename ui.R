shinyUI(fluidPage(
  titlePanel (" Wafer Uniformity Analysis"),
  sidebarLayout(
    
    sidebarPanel(
      helpText("Compare wafer uniformity with boxplot and radial distribution:"),
      selectInput("wafer1", 
                  label = "choose wafer #1", 
                  choices = list("WW1", "WW3", "WW4","WW5"),
                  selected = "WW1"),
      
      br(),
      
      selectInput("wafer2", 
                  label = "choose wafer #2", 
                  choices = list("WW1", "WW3", "WW4","WW5"),
                  selected = "WW3")
      ),
    
    mainPanel(
      
      plotOutput("boxplot"),
      br(),
      plotOutput("radialplot")
      )
    
    )
  ))