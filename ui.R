# library(shiny)
# runApp("/home/alber/Documents/ghProjects/tbtwdtw", launch.browser = FALSE, display.mode = "showcase", port = 7582)
# http://127.0.0.1:7582/?x=-74.51&y=4.4

shinyUI(bootstrapPage(
  h3("Time-Weighted Dynamic Time Warping", style = "text-align:center;"),
  #verbatimTextOutput("queryText"), 
  mainPanel(plotOutput("plot"), style="width: 100%")
))


