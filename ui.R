####################
##       Ui       ##
####################

ui <- dashboardPage(
  theme = shinytheme("slate"),
  navbarPage(title = div(img(src='Resources/Logo.png', style="margin-top: -10px; padding-right:10px; padding-bottom:10px", height = 50)),
             windowTitle="AirQ Log",
             theme = shinytheme("slate"),

  ##Sidebar content
  
  dashboardSidebar(
  width = 300,
  sidebarMenu(id = "tab",
              menuItem("Physical context"), tabName = "clima", icon = icon("leaf")),
             # menuItem(translate("Associació entre calor i mortalitat"), tabName = "associacio", icon = icon("heartbeat")),
              menuItem("Social Indicators", tabName = "urbans", icon = icon("city")),
              menuItem(translate("Metodology"), tabName = "metodologia", icon = icon("info-circle"))
              #Icons from https://fontawesome.com/icons?d=gallery
  )
),

dashboardBody(
  tags$head(tags$style(HTML('
                              .main-header .logo {
                              font-size: 14px;
                              }
                              '))),
  tabItems(  ## Third tab content
    tabItem(tabName = "urbans",
            tags$style(type = "text/css", "#mymapindicadors {height: calc(100vh - 80px) !important;}"), #https://stackoverflow.com/questions/36469631/how-to-get-leaflet-for-r-use-100-of-shiny-dashboard-height
            fluidRow(
              column(width = 2,
                     box(
                       title = "Indicators", width = NULL, solidHeader = TRUE, status = "success",
                       pickerInput(
                         inputId = "var.indicador",
                         label = "Urban indicators",
                         #label = translate("Indicador urbà"),
                         choices = setNames(
                           list(choiceVec$urbans.indicador[1:11], 
                                choiceVec$urbans.indicador[12:length(choiceVec$urbans.indicador)]), 
                          selected = choiceVec$urbans.indicador[1]
                       ),
                       htmlOutput("text_indicador_urba", inline = TRUE)
                     ),
                     box(
                       title = translate("Opcions mapa"), width = NULL, solidHeader = TRUE, status = "success",
                       sliderInput(
                         "opacitat.indicadors", translate("Opacitat"),
                         min = 0, max = 1,
                         value = 0.8
                       ),
                       
                       radioGroupButtons(inputId = "capa.inferior.indicadors",
                                         label = translate("Capa base"),
                                         choiceNames = translate(c("Carrerer", "Satèl·lit")),
                                         choiceValues = c("OpenStreetMap.Mapnik", "Esri.WorldImagery"),
                                         justified = TRUE)
                     ),
                     box(
                       title = translate("Descarregar dades"), width = NULL, solidHeader = TRUE, status = "success",
                       downloadButton('downloadData_Indicadors', translate('Descarregar dades'))
                     )
              ),
              
              column(width = 10,
                     box(width = NULL,
                         leafletOutput("mymapindicadors"))
              )
            )
    ),
    

  
  )