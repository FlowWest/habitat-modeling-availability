shinyServer(function(input, output, session) {
  
  observeEvent(input$region, {
               watersheds_in_region <- 
                 regions_lookup %>% filter(Region %in% input$region) %>% 
                 pull(watershed)
               
               updateSelectInput(session, "watershed", selected = watersheds_in_region)}
               )
  
  selected_dataset <- reactive({
    df <- switch(input$species, 
                 "Fall Run" = fall_run, 
                 "Spring Run" = spring_run, 
                 "Steelhead" = steelhead)
    
    df %>% 
      filter(watershed %in% input$watershed)
  })
  
  output$availability_table <- DT::renderDataTable({
    d <- as.data.frame(selected_dataset()[, -1])
    rownames(d) <- selected_dataset()$watershed
    
    d$`Reference` <- createLink(d$href, "Docs")
    d <- select(d, -href, -Region)  
    datatable(d, rownames = TRUE, 
              options = list(dom = "t"), 
              selection = list(mode = "single", target = "cell"), 
              escape = FALSE) %>% 
      formatStyle(
        columns = colnames(d),
        backgroundColor = styleEqual(c("TRUE", "FALSE", "N/A", "FALSE*"), 
                                     c("#b7e1cd", "#f4c7c3", "#b7b7b7", "#ebe68a"))
      )
    
  })

})
