#' top UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_top_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Top metrics"),
    tags$div(
    h3("Top Impressions"),
    DT::dataTableOutput(ns("impressions"), width = "auto", height = "auto")
    ),
    tags$div(
      h3("Top Engagement"),
      DT::dataTableOutput(ns("engagement"), width = "auto", height = "auto")
    ),
    tags$div(
      h3("Top Retweets"),
      DT::dataTableOutput(ns("retweets"), width = "auto", height = "auto")
    ),
    tags$div(
      h3("Top Likes"),
      DT::dataTableOutput(ns("likes"), width = "auto", height = "auto")
    )

  )
}

#' top Server Function
#'
#' @noRd
mod_top_server <- function(input, output, session, choice, r){
  ns <- session$ns
 output$impressions <- DT::renderDataTable({
  req(r$tweets)
  choice$topimpress(r$tweets)
 }
 )
 output$engagement <- DT::renderDataTable({
   req(r$tweets)
   choice$topengage(r$tweets)
 }
 )

 output$retweets <- DT::renderDataTable({
   req(r$tweets)
   choice$topretweet(r$tweets)
 }
 )
 output$likes <- DT::renderDataTable({
   req(r$tweets)
   choice$toplike(r$tweets)
 }
 )

}

## To be copied in the UI
# mod_top_ui("top_ui_1")

## To be copied in the server
# callModule(mod_top_server, "top_ui_1")

