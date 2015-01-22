shinyUI(
    fluidPage(
        titlePanel("Data browser"),
        p("Browse the data sets available in this installation."),
        sidebarLayout(
            sidebarPanel(
                selectInput('package_select', strong('Package'),
                            choices=packs, selected=packs[1]),
                selectInput('data_select', strong('Data set'),
                            choices=d.sets[[1]]),
                strong('Load in R'),
                textOutput('how_to')
            ),
            mainPanel(
                h3('Summary'),
                verbatimTextOutput('summary_table'),
                h3('Default plot'),
                plotOutput('plot_default')
            )
        )
    )
)
