# server.R
wafers <- read.csv("data/allwaferdata.csv")
library(ggplot2)
library(dplyr)

shinyServer(
  function(input, output) {
    output$boxplot <- renderPlot({
      wafer1<-switch (input$wafer1,
                      "WW1" = "ww1",
                      "WW3" = "ww3",
                      "WW4" = "ww4",
                      "WW5" = "ww5",
      )
      
      wafer2<-switch (input$wafer2,
                      "WW1" = "ww1",
                      "WW3" = "ww3",
                      "WW4" = "ww4",
                      "WW5" = "ww5",
      )
      #filter data based on the select inputs
      wafer_compare <- filter(wafers, id == wafer1 | id ==wafer2)
      
      #plot the data
      ggplot(wafer_compare, aes(factor(id),CD)) + geom_boxplot(aes(fill = factor(id)))
    })
    
    
    output$radialplot <- renderPlot({
      wafer1<-switch (input$wafer1,
        "WW1" = "ww1",
        "WW3" = "ww3",
        "WW4" = "ww4",
        "WW5" = "ww5",
        )
      
      wafer2<-switch (input$wafer2,
                      "WW1" = "ww1",
                      "WW3" = "ww3",
                      "WW4" = "ww4",
                      "WW5" = "ww5",
      )
      #filter data based on the select inputs
      wafer_compare <- filter(wafers, id == wafer1 | id ==wafer2)
      
      #plot the data
      ggplot(wafer_compare, aes(x=r, y= CD)) + geom_point(aes(color = factor(id)))
    })
  }
)