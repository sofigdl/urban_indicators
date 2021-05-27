# import functions file 
ipak <- function(pkg){
  
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  
  if (length(new.pkg)) 
    
    install.packages(new.pkg, dependencies = TRUE)
  
  sapply(pkg, require, character.only = TRUE)
  
  webshot::install_phantomjs()
  
}
########################################################################################
# Load libraries
ipak(c("colourpicker", "dplyr", "DT", "gganimate", "ggdark", "ggmap", "ggplot2", "gstat", "hms",
     "htmlwidgets","leafem","leaflet", "leaflet.extras", "leaflet.extras2", "list", 
     "maptools",  "mapview", "ncdf4", "pals", "patchwork", "plyr","raster","RColorBrewer","reshape2", "readxl", "rgdal", "rlist","sf","sp", "stringi",
     "shiny", "shinybusy", "shinydashboard", "shinydashboardPlus", "shinyjs", "shinythemes", "shinyWidgets", "stringr", "vroom", "tidyr",))

########################################################################################
addResourcePath(prefix = 'pics', directoryPath = paste0(getwd(),"/www"))
########################################################################################
source("ui.R")
source("server.R")
########################################################################################
shinyApp(ui, server)
########################################################################################
