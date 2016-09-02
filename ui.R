# library(shiny)
# runApp("/home/alber/tmp/shiny/app01", launch.browser = FALSE, display.mode = "showcase")
# http://127.0.0.1:7582/?x=-74.51&y=4.4

shinyUI(bootstrapPage(
  #HTML("<h3 style='text-align:center;'></h3>"),
  h3("Time-Weighted Dynamic Time Warping", style = "text-align:center;"),
  #verbatimTextOutput("queryText"), 
  mainPanel(plotOutput("plot"), style="width: 100%")
))

