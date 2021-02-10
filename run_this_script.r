# Set your working directory to the cloned repository
sapply(list.files("ExamPackage/R/", full.names = TRUE), source)
load("ExamPackage/data/transactions.rda")

get_best_profit(x=transactions, date = "2008-10-01")
