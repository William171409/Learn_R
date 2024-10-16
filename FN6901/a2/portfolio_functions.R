### 2.2.3

# Function to calculate Maximum Drawdown
max_drawdown <- function(cumret) {
  # Calculate the running maximum
  running_max <- cummax(cumret)
  # Calculate drawdowns
  drawdowns <- (cumret - running_max) / running_max
  # Find the maximum drawdown
  max_drawdown_value <- min(drawdowns)
  return(max_drawdown_value)
}


### 2.2.4.1

# Function to rank ETFs dynamically based on their cumulative returns (PnL)
dynamic_ranking_pnl <- function(daily_ret, all_tickers) {
  # Initialize a list to store rankings for each day
  rankings_list <- list()
  
  # Loop through each day in daily_ret
  for (day in 1:nrow(daily_ret)) {
    # Calculate total returns for the current day
    total_returns <- sapply(all_tickers[-length(all_tickers)], function(ticker) {
      last_cumret <- daily_ret[day, paste0(ticker, "_cumret")]
      last_cumret - 1  # Total return as (Cumulative Return - 1)
    })
    
    # Ensure that total returns are numeric and valid
    total_returns <- as.numeric(total_returns)
    
    # Create a data frame for easier handling
    total_returns_df <- data.frame(
      ETF = all_tickers[-length(all_tickers)],
      Total_Return = total_returns
    )
    
    # Rank the ETFs based on total returns
    ranked_etfs <- total_returns_df[order(-total_returns_df$Total_Return), ]
    
    # Store the rankings with the date
    rankings_list[[day]] <- data.frame(Date = daily_ret$Date[day], ranked_etfs)
  }
  
  # Combine all daily rankings into a single data frame
  dynamic_rankings_df <- do.call(rbind, rankings_list)
  return(dynamic_rankings_df)
}
