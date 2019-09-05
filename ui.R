shinyUI(fluidPage(
    titlePanel("Habitat Modeling Availability"),
    theme = shinythemes::shinytheme("readable"),
    sidebarLayout(
        sidebarPanel(
            width = 3, 
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
















