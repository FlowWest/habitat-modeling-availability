shinyServer(function(input, output, session) {
  selected_dataset <- reactive({
    df <- switch(input$species, 
                 "Fall Run" = fall_run, 
                 "Late Fall Run" = late_fall_run,
                 "Spring Run" = spring_run, 
                 "Winter Run" = winter_run, 
                 "Steelhead" = steelhead)
  })
  
  # show_regional_approx_note <- reactive({
  #   "FALSE*" %in% purrr::flatten_chr(selected_dataset())
  # })
  
  output$availability_table <- DT::renderDataTable({
    d <- as.data.frame(selected_dataset()[, -1]) 
    rownames(d) <- selected_dataset()$watershed
    
    d$`Reference` <- createLink(d$href, "Docs")
    d <- select(d, -href)  
    datatable(d, rownames = TRUE, 
              options = list(pageLength = 15, lengthMenu = list(c(15, -1), c("15", "All")), dom = 'tip'), 
              selection = list(mode = "single", target = "cell"), 
              escape = FALSE) %>% 
      formatStyle(
        columns = colnames(d),
        backgroundColor = styleEqual(c("TRUE", "FALSE", "N/A"), 
                                     c("#b7e1cd", "#f4c7c3", "#b7b7b7")) 
      )
    
  })


})
