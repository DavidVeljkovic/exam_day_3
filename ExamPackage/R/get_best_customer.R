#' get_best_customer
#'
# Description
#' Function that calculates the customer with the best monthly return for a given date.
#'
#' @details
#' \code{data} contains the transaction data. The data set must contain a
#'             column labeled "Customer" that allows unique customer identification
#'             and a column labeled "TransDate", indicating the purchase date.
#'             The column "PurchAmount" specifies the total spending per purchase.
#'
# Arguments
#' @param x a data object with columns TransDate, Customer, PurchAmount, Cost
#' @param date a specification for the time of interest. Must be of format "yyyy-mm-dd"
#'
# Returned values
#' @return The Customer with the highest profit for a given date \code{time} of data \code{x}
#'
# Examples
#' @examples
#' get_best_customer(transactions, date="2008-10-01")
#' get_best_customer(transactions, date="2008-01-01")
#'
#' @export
#' @import data.table
#' @importFrom lubridate ymd floor_date

# function
get_best_profit <- function(x, date){
  # transform data
  x <- data.table(x)
  x$TransDate <-  dmy(x$TransDate, tz="UTC")

  #calculate floor date
  x$TransDate_floor <- floor_date(x$TransDate, "month")
  #calculate floor date
  date_floor <- floor_date(ymd(date, tz="UTC"), "month")

  # calculate profit per customer
  x$Profit_Customer <-  x$PurchAmount - x$Cost

  # sum profit per unit
  x_profit_unit <- x[, list(Profit_Customer_floor= sum(Profit_Customer)), by=.(Customer, TransDate_floor)]

  # time unit
  x_profit_unit_time <- x_profit_unit[TransDate_floor == date_floor]

  # best customer
  Best_Profit <- max(x_profit_unit_time $Profit_Customer_floor)
  Best_Custsomer <- x_profit_unit_time [Profit_Customer_floor==Best_Profit, Customer]

  results <- list(date, Best_Custsomer, Best_Profit)
  names(results) <- c("Best custsomer", "Best profit")
  return(results)
}

