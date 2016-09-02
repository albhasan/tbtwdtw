# tbtwdtw
Apply TWDTW to time-series on the fly.

This demostrative Web application classifies a time series using the Time-Weighted Dynamic Time Warping algorithm. It is designed for integration integrated on map web applications such as those using <a href="http://openlayers.org/">Open Layers</a> or <a href="http://leafletjs.com/">Leaflet</a>. This application takes a point on earthto query the <a href="http://github.com/e-sensing/tws/">Web Time Series Service</a> in order to retrieve a MODIS NDVI time series, then, the application classifies the time series using TWDTW. Finally, the applications displays the graphs of the time series and the classifcation results. This application is a test of the integration of R's analytic capabilities with web applications.

This application is deployed using a <a href="https://www.rstudio.com/products/shiny/shiny-server/">Shiny server</a>. Shiny server enables <a href="https://cran.r-project.org/">R</a> applications to the Web 

A sample reques to the application is http://www.myshinyserver.org/tbtwdtw/?x=-74.075833&y=4.598056

