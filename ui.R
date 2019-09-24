#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(maps)
library(mapdata)
library(ggplot2)

italy_states <- map_data("italy")
italy_choice <- c("")
italy_choice <- c(italy_choice, unique(italy_states[["region"]]))

shinyUI(fluidPage(
    
    titlePanel("Italy Regions"),
    
    sidebarLayout(
        sidebarPanel(
            "Choose Region:",
             selectInput("sel_region", "", italy_choice, selected = NULL, multiple = FALSE),
            h3("Instructions"),
            "This app allows you to choose a region in Italy"
            ),
        mainPanel(
            h3("Regions of Italy"),
            plotOutput("mapPlot")
        )
    )
))

        
        

