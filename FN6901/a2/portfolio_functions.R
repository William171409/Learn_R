### 2.2.3

# Function to calculate Maximum Drawdown
max_drawdown <- function(cumret) {
  # Calculate the running maximum
  cumret <- cumret[cumret != 0]
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



### 3.3 EW Portfolio Rebalance - Calculation of cumret of ETFs
# Function to calculate EW portfolio cumulative returns with rebalancing
ew_rebalance_calculation <- function(daily_ret, loc_ret, loc_cumret,rebal_days,rebal_scheme) {
  
  # Ensure dimensions of loc_ret and loc_cumret are the same
  if (length(loc_ret) != length(loc_cumret)) {
    stop("Dimensions of loc_ret and loc_cumret must be the same.")
  }
  
  # Ensure the rebalancing scheme is valid
  rebal_scheme <- tolower(rebal_scheme)  # Convert scheme to lowercase for validation
  valid_schemes <- c("d", "q", "y")  # 'd' for daily, 'q' for quarterly, 'y' for yearly
  
  if (!(rebal_scheme %in% valid_schemes)) {
    stop("Invalid rebalancing scheme. Choose from 'd', 'q', or 'y'.")
  }
  
  # Capitalize the first letter for the rebalancing scheme
  rebal_scheme_name <- switch(rebal_scheme,
                              "d" = "Daily",
                              "q" = "Quarterly",
                              "y" = "Yearly")
  

  len_invest <- length(loc_ret)  # Number of ETFs
  w0 <- rep(1 / len_invest, len_invest)  # Initial equal weights
  prev_cumret <- matrix(w0, 1, len_invest)  # Initialize previous cumulative return as the weights
  
  # Loop through each day to calculate cumulative returns
  for (ii in 1:nrow(daily_ret)) {
    # Update cumulative returns based on previous day
    daily_ret[ii, loc_cumret] <- prev_cumret * as.matrix(1 + daily_ret[ii, loc_ret])
    
    # Rebalance on the specified rebalancing days
    if (ii %in% rebal_days) {
      port_sum <- sum(daily_ret[ii, loc_cumret])  # Sum of cumulative returns for the day
      # Equal-weight the portfolio across all ETFs
      daily_ret[ii, loc_cumret] <- matrix(rep(port_sum, len_invest) / len_invest, 1, len_invest)
    }
    
    # Store cumulative returns for the next iteration
    prev_cumret <- as.matrix(daily_ret[ii, loc_cumret])
  }
  
  ew_cumret_col <- paste0("EW_", rebal_scheme_name, "_cumret")
  ew_daily_col <- paste0("EW_", rebal_scheme_name)
  
  # Calculate EW  cumulative return and EW return based on rebal_scheme
  daily_ret[ew_cumret_col] <- rowSums(as.matrix(daily_ret[loc_cumret]))
  daily_ret[ew_daily_col] <- ret_from_cumret(daily_ret[,ew_cumret_col, drop = TRUE])
  
  return(daily_ret)
}



### 2.2.4.1.2

plot_dynamic_rankings_pnl <- function(dynamic_rankings_pnl_df) {
  
  # print(dynamic_rankings_pnl_df)
  # 
  # print(dynamic_rankings_pnl_df %>% 
  #         group_by(Date) %>% 
  #         mutate(Rank = rank(-Total_Return)))
  
  # Process: Rank ETFs by Total_Return, descending
  dynamic_rankings_pnl_df %>% 
    group_by(Date) %>% 
    mutate(Rank = rank(-Total_Return)) %>%
    
    # Plot the dynamic rankings
    ggplot(aes(x = Date, y = ETF, fill = Rank)) +
    geom_tile() +
    scale_fill_viridis_c(option = "C", direction = -1) +  # Reverse color scale
    labs(title = "Dynamic ETF Rankings Over Time",
         x = "Date",
         y = "ETF",
         fill = "Rank (1 is top)") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

# Example usage:
# plot_dynamic_rankings_pnl(dynamic_rankings_pnl_df)



### 2.2.4.2

plot_max_drawdown_ranking <- function(daily_ret, all_tickers) {
  # Calculate the max drawdowns for each ETF and rank them
  max_drawdowns_df <- tibble(ETF = all_tickers[-length(all_tickers)]) %>%
    # Use mutate to calculate the max drawdown for each ETF
    mutate(Max_Drawdown = sapply(ETF, function(ticker) {
      cumret <- daily_ret[[paste0(ticker, "_cumret")]]
      max_drawdown(cumret)
    })) %>%
    # Arrange by Max_Drawdown to rank from most risky to less risky
    arrange(Max_Drawdown) %>%
    mutate('rank' = row_number())
  
  # Print the processed max_drawdowns_df
  print(max_drawdowns_df)
  
  # Create the bar plot for max drawdowns
  ggplot(max_drawdowns_df, aes(x = reorder(ETF, -rank), y = Max_Drawdown * 100, fill = as.factor(rank))) +
    geom_bar(stat = "identity", show.legend = FALSE) +
    coord_flip() +  # Flip coordinates to make it horizontal
    labs(title = "Ranking of ETFs by Maximum Drawdown",
         x = "ETF",
         y = "Max Drawdown (%)") +
    scale_fill_brewer(palette = "Spectral") +  # Use a color palette for ranking
    theme_minimal(base_size = 15)
}

# Example usage:
# plot_max_drawdown_ranking(daily_ret, all_tickers)



### 4.1

ew_fama_rebalance_calculation <- function(daily_ret_ff, loc_ret_matrix, loc_cumret_matrix, rebal_days, fitting_months, all_tickers){
  fitting_period <- 1:rebal_days[fitting_months]
  alphas <- c()
  for (i in 1:(length(all_tickers) - 1)) {
    ticker <- all_tickers[i]
    ff_lreg <- lm(paste0(ticker, " ~ `Mkt-RF` + SMB + HML"),
                  data = daily_ret_ff[fitting_period, ])
    alphas <- c(alphas, as.numeric(ff_lreg$coefficients[1]))
  }
  names(alphas) <- head(all_tickers, -1)
  top_indices <- order(alphas, decreasing = TRUE)[1:5]
  
  prev_cumret <- rep(0, length(alphas))
  prev_cumret[top_indices] <- 1/5
  prev_cumret <- matrix(prev_cumret,1,length(prev_cumret))
  
  # Loop through each day to calculate cumulative returns
  for (ii in 1:nrow(daily_ret_ff)) {
    if (ii<rebal_days[fitting_months]){
      next
    }
    # Update cumulative returns based on previous day
    daily_ret_ff[ii, loc_cumret_matrix] <- prev_cumret * as.matrix(1 + daily_ret[ii, loc_ret_matrix])
    
    # Rebalance on the specified rebalancing days
    if (ii %in% rebal_days) {
      if(ii!=rebal_days[fitting_months]){
        port_sum <- sum(daily_ret_ff[ii, loc_cumret_matrix],na.rm = TRUE)  # Sum of cumulative returns for the day
        fitting_period <- (ii-62):ii #consider to avoid magic number
        alphas <- c()
        for (i in 1:(length(all_tickers) - 1)) {
          ticker <- all_tickers[i]
          ff_lreg <- lm(paste0(ticker, " ~ `Mkt-RF` + SMB + HML"),
                        data = daily_ret_ff[fitting_period, ])
          alphas <- c(alphas, as.numeric(ff_lreg$coefficients[1]))
        }
        names(alphas) <- head(all_tickers, -1)
        top_indices <- order(alphas, decreasing = TRUE)[1:5]
        
        loc_cumret <- rep(0, length(alphas))
        loc_cumret[top_indices] <- 1/5*port_sum
        daily_ret_ff[ii, loc_cumret_matrix] <- matrix(loc_cumret,1,length(loc_cumret))
      }
    }
    # Store cumulative returns for the next iteration
    prev_cumret <- as.matrix(daily_ret_ff[ii, loc_cumret_matrix])
  }
  
  # Calculate EW_Fama cumulative return and daily return
  daily_ret_ff['EW_Fama_cumret'] <- rowSums(as.matrix(daily_ret_ff[loc_cumret_matrix]), na.rm = FALSE)
  
  # Since first 3 months are all reserved in cash, let us simply assign 
  # the values of EW_Fama_cumulative return to be 1 before the first fama-selection date.
  # Assign initial value of 1 to the first 3 months (before rebalancing starts)
  daily_ret_ff[1:(rebal_days[fitting_months] - 1), 'EW_Fama_cumret'] <- 1
  
  # Calculate EW_Fama daily returns from cumulative returns
  daily_ret_ff['EW_Fama'] <- ret_from_cumret(daily_ret_ff[, 'EW_Fama_cumret', drop = TRUE])
  
  return(daily_ret_ff)
  
}
  