shinyUI(fluidPage(
    titlePanel("Habitat Modeling Availability"),
    theme = shinythemes::shinytheme("readable"),
    sidebarLayout(
        sidebarPanel(
            style = 'height:650px',
            width = 3, 
            selectInput("species", "Select species", 
                        choices = c("Fall Run", "Spring Run", "Winter Run", "Steelhead")),
            tags$p('This application summarizes available habitat modeling for each watershed in the Science Integration Team (SIT) Decision Support Models (DSMs).'),
            tags$h5('Legend'),
            tags$ul(
                tags$li('TRUE - Watershed specific habitat modeling is available for at least some portion of the watershed for a given species and lifestage'),
                tags$li('FALSE - No watershed specific habitat modeling is available for the given species and lifestage. Habitat input data for the DSMs at this watershed was approximated.'),
                tags$li('NA - There is no presence of this species in the watershed, therefore habitat modeling is non-applicable')
            ),
            tags$p('The “Docs” link for each watershed provides detailed descriptions of how the habitat modeling was used to generate habitat input values for the DSMs.'),
        ),

        mainPanel(
            DT::dataTableOutput("availability_table") 
        )
    )
))
















