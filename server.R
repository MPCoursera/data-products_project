shinyServer(function(input, output, session) {
    observe({
        pack <- input$package_select
        choices <- d.sets[[pack]]
        updateSelectInput(session, 'data_select', choices=choices, selected=choices[1])
    })

    current.dset <- reactive({
        pack <- isolate(input$package_select)
        name <- input$data_select
        data(list=name, package=pack)
        get(name)
    })

    output$plot_default <- renderPlot({
        dset <- current.dset()
        res <- tryCatch(plot(dset), error=function(e) {message(e);NA})
        validate(need(is.null(res), "Plotting encountered an error. Please choose another dataset."))
    })

    output$summary_table <- renderPrint({
        dset <- current.dset()
        summary(dset)
    })

    output$how_to <- renderText({
        pack <- isolate(input$package_select)
        name <- input$data_select
        sprintf('data(%s, package="%s")', name, pack)
    })

})
