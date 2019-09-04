shinyUI(fluidPage(
    titlePanel("Habitat Modeling Availability"),
    theme = shinythemes::shinytheme("yeti"),
    sidebarLayout(
        sidebarPanel(
            width = 3, 
            selectInput("region", "Select Region", choices = regions), 
            selectInput("species", "Select species", 
                        choices = c("Fall Run", "Spring Run", "Winter Run", "Steelhead"))
        ),

        mainPanel(
            DT::dataTableOutput("availability_table")
        )
    )
))
