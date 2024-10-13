library(shiny)
library(tidyverse)
library(conflicted)

conflict_prefer("lag", "dplyr")
conflict_prefer("filter", "dplyr")

# Define UI for the application
ui <- fluidPage(
  titlePanel("Corona Virus Antibody Tests Visualizer"),

  sidebarLayout(
    sidebarPanel(
      numericInput("infection_rate", "Enter Infection Rate (%):",
                   value = 5, min = 0, max = 100, step = 0.1),
      actionButton("plot_button", "Plot"),
      helpText("Infection rate must be between 0 and 100.")
    ),

    mainPanel(
      plotOutput("sensiPlot")
    )
  )
)

# Define server logic required to plot the sensitivity and specificity
server <- function(input, output, session) {

  observeEvent(input$plot_button, {

    # Validate user input
    if (is.na(input$infection_rate) || input$infection_rate <= 0 || input$infection_rate > 100) {
      showNotification("Please enter a valid infection rate between 0 and 100.", type = "error")
    } else {
      total_population <- 500
      sensitivity <- 0.95
      specificity <- 0.95
      infection_rate <- input$infection_rate / 100

      # Calculate Actual Positives, False Negatives, False Positives, and Actual Negatives
      actual_pos <- round(total_population * infection_rate)
      actual_neg <- total_population - actual_pos
      true_pos <- round(actual_pos * sensitivity)
      false_neg <- actual_pos - true_pos
      true_neg <- round(actual_neg * specificity)
      false_pos <- actual_neg - true_neg
      
      df_sensi <- full_join(
        tibble(x = 1:25, color = "Actual Neg"),
        tibble(y = 1:20, color = "Actual Neg"),
        by = "color", relationship = "many-to-many")

      df_sensi$color <- c(
          rep("False Neg", round(false_neg)),
          rep("Actual Pos", round(true_pos)),
          rep("False Pos", round(false_pos)),
          rep("Actual Neg", round(true_neg))
        )

      output$sensiPlot <- renderPlot({
        ggplot(df_sensi) +
          geom_point(aes(x, y, colour = color), size = 4, shape = "circle") +
          theme_bw() +
          theme(
            axis.title.x = element_blank(),
            axis.title.y = element_blank(),
            axis.line = element_blank(),
            axis.text.x = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks = element_blank()
          )
      })
    }
  })
}

shinyApp(ui = ui, server = server)

