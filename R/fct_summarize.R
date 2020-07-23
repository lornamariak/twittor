summarize <- function(dataset){
  total_tweets <- nrow(dataset)
  total_engage<- sum(dataset$engagements)
  total_impress <- sum (dataset$impressions)
  total_retweets <- sum(dataset$retweets)
  tagList(
    h2("Summary of tweets"),

  tags$li(glue::glue("Total tweets: {total_tweets}")),
  tags$li(glue::glue("Total Engagement: {total_engage}")),
  tags$li(glue::glue("Total Impressions: {total_impress}")),
  tags$li(glue::glue("Total Retweets: {total_retweets}"))


  )
}


