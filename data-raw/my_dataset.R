## code to prepare `my_dataset` dataset goes here

my_dataset <- readr::read_csv("~/ThinkR Training/tweet_activity.csv")
usethis::use_data(my_dataset, overwrite = TRUE)
