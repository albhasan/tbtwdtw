library(shiny)
library(wtss.R)
library(dtwSat)

wtss.server <- WTSS("http://www.dpi.inpe.br/tws/wtss")
cv <- describeCoverage(wtss.server, "mod13q1_512")

# filter patterns 
fpatterns.list <- list()
for (i in 1:length(patterns.list)){
  lname <- names(patterns.list)[i]
  pl <- patterns.list[[i]]
  x <- as.matrix(coredata(pl)[, "ndvi"])
  colnames(x) <- "ndvi"
  fpl <- zoo(x = x, 
             order.by = attr(pl, "index"), 
             frequency = attr(pl, "frequency"))
  fpatterns.list[[lname]] <- fpl
}
patt = twdtwTimeSeries(fpatterns.list)                           # get the patterns
log_fun = logisticWeight(alpha=-0.1, beta=100)                   # logistic time-weight





shinyServer(function(input, output, session) {
  dataInput <- reactive({  
    query <- parseQueryString(session$clientData$url_search) # query <- parseQueryString("?x=-74.5&y=4.9")
    ts <- timeSeries(wtss.server, names(cv), attributes=cv[[names(cv)]]$attributes$name[1], latitude = query$y, longitude= query$x, start="2000-02-18", end="2016-01-01")
    ts.twdtw <- twdtwTimeSeries(ts[[names(ts)]]$attributes)          # cast to twdtw
    matches <- twdtwApply(x=ts.twdtw, y=patt, weight.fun=log_fun, keep=TRUE) 
  })
  
  output$plot <- renderPlot({
    plot(x = dataInput(), type = "alignments")
  })
  
  # Return the components of the URL in a string:
  output$urlText <- renderText({
    paste(sep = "",
          "search: ",   session$clientData$url_search,   "\n"
    )
  })
  
  # Parse the GET query string
  output$queryText <- renderText({
    query <- parseQueryString(session$clientData$url_search)
    
    
    # Return a string with key-value pairs
    paste(names(query), query, sep = "=", collapse=", ")
  })
})

