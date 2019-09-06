shinyUI(fluidPage(
    titlePanel("Habitat Modeling Availability"),
    theme = shinythemes::shinytheme("readable"),
    sidebarLayout(
        sidebarPanel(
            width = 3, 
            tags$p("This application summarizes how habitat input data was developed for each watershed in the Science Integration Team (SIT) population models. Red (FALSE) entries indicate that no watershed specific habitat modeling was available for a given species and lifestage. Habitat input data for these watersheds was generated through regional approximation. Green (TRUE) entries indicate that watershed specific habitat modeling was available for at least some portion of the watershed for a given species and lifestage. The Docs link for each watershed provides detailed descriptions of methods used to develop habitat inputs."),
            selectInput("region", "Select by Region", choices = regions_lookup$Region), 
            tags$p("or"),
            selectizeInput("watershed", "Select by Watersheds",
                           choices = watersheds,
                           options = list(maxItems = 20)),
            selectInput("species", "Select species", 
                        choices = c("Fall Run", "Spring Run", "Steelhead"))
        ),

        mainPanel(
            DT::dataTableOutput("availability_table") 
        )
    )
))
















