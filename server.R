#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(maps)
library(mapdata)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    italy_states <- map_data("italy")
    sel_region <- reactive({
        subset(italy_states, region %in% input[["sel_region"]])
    })
    output[["mapPlot"]] <- renderPlot({
        ggplot(data = italy_states) + geom_polygon(aes(x = long, y = lat, group = group), fill = "yellow", color = "green") +
        coord_fixed(1.5) + guides(fill = FALSE) + geom_polygon(data = sel_region(), aes(x = long, y = lat, group = group), fill = "red")
       
    })
    })


