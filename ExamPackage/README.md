
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ExamPackage

<!-- badges: start -->
<!-- badges: end -->

Function that calculates the customer with the best return for a given
time period.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ExamPackage)
best_customer(transactions, unit="quarter", time="2008-10-01")
#> $Time
#> [1] "2008-10-01"
#> 
#> $`Time unit`
#> [1] "quarter"
#> 
#> $`Best custsomer`
#> [1] 104931
#> 
#> $`Best profit`
#> [1] 23051.22
```
