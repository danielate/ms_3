

ui <- navbarPage(
    "Gender inequality for Women in the Informal Economy in Latin America",
    tabPanel("About", 
             titlePanel("About"),
             h3("Project Background and Motivations"),
             p("Identity has several dimensions, including gender, race, sexuality, and class, 
             and these intersecting links influence a person’s daily life.
             Therefore, a gender analysis that utilizes an intersectional lens 
             is essential to designing and implementing equitable international 
             development projects. This project aims to compare markers of gender 
             inequality with data on women workers in the informal economy in Latin A
             merica, with the goal of analyzing how this already vulnerable group is 
             restricted by issues of race, class, gender and culture.
"),
             h3("About Me"),
             p("My name is Daniela Teran and I am a Masters in Design Engineering candidate, 2020. 
             You can reach me at dteran@mde.harvard.edu.")),
    tabPanel("Discussion",
             titlePanel("Discussion Title"),
             p("Tour of the modeling choices you made and 
              an explanation of why you made them")),
    tabPanel("Model",
             fluidPage(
                 titlePanel("Access to education"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput(
                             "plot_type",
                             "Plot Type",
                             c("Option A" = "a", "Option B" = "b")
                         )),
                     mainPanel(plotOutput("line_plot")))
             )))


server <- function(input, output) {
    output$line_plot <- renderPlot({
        # generate type based on input$plot_type from ui
        ifelse(
            input$plot_type == "a",
            # if input$plot_type is "a", plot histogram of "waiting" column 
            # from the faithful dataframe
            x   <- faithful[, 2],
            # if input$plot_type is "b", plot histogram of "eruptions" column
            # from the faithful dataframe
            x   <- faithful[, 1]
        )
        # draw the histogram with the specified number of bins
        hist(x, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
