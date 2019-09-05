shinyUI(fluidPage(
    titlePanel("Habitat Modeling Availability"),
    theme = shinythemes::shinytheme("yeti"),
    sidebarLayout(
        sidebarPanel(
            width = 3, 
            selectizeInput("watershed", "Select Watersheds (up to 10)", 
                           choices = watersheds, 
                           options = list(maxItems = 10)), 
            selectInput("species", "Select species", 
                        choices = c("Fall Run", "Spring Run", "Steelhead"))
        ),

        mainPanel(
            DT::dataTableOutput("availability_table")
        )
    )
))
