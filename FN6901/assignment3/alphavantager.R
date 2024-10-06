library(shiny)
library(alphavantager)

alphavantage_key <- "SOOVBPKYDOQUGMSF"
av_api_key(alphavantage_key)

# Define the UI
ui <- fluidPage(
  titlePanel("US Stock Data Downloader"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("ticker", "Enter US Stock Ticker", value = "MSFT"),
      actionButton("download", "Download Data and Plot"),
      br(),
      h5("Downloaded data will be saved as RDS file in the current directory.")
    ),
    
    mainPanel(
      plotOutput("stockPlot"),
      verbatimTextOutput("statusMessage")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  observeEvent(input$download, {
    ticker <- toupper(input$ticker)
    output$statusMessage <- renderText("Fetching data...")
    
    df_res <- tryCatch({
      av_get(ticker, av_fun = "TIME_SERIES_WEEKLY_ADJUSTED", outputsize = "compact")
    }, error = function(e) {
      NULL  
    })
    
    if (!is.null(df_res)) {
      saveRDS(df_res, file = paste0(ticker, ".Rds"))
      output$statusMessage <- renderText(paste("Data for", ticker, "saved as", paste0(ticker, ".Rds")))
      
      # Plot the data
      output$stockPlot <- renderPlot({
        plot(df_res$timestamp, df_res$adjusted_close, type = "l", col = "blue", 
             main = paste("Adjusted Close Price of", ticker), 
             xlab = "Date", ylab = "Adjusted Close Price")
      })
    } else {
      output$statusMessage <- renderText(paste("Failed to fetch data for ticker:", ticker))
      output$stockPlot <- renderPlot(NULL)
    }
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
